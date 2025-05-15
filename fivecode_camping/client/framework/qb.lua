CORE = nil

CreateThread(function()
    if Framework.type == 'qbcore' then
        CORE = exports[Framework.export]:GetCoreObject()

        function GetPlayerInfo()
            return CORE.Functions.GetPlayerData()
        end

        function UpdatePlayerFoodStatus(type, value)
            -- type: hunger, thirst
            if type == 'hunger' then
                TriggerServerEvent('consumables:server:addHunger', value)
            elseif type == 'thirst' then
                TriggerServerEvent('consumables:server:addThirst', value)
            end
        end

        RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
            DeleteObjectUponLogout()
        end)
    end
end)