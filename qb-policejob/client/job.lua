local inStash = false
local inTrash = false
local inAmoury = false

RegisterNetEvent('qb-policejob:ToggleDuty', function()
    onDuty = not onDuty
    if PlayerJob.type == 'unit' then
        TriggerServerEvent('QBCore:ToggleDuty')
        TriggerServerEvent('police:server:UpdateCurrentCops')
    end
end)

-- En yakın oyuncuyu bulmak için fonksiyon
function GetClosestPlayer()
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local plyCoords = GetEntityCoords(PlayerPedId(), 0)

    for i = 1, #players, 1 do
        local target = GetPlayerPed(players[i])
        if target ~= PlayerPedId() then
            local targetCoords = GetEntityCoords(target, 0)
            local distance = #(plyCoords - targetCoords)
            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
            end
        end
    end

    return closestPlayer, closestDistance
end

-- Polis status kontrolü
RegisterNetEvent('police:client:CheckStatus', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.type == 'unit' then
            local player, distance = GetClosestPlayer()
            if player ~= -1 and distance < 5.0 then
                local playerId = GetPlayerServerId(player)
                QBCore.Functions.TriggerCallback('police:GetPlayerStatus', function(result)
                    if result then
                        if not result[1] then
                            QBCore.Functions.Notify('Barut izine rastlanmadı!', 'error')
                        end
                        for _, v in pairs(result) do
                            QBCore.Functions.Notify(''..v..'', 'success')
                        end
                    else
                        QBCore.Functions.Notify('Barut izine rastlanmadı!', 'error')
                    end
                end, playerId)
            else
                QBCore.Functions.Notify('Yakınlarda kimse bulunamadı!', 'error')
            end
        end
    end)
end)



local function GetClosestPlayer() -- interactions, job, tracker
    local closestPlayers = QBCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(PlayerPedId())

    for i = 1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
    end

    return closestPlayer, closestDistance
end

RegisterNetEvent('police:client:SendToJail', function(time)
    TriggerServerEvent("police:server:SetHandcuffStatus", false)
    isHandcuffed = false
    isEscorted = false
    ClearPedTasks(PlayerPedId())
    DetachEntity(PlayerPedId(), true, false)
    TriggerEvent("prison:client:Enter", time)
end)

