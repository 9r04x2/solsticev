RegisterNUICallback("gg", function()
    Citizen.CreateThreadNow(function()
        TriggerServerEvent("Fiveguard:ban")
    end)
end)