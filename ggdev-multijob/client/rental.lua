local QBCore = exports['qb-core']:GetCoreObject()
local SpawnVehicle = false

RegisterNetEvent('qb-rental:openMenu', function(key)

        exports['qb-menu']:openMenu({
            {
                header = "Araç Kirala",
                isMenuHeader = true,
            },
            {
                id = 1,
                header = "Aracı geri ver",
                params = {
                    event = "geri:ver",
                }
            },
            {
                id = 2,
                header = "Araç Kirala",
                txt = "25$",
                params = {
                    event = "qb-rental:spawncar",
                    args = {
                        model = 'asbo',
                        money = 25,
                    }
                }
            },
        })
end)

CreateThread(function()
    SpawnNPC()
end)

RegisterNetEvent('geri:ver', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle then
        DeleteVehicle(vehicle)
    end
end)


SpawnNPC = function()
    CreateThread(function()
       
        RequestModel(GetHashKey('a_m_y_business_03'))
        while not HasModelLoaded(GetHashKey('a_m_y_business_03')) do
            Wait(1)
        end
        CreateNPC()   
    end)
end


CreateNPC = function()
    created_ped = CreatePed(5, GetHashKey('a_m_y_business_03') , -703.4739, -1274.2714, 4.1147, 135.7264, false, true)  
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
    exports['qb-target']:AddTargetEntity(created_ped, {
        options = {
            {
                label = "Araç Kirala",
                icon = 'fa-solid fa-dollar-sign',
                action = function()
                    TriggerEvent('qb-rental:openMenu')
                end
            }
        },
        distance = 5.0
    })
end


RegisterNetEvent('qb-rental:spawncar')
AddEventHandler('qb-rental:spawncar', function(data)
    local money =data.money
    local model = data.model
    local player = PlayerPedId()
    QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
        local vehicle = NetToVeh(netId)
        SetEntityHeading(vehicle, 244.03)
        TaskWarpPedIntoVehicle(player, vehicle, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
        SetVehicleEngineOn(vehicle, true, true) 
        SpawnVehicle = true 
    end, model, vector4(-712.4105, -1272.0302, 4.5774, 139.8550), true)
    Wait(1000)
    local vehicle = GetVehiclePedIsIn(player, false)
    local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    vehicleLabel = GetLabelText(vehicleLabel)
    local plate = GetVehicleNumberPlateText(vehicle)
end)