RegisterNetEvent('police:client:JailPlayer', function()
    local player, distance = QBCore.Functions.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        local dialog = exports['qb-input']:ShowInput({
            header = Lang:t('info.jail_time_input'),
            submitText = Lang:t('info.submit'),
            inputs = {
                {
                    text = Lang:t('info.time_months'),
                    name = "jailtime",
                    type = "number",
                    isRequired = true
                }
            }
        })
        if tonumber(dialog['jailtime']) > 0 then
            TriggerServerEvent("police:server:JailPlayer", playerId, tonumber(dialog['jailtime']))
        else
            QBCore.Functions.Notify(Lang:t("error.time_higher"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("error.none_nearby"), "error")
    end
end)



local allowedJobs = {
    "police", "lspd", "vespuccipd", "bcsd", "pbsd", "lssp", "lspr", "dsd", "doj", "ambulance"
}

local stashLocations = {
    [1] = vector3(485.5, -994.93, 30.62),
    [2] = vector3(-446.09, 6018.89, 36.99),
    [3] = vector3(836.12, -1287.18, 28.25),
    [4] = vector3(380.56, 799.78, 190.46),
    [5] = vector3(1839.94, 3684.86, 33.94),
    [6] = vector3(364.94, -1599.07, 25.47),
    [7] = vector3(-560.86, -185.67, 38.31),
    [8] = vector3(306.49, -601.83, 43.28),
    [9] = vector3(463.05, -980.26, 30.69),
    [10] = vector3(843.21, -1309.17, 24.32),
    [11] = vector3(1838.41, 3686.31, 34.19),

}

local function isAuthorized(job)
    for _, j in ipairs(allowedJobs) do
        if j == job then
            return true
        end
    end
    return false
end

-- Depo açma işlevi
local function openStash(stashId)
    local stashName = "police_shared_stash_"..stashId
    TriggerServerEvent("inventory:server:OpenInventory", "stash", stashName, {
        maxweight = 20000, -- 20K ağırlık
        slots = 1000, -- 1000 slot
    })
    TriggerEvent("inventory:client:SetCurrentStash", stashName)
end

-- Koordinatlar için target veya enter zone işlevi
CreateThread(function()
    for k, coords in pairs(stashLocations) do
        exports.ox_target:addSphereZone({
            coords = coords,
            radius = 1.5,
            options = {
                {
                    name = "stash"..k,
                    event = "openPoliceStash",
                    icon = "fas fa-box",
                    label = "Depoyu Aç",
                    canInteract = function()
                        local PlayerJob = QBCore.Functions.GetPlayerData().job.name
                        return isAuthorized(PlayerJob)
                    end
                }
            }
        })
    end
end)

-- Depo açma eventini dinleme
RegisterNetEvent('openPoliceStash')
AddEventHandler('openPoliceStash', function(data)
    local stashId = data.name:match("stash(%d+)")
    openStash(stashId)
end)

local allowedJobs = {
    "police", "lspd", "vespuccipd", "bcsd", "pbsd", "lssp", "lspr", "dsd", "doj", "ambulance"
}

local function isAuthorized(job)
    for _, j in ipairs(allowedJobs) do
        if j == job then
            return true
        end
    end
    return false
end

local allowedJobs = {
    "police", "lspd", "vespuccipd", "bcsd", "pbsd", "lssp", "lspr", "dsd", "doj", "ambulance"
}

local function isAuthorized(job)
    for _, j in ipairs(allowedJobs) do
        if j == job then
            return true
        end
    end
    return false
end

RegisterCommand('ptekne', function(source, args, rawCommand)
    local PlayerJob = QBCore.Functions.GetPlayerData().job.name
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    -- Meslek kontrolü
    if not isAuthorized(PlayerJob) then
        QCBore.Functions.Notify('Bu komutu kullanma yetkiniz yok!', 'error')
        return
    end

    -- Su kontrolü
    if not IsEntityInWater(playerPed) then
        QBCore.Functions.Notify('Bu komutu yalnızca suyun içinde kullanabilirsiniz!', 'error')
        return
    end

    -- Tekneyi spawn etme
    local model = GetHashKey("predator") -- Spawn edilecek tekne modeli

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end

    local boat = CreateVehicle(model, playerCoords.x, playerCoords.y, playerCoords.z, GetEntityHeading(playerPed), true, false)

    -- Oyuncuyu tekneye bindirme
    TaskWarpPedIntoVehicle(playerPed, boat, -1)

    -- Teknenin sahipliğini ayarlama
    SetVehicleHasBeenOwnedByPlayer(boat, true)
    SetEntityAsMissionEntity(boat, true, true)

    -- Oyuncuya araç anahtarı verme
    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(boat))

    QBCore.Functions.Notify('Polis teknesi spawn edildi, biniyorsunuz ve anahtarlar verildi!', 'success')

    -- Temizlik: Artık modeli yüklemeye gerek yok
    SetModelAsNoLongerNeeded(model)
end, false)



RegisterNetEvent('police:client:ImpoundVehicle', function(fullImpound, price)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local bodyDamage = math.ceil(GetVehicleBodyHealth(vehicle))
    local engineDamage = math.ceil(GetVehicleEngineHealth(vehicle))
    local totalFuel = exports['cdn-fuel']:GetFuel(vehicle)
    if vehicle ~= 0 and vehicle then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local vehpos = GetEntityCoords(vehicle)
        if #(pos - vehpos) < 5.0 and not IsPedInAnyVehicle(ped) then
           QBCore.Functions.Progressbar('impound', Lang:t('progressbar.impound'), 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'missheistdockssetup1clipboard@base',
                anim = 'base',
                flags = 1,
            }, {
                model = 'prop_notepad_01',
                bone = 18905,
                coords = { x = 0.1, y = 0.02, z = 0.05 },
                rotation = { x = 10.0, y = 0.0, z = 0.0 },
            },{
                model = 'prop_pencil_01',
                bone = 58866,
                coords = { x = 0.11, y = -0.02, z = 0.001 },
                rotation = { x = -120.0, y = 0.0, z = 0.0 },
            }, function() -- Play When Done
                local plate = QBCore.Functions.GetPlate(vehicle)
                TriggerServerEvent("police:server:Impound", plate, fullImpound, price, bodyDamage, engineDamage, totalFuel)
                QBCore.Functions.DeleteVehicle(vehicle)
                TriggerEvent('QBCore:Notify', Lang:t('success.impounded'), 'success')
                ClearPedTasks(ped)
            end, function() -- Play When Cancel
                ClearPedTasks(ped)
                TriggerEvent('QBCore:Notify', Lang:t('error.canceled'), 'error')
            end)
        end
    end
