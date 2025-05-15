local Core, CoreName, CurrentRoom, currentArgs = nil, nil, nil, nil

if GetResourceState('qb-core') == 'started' then
    Core = exports['qb-core']:GetCoreObject()
    while Core == nil do
        TriggerEvent('QBCore:GetObject', function(obj) Core = obj end)
        Wait(30)
    end
    CoreName = 'qb-core'
elseif GetResourceState('qbx_core') == 'started' then
    Core = exports['qbx_core']:GetCoreObject()
    CoreName = 'qb-core'
elseif GetResourceState('es_extended') == 'started' then
    Core = exports['es_extended']:getSharedObject()
    while Core == nil do
        TriggerEvent('esx:getSharedObject', function(obj) Core = obj end)
        Wait(30)
    end
    CoreName = 'es_extended'
else
    Core = 'not_found'
    CoreName = 'standlone'
end

-- Function's
function TriggerCallback(name, ...)
    local id = GetRandomIntInRange(0, 999999)
    local eventName = "Jakrino_Hotels:TC:" .. id
    local eventHandler
    local promise = promise:new()
    RegisterNetEvent(eventName)
    local eventHandler = AddEventHandler(eventName, function(...)
        promise:resolve(...)
    end)

    SetTimeout(15000, function()
        promise:resolve("timeout")
        RemoveEventHandler(eventHandler)
    end)
    local args = {...}
    TriggerServerEvent(name, id, args)

    local result = Citizen.Await(promise)
    RemoveEventHandler(eventHandler)
    return result
end

CreateThread(function()
    if CoreName == 'qb-core' then
        RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
        AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
            TriggerEvent('Jakrino_Hotels:StartUI')
        end)
    elseif CoreName == 'es_extended' then
        RegisterNetEvent('esx:playerLoaded')
        AddEventHandler('esx:playerLoaded', function()
            TriggerEvent('Jakrino_Hotels:StartUI')
        end)
    end
end)

RegisterNetEvent('onResourceStart')
AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
        while true do
            if GetResourceState(GetCurrentResourceName()) == 'started' then
                TriggerEvent('Jakrino_Hotels:StartUI')
                break;
            else
                Wait(100)
            end
        end
	end
end)

RegisterNetEvent("onResourceStop")
AddEventHandler("onResourceStop", function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
        if DoesEntityExist(CurrentRoom) then
            DeleteEntity(CurrentRoom)
            TriggerServerEvent("Jakrino_Hotels:ChangeBucket", "return")
        end
    end
end)

RegisterNetEvent('Jakrino_Hotels:StartUI')
AddEventHandler('Jakrino_Hotels:StartUI', function()

end)

RegisterNetEvent("Jakrino_Hotels:OpenMenu")
AddEventHandler("Jakrino_Hotels:OpenMenu", function(targetdata, sex)
    local index
    if targetdata and type(targetdata) == "table" then
        index = targetdata.index
    else
        index = sex
    end
    
    local database = TriggerCallback("getHotelData")
    local isOwner = false

    for _, room in ipairs(database.data[index]) do
        if room.owner == database.citizenid then
            isOwner = true
            break
        end
    end

    local coords = GetEntityCoords(PlayerPedId())
    local zone = GetNameOfZone(coords.x, coords.y, coords.z)
    local var1, var2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
    local hash1 = GetStreetNameFromHashKey(var1)
    local hash2 = GetStreetNameFromHashKey(var2)

    local street2;
    if (hash2 == '') then
      street2 = GetLabelText(zone)
    else
      street2 = hash2..', '..GetLabelText(zone)
    end
    
    lib.registerContext({
        id = 'babapromenu',
        title = street2 .. " Hotels",
        options = {
            {
                title = Locales[Config.Locales]["Rooms"],
                description = Locales[Config.Locales]["RoomsDesc"],
                icon = 'building',
                event = 'Jakrino_Hotels:AllRooms',
                args = {
                    index = index,
                    label = street2
                }
            },
            {
                title = Locales[Config.Locales]["MyRents"],
                description = Locales[Config.Locales]["MyRentsDesc"],
                icon = 'building-user',
                event = 'Jakrino_Hotels:MyRooms',
                disabled = not isOwner,
                args = {
                    index = index
                }
            }
        }
    })

    lib.showContext('babapromenu')
end)

