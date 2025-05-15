local QBCore = exports['qb-core']:GetCoreObject()


 RegisterNetEvent('spawnVehicle:clienttttsss')
 AddEventHandler('spawnVehicle:clienttttsss', function(vehiclemodel, plate, type)
 	local PlayerData = QBCore.Functions.GetPlayerData()
 	local playerPed = PlayerPedId()
 	local pCoords = GetEntityCoords(playerPed)
 	pCoords = vector4(pCoords.x, pCoords.y, pCoords.z, GetEntityHeading(PlayerPedId()))
 	QBCore.Functions.SpawnVehicle(vehiclemodel, function(vehicle)
 		TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
 		local newPlate     = plate
 		local vehicleProps = QBCore.Functions.GetVehicleProperties(vehicle)
 		vehicleProps.plate = newPlate
 		SetVehicleNumberPlateText(vehicle, newPlate)
 		TriggerServerEvent('giveCarss', vehicleProps, vehiclemodel, type)
 		-- TriggerEvent("qb-vehiclekeys:client:GiveKeys", GetPlayerServerId(PlayerId()))
 		TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
 	end, pCoords, 1)
 end)

 RegisterNetEvent("atesss:givecarss", function()
    local keyboard = exports['qb-input']:ShowInput({
        header = "Bir oyuncuya araç verin",
        submitText = "Onayla",
        inputs = {
            {
                type = 'text',
                isRequired = true,
                text = "Oyuncu ID",
                name = 'input',
            },
            {
                type = 'text',
                isRequired = true,
                text = "Araç İsmi",
                name = 'input2',
            }
        }
    })
    if not IsModelValid(keyboard.input2) then 
        exports['ZSX_UIV2']:Notification("Hata", keyboard.input2.." İsimli Araç Bulunamadı", "fas fa-times-circle", 5000)
        return 
    end
    QBCore.Functions.TriggerCallback('atesss:givecarss:check', function(result)
        if result then 
            exports['ZSX_UIV2']:Notification("Başarılı", keyboard.input.." ID'li kişiye "..keyboard.input2.." İsimli Araç Verildi", "fas fa-check-circle", 5000)
        else 
            exports['ZSX_UIV2']:Notification("Hata", keyboard.input.." ID'li oyuncu bulunamadı", "fas fa-times-circle", 5000)
        end    
    end, keyboard)
end)