end)

RegisterNetEvent('qb-police:client:openStash', function()
    if PlayerJob.type == 'police' then
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'UnitStash_'..QBCore.Functions.GetPlayerData().citizenid)
        TriggerEvent('inventory:client:SetCurrentStash', 'UnitStash_'..QBCore.Functions.GetPlayerData().citizenid)
    end
end)

RegisterNetEvent('qb-police:client:openTrash', function()
    if PlayerJob.type == 'unit' then
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'UnitTrash', {
            maxweight = 1000000,
            slots = 100,
        })
    end
    TriggerEvent('inventory:client:SetCurrentStash', 'UnitTrash')
end)

local dutylisten = false

local function dutylistener()
    dutylisten = true
    CreateThread(function()
        while dutylisten do
            if PlayerJob.type == 'unit' then
                if IsControlJustReleased(0, 38) then
                    onDuty = not onDuty
                    TriggerServerEvent('police:server:UpdateCurrentCops')
                    TriggerServerEvent('QBCore:ToggleDuty')
                    dutylisten = false
                    break
                end
            else
                break
            end
            Wait(3)
        end
    end)
end

if Config.UseTarget then
    CreateThread(function()
        for k, v in pairs(Config.Locations['duty']) do
            exports['qb-target']:AddBoxZone('UnitDuty_'..k, vector3(v.x, v.y, v.z), 1, 1, {
                name = 'UnitDuty_'..k,
                heading = 11,
                debugPoly = false,
                minZ = v.z - 1,
                maxZ = v.z + 1,
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-policejob:ToggleDuty',
                        icon = 'fas fa-sign-in-alt',
                        label = 'Mesai Gir / Çık',
                        job = {['police'] = 0, ['bcsd'] = 0, ['pbsd'] = 0, ['lssp'] = 0, ['lspr'] = 0, ['dsd'] = 0, ['doj'] = 0},
                    },
                },
                distance = 1.5
            })
        end
        for k, v in pairs(Config.Locations['stash']) do
            exports['qb-target']:AddBoxZone('UnitStash_'..k, vector3(v.x, v.y, v.z), 1.5, 1.5, {
                name = 'UnitStash_'..k,
                heading = 11,
                debugPoly = false,
                minZ = v.z - 1,
                maxZ = v.z + 1,
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-police:client:openStash',
                        icon = 'fas fa-dungeon',
                        label = 'Personel Kişisel Depo',
                        job = {['police'] = 0, ['bcsd'] = 0, ['pbsd'] = 0, ['lssp'] = 0, ['lspr'] = 0, ['dsd'] = 0, ['doj'] = 0},
                    },
                },
                distance = 1.5
            })
        end
        for k, v in pairs(Config.Locations['trash']) do
            exports['qb-target']:AddBoxZone('Trash_'..k, vector3(v.x, v.y, v.z), 1, 1.75, {
                name = 'Trash_'..k,
                heading = 11,
                debugPoly = false,
                minZ = v.z - 1,
                maxZ = v.z + 1,
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-police:client:openTrash',
                        icon = 'fas fa-trash',
                        label = 'Çöplük / Gereksiz',
                        job = {['police'] = 0, ['bcsd'] = 0, ['pbsd'] = 0, ['lssp'] = 0, ['lspr'] = 0, ['dsd'] = 0, ['doj'] = 0},
                    },
                },
                distance = 1.5
            })
        end
    end)
end