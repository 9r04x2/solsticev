local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('keremu:client:DisplayYetkiliChat', function(name, src, msg)
    local formatted = string.format("%s (%d): %s", name, src, msg)
    TriggerEvent('chat:addMessage', {
        type = "REPORT",
        typeColor = "#ffffff",
        typeBgColor = "#c22121",
        tag = {
            name = '🔱 ACHAT',
            background = '#813165'
        },
        multiline = true,
        args = { formatted }
    })
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    Citizen.CreateThread(function()
        local hungerNotified = false
        local thirstNotified = false

        local hungerThreshold = 10
        local thirstThreshold = 10

        while true do
            Citizen.Wait(10000)
            local pd = QBCore.Functions.GetPlayerData()
            local hunger = pd.metadata and pd.metadata.hunger or 0
            local thirst = pd.metadata and pd.metadata.thirst or 0

            if hunger <= hungerThreshold and not hungerNotified then
                QBCore.Functions.Notify(
                    ("Açlığın artık %d’nın altına düştü, yemek yemeyi unutma!"):format(hungerThreshold),
                    "error",
                    30000
                )
                hungerNotified = true
            elseif hunger > hungerThreshold and hungerNotified then
                hungerNotified = false
            end

            if thirst <= thirstThreshold and not thirstNotified then
                QBCore.Functions.Notify(
                    ("Susuzluğun artık %d’nın altına düştü, su iç!"):format(thirstThreshold),
                    "error",
                    30000
                )
                thirstNotified = true
            elseif thirst > thirstThreshold and thirstNotified then
                thirstNotified = false
            end
        end
    end)
end)


Citizen.CreateThread(function() 
    cfg = {
        restoran = {
            [1] = vector3(275.75, -835.75, 28.72),
            [2] = vector3(-701.13, -883.06, 23.27),
            [3] = vector3(-836.31, -610.16, 29.03),
            [4] = vector3(-138.29, -256.83, 43.6),
            [5] = vector3(50.31, -135.5, 54.7),
            [6] = vector3(-601.94, -1105.77, 22.32),
            [7] = vector3(166.29, -1451.15, 29.24),
        },
        evler = {
            [1] = vector3(203.57, -238.56, 53.97),
            [2] = vector3(-1162.87, -321.81, 37.61),
            [3] = vector3(-32.56, -184.54, 53.73),
            [4] = vector3(315.24, -128.0, 69.98),
            [5] = vector3(5.76, -985.95, 29.36),
            [6] = vector3(327.99, -1258.66, 31.82),
            [7] = vector3(254.38, -1013.07, 29.27),
        },
        npcCoords = vector3(-149.74, -164.08, 42.62),
        npcHeading = 84.12,
        npcModel = `a_m_m_bevhills_02`,
        newCarCoords = vector3(-155.02, -162.29, 42.62),
    }
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoadedd', function(playerData)
    PlayerData = QBCore.Functions.GetPlayerData()
end)

-- RegisterNetEvent('mCore:client:update', function(playerData)
--     mCore.playerData = playerData
-- end)

current = {
    blip = 0,
    state = 0,
    haveProp = false,
    prop = 0,
    restCoord = vector3(0,0,0),
    evCoord = vector3(0,0,0),
    currentlyWorking = nil,
}

CreateThread(function()
    Citizen.Wait(1000)
    local blip = AddBlipForCoord(cfg.npcCoords)
    SetBlipSprite(blip, 351)
    SetBlipColour(blip, 2)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, 0.8)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Zilli Eats")
    EndTextCommandSetBlipName(blip)
    
    requestModel(cfg.npcModel) 
    local ped = CreatePed(4, cfg.npcModel, cfg.npcCoords, cfg.npcHeading, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    
    exports['qb-target']:AddBoxZone("lunaeats", cfg.npcCoords, 1.6, 3.6, {
        name = "lunaeats",
        heading = 89,
        debugpoly = false,
    }, {
        options = {
            {
                label = "İşe Başla",
                event = "almezJobs:LunaEats:client:startWorking",
                icon = 'fa-solid fa-box',
                canInteract = function(cb)
                    if current.blip == 0 then
                        return true
                    else
                        return false
                    end
                end,
            },
            {
                label = "İşi bitir",
                event = "almezJobs:LunaEats:client:stopWorking",
                icon = 'fa-solid fa-box',
                canInteract = function(cb)
                    if current.blip ~= 0 or currentVehicle then
                        return true
                    else
                        return false
                    end
                end,
            },
        },
        distance = 3.5,
    })
end)