local function GetNearest(playerCoords)
    local currentIndex, currentDistance = 0, 100000
    for xIndex, xCoords in pairs(Config.Locations) do
        local distance = #(playerCoords - vector3(xCoords.pedSettings.coord.x, xCoords.pedSettings.coord.y, xCoords.pedSettings.coord.z))
        if currentDistance > distance then
            currentDistance = distance
            currentIndex = xIndex
        end
    end
    return currentIndex, currentDistance
end

RegisterNetEvent("Jakrino_Hotels:AllRooms")
AddEventHandler("Jakrino_Hotels:AllRooms", function(args)
    local OpOp = {}
    local rooms = TriggerCallback("GetHotel", args.index)
    local roomTypes = {}

    for index, data in pairs(rooms) do
        local roomType = data.type
        if not roomTypes[roomType] then
            roomTypes[roomType] = { available = 0, rented = 0 }
        end
        if data.owner == "" or not data.owner then
            roomTypes[roomType].available = roomTypes[roomType].available + 1
        else
            roomTypes[roomType].rented = roomTypes[roomType].rented + 1
        end
    end

    for roomType, countData in pairs(roomTypes) do
        table.insert(OpOp, {
            title = Config.Types[roomType].roomLabel,
            description = Locales[Config.Locales]["Available"] .. countData.available .. Locales[Config.Locales]["Rented"] .. countData.rented,
            icon = 'globe',
            image = Config.Types[roomType].roomImage,
            event = 'Jakrino_Hotels:RentARoomMenu',
            args = {
                index = args.index,
                roomtype = roomType
            }
        })
    end

    lib.registerContext({
        id = 'babapromenuall',
        title = args.label.." Hotel ".."Rooms",
        options = OpOp
    })
    lib.showContext('babapromenuall')
end)

RegisterNetEvent("Jakrino_Hotels:RentARoomMenu")
AddEventHandler("Jakrino_Hotels:RentARoomMenu", function(args)
    local mergedString = Locales[Config.Locales]["BuyRoom"]:gsub("/s/", Config.Types[args.roomtype].roomPrice)
    currentArgs = args
    lib.registerContext({
        id = 'babapromenurentmenu',
        title = Config.Types[args.roomtype].roomLabel,
        options = {
            {
                title = mergedString,
                description = Locales[Config.Locales]["BuyRoomDesc"],
                icon = 'credit-card',
                event = 'Jakrino_Hotels:RentARoom',
                args = {
                    index = args.index,
                    roomtype = args.roomtype
                }
            },
            {
                title = Locales[Config.Locales]["Check"],
                description = Locales[Config.Locales]["CheckDesc"],
                icon = 'door-open',
                event = 'Jakrino_Hotels:CheckRoom',
                args = {
                    index = args.index,
                    roomtype = args.roomtype
                }
            }
        }
    })

    lib.showContext('babapromenurentmenu')
end)

RegisterNetEvent("Jakrino_Hotels:CheckRoom")
AddEventHandler("Jakrino_Hotels:CheckRoom", function(args)
    local playerPed = PlayerPedId()
    local entityCoords = GetEntityCoords(playerPed)
    local entityHeading = GetEntityHeading(playerPed)
    oldcoords = vector4(entityCoords.x, entityCoords.y, entityCoords.z, entityHeading)
    local hash = GetHashKey(Config.Types[args.roomtype].roomShell)
    lib.requestModel(hash)
    CurrentRoom = CreateObjectNoOffset(hash, Config.Locations[args.index].pedSettings.coord.x, Config.Locations[args.index].pedSettings.coord.y, Config.Locations[args.index].pedSettings.coord.z - 50.0, false, false, false)
    FreezeEntityPosition(CurrentRoom, true)
    SetEntityHeading(CurrentRoom, 0.0)
    SetModelAsNoLongerNeeded(CurrentRoom)
    TriggerServerEvent("Jakrino_Hotels:ChangeBucket", "random")
    SetEntityCoords(playerPed, Config.Locations[args.index].pedSettings.coord.x + Config.Types[args.roomtype].doorOffset.x, Config.Locations[args.index].pedSettings.coord.y + Config.Types[args.roomtype].doorOffset.y, Config.Locations[args.index].pedSettings.coord.z - 50 + Config.Types[args.roomtype].doorOffset.z)
    SetEntityHeading(playerPed, Config.Types[args.roomtype].doorOffset.w)
    SetGameplayCamRelativeHeading(0)
    TriggerEvent("Jakrino_Hotels:WhileInPreview", vector4(Config.Locations[args.index].pedSettings.coord.x + Config.Types[args.roomtype].doorOffset.x, Config.Locations[args.index].pedSettings.coord.y + Config.Types[args.roomtype].doorOffset.y, Config.Locations[args.index].pedSettings.coord.z - 50 + Config.Types[args.roomtype].doorOffset.z, Config.Types[args.roomtype].doorOffset.w))
end)

