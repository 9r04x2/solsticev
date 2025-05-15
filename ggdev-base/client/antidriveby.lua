local QBCore = exports['qb-core']:GetCoreObject()


Citizen.CreateThread(function()
    while true do
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) and GetCurrentPedWeapon(PlayerPedId(), false) then
                TriggerEvent("keremu:unarmed")
            end
        else
            Citizen.Wait(2000)
        end
        Citizen.Wait(10)
    end
end)
