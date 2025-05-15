local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = {}
local DealerPed = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
	end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

AddEventHandler('onClientResourceStart',function(resource)
	if GetCurrentResourceName() == resource then
        QBCore.Functions.GetPlayerData(function(PlayerData)
            if PlayerData.job then
                PlayerJob = PlayerData.job
            end
        end)
	end
end)

CreateThread(function()
    for k, v in pairs(Config.Locations) do
        if not DealerPed[k] then DealerPed[k] = {} end
        local current = v.pedhash
        current = type(current) == 'string' and GetHashKey(current) or current
        RequestModel(current)
        while not HasModelLoaded(current) do Wait(0) end
        DealerPed[k] = CreatePed(0, current, v.pedlocation.x, v.pedlocation.y, v.pedlocation.z - 1, v.pedlocation.w, false, false)
        FreezeEntityPosition(DealerPed[k], true)
        SetEntityInvincible(DealerPed[k], true)
        SetBlockingOfNonTemporaryEvents(DealerPed[k], true)
        exports['qb-target']:AddTargetEntity(DealerPed[k], {
            options = {
                {
                    type = 'client',
                    event = 'qb-job-garage:Menu',
                    action = function()
                        openMenu(k)
                    end,
                    label = v.targetLabel,
                    icon = v.targetIcon,
                    jobType = 'unit',
                },
            },
            distance = 2.5
        })
    end
end)

function openMenu(department)
    local allowedJobs = {
        "police",
        "vespuccipd",
        "bcsd",
        "pbsd",
        "lssp",
        "lspr",
        "dsd",
        "doj",
        "weazel",
        "ambulance"
    }

    local playerJob = PlayerJob.name
    local isAllowed = false

    for _, job in ipairs(allowedJobs) do
        if playerJob == job then
            isAllowed = true
            break
        end
    end

    if not isAllowed then
        QBCore.Functions.Notify("Bu menüyü açmak için yetkiniz yok!", "error")
        return
    end

    local menu = {
        {
            header = Config.Locations[department].label..' | '..Lang:t('lang.header'),
            txt = Lang:t('lang.officer')..''..Config.Locations[department].officer..'',
            icon = 'fa-solid fa-list',
            isMenuHeader = true,
        }
    }

    for k, v in pairs(Config.Vehicles[department]) do
        if v.rank then
            for _, b in pairs(v.rank) do
                if b == PlayerJob.grade.level then
                    menu[#menu + 1] = {
                        header = v.label,
                        txt = '$'..v.price..''..Lang:t('lang.pay'),
                        icon = 'fa-solid fa-car',
                        params = {
                            event = 'qb-job-garage:SpawnCar',
                            args = {
                                vehicle = v.model,
                                loc = Config.Locations[department].spawnlocation,
                                livery = v.livery,
                                price = v.price
                            }
                        }
                    }
                end
            end
        end
    end

    exports['qb-menu']:openMenu(menu)
end



RegisterNetEvent('qb-job-garage:SpawnCar', function(data)
    local ped     = PlayerPedId()
    local livery  = data.livery
    local vehicle = data.vehicle
    local coords  = data.loc
    local price   = data.price
    local grade   = data.grade

    QBCore.Functions.TriggerCallback('qb-job-garage:server:checkVehicle', function(hasVehicle)
        if hasVehicle then
            QBCore.Functions.Notify('Böyle bir araca sahipsiniz, lütfen garajdan çıkarın!', 'error')
            return
        end

        QBCore.Functions.SpawnVehicle(vehicle, function(model)
            local properties = QBCore.Functions.GetVehicleProperties(model)
            local plate      = QBCore.Shared.RandomInt(1)..QBCore.Shared.RandomStr(2)..QBCore.Shared.RandomInt(3)..QBCore.Shared.RandomStr(2)

            SetVehicleNumberPlateText(model, plate)
            exports[Config.Fuel]:SetFuel(model, 100)
            TaskWarpPedIntoVehicle(ped, model, -1)
            TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(model))
            SetVehicleEngineOn(model, true, true)

            if Config.CustomLivery then
                SetVehicleModKit(model, 0)
                for i = 1, 8 do SetVehicleExtra(model, i, 0) end
                SetVehicleColours(model, 111, 0)
                SetVehicleMod(model, 48, livery, 1)
            end

            if Config.SaveSQL then
                TriggerServerEvent('qb-job-garage:AddVehicleSQL', properties, vehicle, GetHashKey(model), plate)
            end
            if Config.Payment then
                TriggerServerEvent('qb-job-garage:Payment', price)
            end
        end, coords, true)
    end, vehicle)
end)