RegisterNetEvent("Jakrino_Hotels:ExitPreview")
AddEventHandler("Jakrino_Hotels:ExitPreview", function()
    InPreview = false
    SetEntityCoords(PlayerPedId(), oldcoords.x, oldcoords.y, oldcoords.z)
    SetEntityHeading(PlayerPedId(), oldcoords.w)
    SetGameplayCamRelativeHeading(0)
    local mergedString = Locales[Config.Locales]["BuyRoom"]:gsub("/s/", Config.Types[currentArgs.roomtype].roomPrice)

    lib.registerContext({
        id = 'babapromenurentmenu',
        title = Config.Types[currentArgs.roomtype].roomLabel,
        options = {
            {
                title = mergedString,
                description = Locales[Config.Locales]["BuyRoomDesc"],
                icon = 'credit-card',
                event = 'Jakrino_Hotels:RentARoom',
                args = {
                    index = currentArgs.index,
                    roomtype = currentArgs.roomtype
                }
            },
            {
                title = Locales[Config.Locales]["Check"],
                description = Locales[Config.Locales]["CheckDesc"],
                icon = 'door-open',
                event = 'Jakrino_Hotels:CheckRoom',
                args = {
                    index = currentArgs.index,
                    roomtype = currentArgs.roomtype
                }
            }
        }
    })

    lib.showContext('babapromenurentmenu')
    if DoesEntityExist(CurrentRoom) then
        DeleteEntity(CurrentRoom)
        TriggerServerEvent("Jakrino_Hotels:ChangeBucket", "return")
        CurrentRoom = nil
    end
end)

RegisterNetEvent("Jakrino_Hotels:RentARoom")
AddEventHandler("Jakrino_Hotels:RentARoom", function(args)
    local bool = TriggerCallback("Available", args.index, args.roomtype)
    if bool == 'nomoney' then
        Config.Notification(Locales[Config.Locales]['NoMoney'])
    elseif bool == 'noroom' then
        Config.Notification(Locales[Config.Locales]['NoRoom'])
    else
        currentArgs = args
        local playerPed = PlayerPedId()
        local entityCoords = GetEntityCoords(playerPed)
        local entityHeading = GetEntityHeading(playerPed)
        oldcoords = vector4(entityCoords.x, entityCoords.y, entityCoords.z, entityHeading)
        local hash = GetHashKey(Config.Types[args.roomtype].roomShell)
        lib.requestModel(hash)
        CurrentRoom = CreateObjectNoOffset(hash, Config.Locations[args.index].pedSettings.coord.x, Config.Locations[args.index].pedSettings.coord.y, Config.Locations[args.index].pedSettings.coord.z - 50.0, false, false, false)
        FreezeEntityPosition(CurrentRoom, true)
        SetEntityHeading(CurrentRoom, 0.0)
        SetModelAsNoLongerNeeded(CurrentRoom)
        SetEntityCoords(playerPed, Config.Locations[args.index].pedSettings.coord.x + Config.Types[args.roomtype].doorOffset.x, Config.Locations[args.index].pedSettings.coord.y + Config.Types[args.roomtype].doorOffset.y, Config.Locations[args.index].pedSettings.coord.z - 50 + Config.Types[args.roomtype].doorOffset.z)
        SetEntityHeading(playerPed, Config.Types[args.roomtype].doorOffset.w)
        SetGameplayCamRelativeHeading(0)
        TriggerEvent("Jakrino_Hotels:WhileInHotel", vector4(Config.Locations[args.index].pedSettings.coord.x + Config.Types[args.roomtype].doorOffset.x, Config.Locations[args.index].pedSettings.coord.y + Config.Types[args.roomtype].doorOffset.y, Config.Locations[args.index].pedSettings.coord.z - 50 + Config.Types[args.roomtype].doorOffset.z, Config.Types[args.roomtype].doorOffset.w), vector4(Config.Locations[args.index].pedSettings.coord.x + Config.Types[args.roomtype].stashOffset.x, Config.Locations[args.index].pedSettings.coord.y + Config.Types[args.roomtype].stashOffset.y, Config.Locations[args.index].pedSettings.coord.z - 50 + Config.Types[args.roomtype].stashOffset.z, Config.Types[args.roomtype].stashOffset.w), vector4(Config.Locations[args.index].pedSettings.coord.x + Config.Types[args.roomtype].clothOffset.x, Config.Locations[args.index].pedSettings.coord.y + Config.Types[args.roomtype].clothOffset.y, Config.Locations[args.index].pedSettings.coord.z - 50 + Config.Types[args.roomtype].clothOffset.z, Config.Types[args.roomtype].clothOffset.w))
    end
end)