RegisterNetEvent('almezJobs:LunaEats:client:stopWorking', function()
    RemoveBlip(current.blip)
    if not currentlyWorking then
        Citizen.Wait(500)
        NetworkFadeOutEntity(currentVehicle, true, true)
        Citizen.Wait(100)
        SetEntityCollision(currentVehicle, false, false)
        SetEntityAlpha(currentVehicle, 0.0, true)
        DeleteVehicle(currentVehicle)
        currentlyWorking = false
        currentVehicle = nil
    end
    if current.haveProp then 
        DeleteObject(current.prop)
    end
    current = {
        blip = 0,
        state = 0,
        haveProp = false,
        prop = 0,
        restCoord = vector3(0,0,0),
        evCoord = vector3(0,0,0),
    }
    exports['ZSX_UIV2']:Notification("Bilgi", "Başarıyla işi bıraktın.", "fas fa-info-circle", 5000)
end)

function requestModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
end

RegisterNetEvent('almezJobs:LunaEats:client:startWorking')
AddEventHandler('almezJobs:LunaEats:client:startWorking', function()
    exports['ZSX_UIV2']:Notification("Bilgi", "Yeniden Gelip İşi Bırakabilirsin.", "fas fa-info-circle", 15000)

    QBCore.Functions.Progressbar("isi_aliyorsun", 'Zilli Eats işini alıyorsun...', 3000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        local playerPed = PlayerPedId()
        ClearPedTasks(playerPed)
        current.restCoord = cfg.restoran[math.random(1, #cfg.restoran)]
        current.blip = AddBlipForCoord(current.restCoord)
        SetBlipSprite(current.blip, 280)
        SetBlipColour(current.blip, 5)
        SetBlipAsShortRange(current.blip, true)
        SetBlipScale(current.blip, 0.7)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Restoran')
        EndTextCommandSetBlipName(current.blip)
        SetBlipRoute(current.blip, true)
        SetBlipRouteColour(current.blip, 5)

        requestModel(`faggio`) 
        ClearAreaOfVehicles(cfg.newCarCoords, 15.0, false, false, false, false, false)
        local motor = CreateVehicle(`faggio`, cfg.newCarCoords, GetEntityHeading(playerPed), true, true)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(motor))
        SetPedIntoVehicle(playerPed, motor, -1)
        SetVehicleColours(motor, 55, 55)
        currentVehicle = motor
        exports['ZSX_UIV2']:Notification("Bilgi", "Haritada işaretlenen konuma git ve siparişi al.", "fas fa-info-circle", 15000)
    end, function() -- Cancel
        ClearPedTasks(playerPed)
    end)

    Wait(200)
end)

function RequestPayment()
    QBCore.Functions.TriggerCallback('giveMoneyEvent', function(success)
        if success == true then
            exports['ZSX_UIV2']:Notification("Başarılı", "500$ banka hesabına eklendi!", "fas fa-check-circle", 5000)
        elseif success == false then
            -- Eğer özel bir durum varsa burada bildirim ekleyebilirsiniz.
        else
            exports['ZSX_UIV2']:Notification("Hata", "Bir hata oluştu!", "fas fa-times-circle", 5000)
        end
    end)    
end

local inLocation = false

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        if current.state == 0 and current.blip ~= 0 then
            local playerPed = PlayerPedId()
            local pedCoords = GetEntityCoords(playerPed)
            local dist = GetDistanceBetweenCoords(current.restCoord, pedCoords, false)
            
            if dist <= 25 then
                sleep = 3
                DrawMarker(21, current.restCoord, 0, 0, 0, 0, 0, 0, 0.3, 0.3, 0.3, 32, 236, 54, 255, 0, 0, 0, 1, 0, 0, 0)
            end

            if dist <= 5 then
                if not inLocation then
                    exports['qb-core']:DrawText('[E] Teslim Al', 'left')
                    inLocation = true
                end
                if IsControlJustPressed(0, 38) then
                    if not IsPedInAnyVehicle(playerPed, false) then
                        current.state = 1
                        QBCore.Functions.Progressbar("urun_teslim_al", 'Ürünü teslim alıyorsun...', 3000, false, false, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function() -- Done
                            ClearPedTasks(playerPed)
                            current.evCoord = cfg.evler[math.random(1, #cfg.evler)]
                            RemoveBlip(current.blip)
                            current.blip = AddBlipForCoord(current.evCoord)
                            SetBlipSprite(current.blip, 280)
                            SetBlipColour(current.blip, 6)
                            SetBlipAsShortRange(current.blip, true)
                            SetBlipScale(current.blip, 0.7)
                            BeginTextCommandSetBlipName("STRING")
                            AddTextComponentString('Alıcı')
                            EndTextCommandSetBlipName(current.blip)
                            SetBlipRoute(current.blip, true)
                            SetBlipRouteColour(current.blip, 6)
                            current.haveProp = true
                            current.prop = CreateObject(GetHashKey('qua_zillieats_bag'), 1.0, 1.0, 1.0, true, true, false)
                            print(GetHashKey('qua_zillieats_bag'))
                            AttachEntityToEntity(current.prop, playerPed, GetPedBoneIndex(playerPed, 10706), 0.1, 0.05, -0.45, 0.0, 20.0, 180.0, 0, 1, 0, 1, 0, 1)
                            exports['ZSX_UIV2']:Notification("Bilgi", "Haritada işaretlenen konuma git ve siparişi müşteriye teslim et.", "fas fa-info-circle", 15000)
                            exports["qb-core"]:HideText()
                        end, function() -- Cancel
                            ClearPedTasks(playerPed)
                        end)
                    else
                        exports["qb-core"]:HideText()
                        exports['ZSX_UIV2']:Notification("Hata", "Araç içerisinden ürünü teslim alamazsınız!", "fas fa-times-circle", 5000)
                    end
                end
            end
        end

        if current.state == 1 and current.haveProp then
            local playerPed = PlayerPedId()
            local pedCoords = GetEntityCoords(playerPed)
            local dist = GetDistanceBetweenCoords(current.evCoord, pedCoords, false)
            
            if dist <= 25 then
                sleep = 3
                DrawMarker(21, current.evCoord, 0, 0, 0, 0, 0, 0, 0.3, 0.3, 0.3, 32, 236, 54, 255, 0, 0, 0, 1, 0, 0, 0)
            end

            if dist <= 5 then
                if not inLocation then
                    exports['qb-core']:DrawText('[E] Teslim et', 'left')
                    inLocation = true
                end

                if IsControlJustPressed(0, 38) then
                    sleep = 1000
                    RemoveBlip(current.blip)
                    DeleteObject(current.prop)
                    current.blip = 0
                    current.state = 0
                    current.haveProp = false
                    current.restCoord = vector3(0, 0, 0)
                    current.evCoord = vector3(0, 0, 0)
                    current.prop = 0
                    RequestPayment()
                    Wait(2000)
                    exports['ZSX_UIV2']:Notification("Bilgi", "İşe devam ediyorsun.", "fas fa-info-circle", 15000)
                    exports['ZSX_UIV2']:Notification("Bilgi", "Konuma git ve ürünleri al.", "fas fa-info-circle", 15000)
                    current.restCoord = cfg.restoran[math.random(1, #cfg.restoran)]
                    current.blip = AddBlipForCoord(current.restCoord)
                    SetBlipSprite(current.blip, 280)
                    SetBlipColour(current.blip, 5)
                    SetBlipAsShortRange(current.blip, true)
                    SetBlipScale(current.blip, 0.7)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString('Restoran')
                    EndTextCommandSetBlipName(current.blip)
                    SetBlipRoute(current.blip, true)
                    SetBlipRouteColour(current.blip, 5)
                end
            end
        end

        if sleep > 100 and inLocation then
            inLocation = false
            exports["qb-core"]:HideText()
        end

        Citizen.Wait(sleep)
    end
end)