RegisterNetEvent("Jakrino_Hotels:HotelManage")
AddEventHandler("Jakrino_Hotels:HotelManage", function()
    lib.registerContext({
        id = 'babapromenumanagemenu',
        title = Config.Types[currentArgs.roomtype].roomLabel,
        options = {
            {
                title = Locales[Config.Locales]["Invite"],
                description = Locales[Config.Locales]["InviteDesc"],
                icon = 'user',
                event = 'Jakrino_Hotels:InviteMenu',
                args = {
                    roomtype = currentArgs.roomtype
                }
            },
            {
                title = Locales[Config.Locales]["Quit"],
                description = Locales[Config.Locales]["QuitDesc"],
                icon = 'door-open',
                event = 'Jakrino_Hotels:Quit'
            }
        }
    })

    lib.showContext('babapromenumanagemenu')
end)

RegisterNetEvent("Jakrino_Hotels:Quit")
AddEventHandler("Jakrino_Hotels:Quit", function()
    InHotel = false
    SetEntityCoords(PlayerPedId(), oldcoords.x, oldcoords.y, oldcoords.z)
    SetEntityHeading(PlayerPedId(), oldcoords.w)
    SetGameplayCamRelativeHeading(0)
    if DoesEntityExist(CurrentRoom) then
        DeleteEntity(CurrentRoom)
        TriggerServerEvent("Jakrino_Hotels:ChangeBucket", "return")
        CurrentRoom = nil
    end
end)

RegisterNetEvent("Jakrino_Hotels:InviteMenu")
AddEventHandler("Jakrino_Hotels:InviteMenu", function(args)
    local index, distance = GetNearest(GetEntityCoords(PlayerPedId()))
    local bool = TriggerCallback("GetMembers", index)
    local opOp = {}
    table.insert(opOp, {
        title = Locales[Config.Locales]["NoPeople"],
        description = Locales[Config.Locales]["NoPeopleDesc"],
        icon = 'globe',
        disabled = true
    })
    local st = false
    for i, v in pairs(bool) do
        if not st then
            st = true
            opOp = {}
        end
        table.insert(opOp, {
            title = "("..v.id..") "..v.name,
            description = Locales[Config.Locales]["Invite2"],
            icon = 'user',
            event = 'Jakrino_Hotels:InvitePeople',
            args = {
                roomtype = args.roomtype,
                peopleid = v.id
            }
        })
    end
    lib.registerContext({
        id = 'babapromenuinvites',
        title = "Invite People",
        options = opOp
    })
    lib.showContext('babapromenuinvites')
end)

RegisterNetEvent("Jakrino_Hotels:InvitePeople")
AddEventHandler("Jakrino_Hotels:InvitePeople", function(args)
    TriggerServerEvent("Jakrino_Hotels:InvitedPlayer", args.roomtype, args.peopleid)
end)

RegisterNetEvent("Jakrino_Hotels:MyRooms")
AddEventHandler("Jakrino_Hotels:MyRooms", function(args)
    local database = TriggerCallback("getHotelData")
    local opOp = {}
    
    local function kalanZamanHesapla(start, current, gun)
        local bitisZamani = start + (gun * 86400)
        local kalanSure = bitisZamani - current
        
        if kalanSure <= 0 then
            return "timeout"
        else
            local gun = math.floor(kalanSure / 86400)
            local saat = math.floor((kalanSure % 86400) / 3600)
            local dakika = math.floor((kalanSure % 3600) / 60)
            local saniye = kalanSure % 60
            return string.format(Locales[Config.Locales]["Remainder"].."%d "..Locales[Config.Locales]["Day"]..", %02d "..Locales[Config.Locales]["Hour"]..", %02d "..Locales[Config.Locales]["Minute"]..", %02d "..Locales[Config.Locales]["Second"], gun, saat, dakika, saniye)
        end
    end

    for _, room in ipairs(database.data[args.index]) do
        if room.owner == database.citizenid then
            local kalanZaman = kalanZamanHesapla(room.start, database.ostime, room.day)
            if kalanZaman == 'timeout' then
                TriggerServerEvent("Jakrino_Hotels:ExistRoomRemove", room.id)
            else
                table.insert(opOp, {
                    title = Config.Types[room.type].roomLabel,
                    description = kalanZaman,
                    icon = 'globe',
                    image = Config.Types[room.type].roomImage,
                    event = 'Jakrino_Hotels:ManageTheRoom',
                    args = {
                        index = args.index,
                        roomid = room.id,
                        roomtype = room.type
                    }
                })
            end
        end
    end

    lib.registerContext({
        id = 'babapromenumyrooms',
        title = "My Rooms",
        options = opOp
    })
    lib.showContext('babapromenumyrooms')
end)

RegisterNetEvent("Jakrino_Hotels:ManageTheRoom")
AddEventHandler("Jakrino_Hotels:ManageTheRoom", function(args)
    lib.registerContext({
        id = 'babapromenumanagemenu',
        title = Config.Types[args.roomtype].roomLabel,
        options = {
            {
                title = Locales[Config.Locales]["Login"],
                description = Locales[Config.Locales]["LoginDesc"],
                icon = 'door-open',
                event = 'Jakrino_Hotels:LoginHotel',
                args = {
                    index = args.index,
                    roomid = args.roomid,
                    roomtype = args.roomtype
                }
            },
            {
                title = Locales[Config.Locales]["Extend"],
                description = Locales[Config.Locales]["ExtendDesc"],
                icon = 'bars',
                event = 'Jakrino_Hotels:Extend',
                args = {
                    index = args.index,
                    roomid = args.roomid,
                    roomtype = args.roomtype
                }
            }
        }
    })

    lib.showContext('babapromenumanagemenu')
end)

RegisterNetEvent("Jakrino_Hotels:Extend")
AddEventHandler("Jakrino_Hotels:Extend", function(args)
    local bool = TriggerCallback("Extend", args.index, args.roomid, args.roomtype)
    if bool == 'nomoney' then
        Config.Notification(Locales[Config.Locales]['NoMoney'])
    else
        Config.Notification(Locales[Config.Locales]['Extended'])
    end
end)

RegisterNetEvent("Jakrino_Hotels:LoginHotel")
AddEventHandler("Jakrino_Hotels:LoginHotel", function(args)
    currentArgs = args
    local playerPed = PlayerPedId()
    local entityCoords = GetEntityCoords(playerPed)
    local entityHeading = GetEntityHeading(playerPed)
    oldcoords = vector4(entityCoords.x, entityCoords.y, entityCoords.z, entityHeading)
    local hash = GetHashKey(Config.Types[args.roomtype].roomShell)
    lib.requestModel(hash)
    CurrentRoom = CreateObjectNoOffset(hash, Config.Locations[args.index].pedSettings.coord.x, Config.Locations[args.index].pedSettings.coord.y, Config.Locations[args.index].pedSettings.coord.z - 50.0, false, false, false)
    FreezeEntityPosition(CurrentRoom, true)
    SetEntityHeading(CurrentRoom, 0.0)
    SetModelAsNoLongerNeeded(CurrentRoom)
    SetEntityCoords(playerPed, Config.Locations[args.index].pedSettings.coord.x + Config.Types[args.roomtype].doorOffset.x, Config.Locations[args.index].pedSettings.coord.y + Config.Types[args.roomtype].doorOffset.y, Config.Locations[args.index].pedSettings.coord.z - 50 + Config.Types[args.roomtype].doorOffset.z)
    SetEntityHeading(playerPed, Config.Types[args.roomtype].doorOffset.w)
    SetGameplayCamRelativeHeading(0)
    TriggerServerEvent("Jakrino_Hotels:ChangeBucket", "go", args.roomid)
    TriggerEvent("Jakrino_Hotels:WhileInHotel", vector4(Config.Locations[args.index].pedSettings.coord.x + Config.Types[args.roomtype].doorOffset.x, Config.Locations[args.index].pedSettings.coord.y + Config.Types[args.roomtype].doorOffset.y, Config.Locations[args.index].pedSettings.coord.z - 50 + Config.Types[args.roomtype].doorOffset.z, Config.Types[args.roomtype].doorOffset.w), vector4(Config.Locations[args.index].pedSettings.coord.x + Config.Types[args.roomtype].stashOffset.x, Config.Locations[args.index].pedSettings.coord.y + Config.Types[args.roomtype].stashOffset.y, Config.Locations[args.index].pedSettings.coord.z - 50 + Config.Types[args.roomtype].stashOffset.z, Config.Types[args.roomtype].stashOffset.w), vector4(Config.Locations[args.index].pedSettings.coord.x + Config.Types[args.roomtype].clothOffset.x, Config.Locations[args.index].pedSettings.coord.y + Config.Types[args.roomtype].clothOffset.y, Config.Locations[args.index].pedSettings.coord.z - 50 + Config.Types[args.roomtype].clothOffset.z, Config.Types[args.roomtype].clothOffset.w))
end)

RegisterNetEvent("Jakrino_Hotels:InviteMe")
AddEventHandler("Jakrino_Hotels:InviteMe", function(roomtype, bucket, name)
    local index, distance = GetNearest(GetEntityCoords(PlayerPedId()))
    local mergedString = Locales[Config.Locales]["InvitedYou"]:gsub("/name/", name)
    lib.registerContext({
        id = 'babapromenuacceptdec',
        title = mergedString,
        options = {
            {
                title = Locales[Config.Locales]["Accept"],
                icon = 'check',
                event = 'Jakrino_Hotels:LoginHotel',
                args = {
                    index = index,
                    roomid = bucket,
                    roomtype = roomtype
                }
            },
            {
                title = Locales[Config.Locales]["Dec"],
                event = 'hebelehubelehebelehubele',
                icon = 'xmark'
            }
        }
    })
    lib.showContext('babapromenuacceptdec')
end)

RegisterNetEvent("Jakrino_Hotels:OpenStash")
AddEventHandler("Jakrino_Hotels:OpenStash", function()
    local stashId   = TriggerCallback("GetBucket")
    local stashName = "Stash"..stashId

    if Config.Inventory == 'qb-inventory'
    or Config.Inventory == 'lj-inventory'
    or Config.Inventory == 'ps-inventory'
    or Config.Inventory == 'qs-inventory' then
        TriggerEvent('inventory:openInventoryAnim')
        TriggerEvent("inventory:client:SetCurrentStash", stashName)
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stashName, {
            maxweight = Config.StashSettings.maxweight * 1000,
            slots     = Config.StashSettings.slots,
        })

    elseif Config.Inventory == 'ox_inventory'
    or Config.Inventory == 'new-ox_inventory' then
        local ox = exports['ox_inventory']
        if not ox:openInventory('stash', stashName) then
            TriggerServerEvent('Jakrino_Hotels:RegisterStash', {
                name  = stashName,
                label = stashName
            })
            ox:openInventory('stash', stashName)
        end

    elseif Config.Inventory == 'new-qb-inventory' then
        TriggerServerEvent('Jakrino_Hotels:OpenInventory', {
            label     = stashName,
            slots     = Config.StashSettings.slots,
            maxweight = Config.StashSettings.maxweight * 1000,
        })
    end
end)