--Temp local vars that you can use while using events.

local tempVars = {}
tempVars['hunger'] = 0
tempVars['thirst'] = 0
tempVars['stress'] = 0

--[[
    Here you can add your function to gather statuses
]]

Citizen.CreateThread(function()
    while not NUI.Loaded or not Storage.HasBeenSent do
        Wait(1000)
    end
    Wait(1000)
    Config.Hud.Status['health'].get = function()
        return (GetEntityHealth(Threads.Players.Data['ped']) - 100) / (GetEntityMaxHealth(Threads.Players.Data['ped']) - 100) * 100
    end
    
    Config.Hud.Status['armour'].get = function()
        return GetPedArmour(Threads.Players.Data['ped'])
    end
    
    Config.Hud.Status['hunger'].get = function()
        return (FrameworkSelected == 'ESX' or FrameworkSelected == 'QBOX') and tempVars['hunger'] or FrameworkSelected == 'QBCore' and QBCore.Functions.GetPlayerData().metadata.hunger
    end
    
    Config.Hud.Status['thirst'].get = function()
        return (FrameworkSelected == 'ESX' or FrameworkSelected == 'QBOX') and tempVars['thirst'] or FrameworkSelected == 'QBCore' and QBCore.Functions.GetPlayerData().metadata.thirst
    end
    
    if Config.Hud.Status['stress'] then
        Config.Hud.Status['stress'].get = function()
            return (FrameworkSelected == 'ESX' or FrameworkSelected == 'QBOX') and tempVars['stress'] or FrameworkSelected == 'QBCore' and QBCore.Functions.GetPlayerData().metadata.stress
        end
    end
    if FrameworkSelected == 'ESX' then

        AddEventHandler('esx_status:onTick', function(data)
            for i = 1, #data, 1 do
                if data[i].name == 'hunger' then 
                    tempVars['hunger'] = data[i].percent
                end
                if data[i].name == 'thirst' then
                    tempVars['thirst'] = data[i].percent
                end
                if data[i].name == 'stress' then
                    tempVars['stress'] = data[i].percent
                end
            end
        end)

    elseif FrameworkSelected == 'QBOX' then

        Wait(1000)

        AddStateBagChangeHandler('hunger', ('player:%s'):format(GetPlayerServerId(PlayerId())), function(_, _, value)
            tempVars['hunger'] = value
        end)
        AddStateBagChangeHandler('thirst', ('player:%s'):format(GetPlayerServerId(PlayerId())), function(_, _, value)
            tempVars['thirst'] = value
        end)
        AddStateBagChangeHandler('stress', ('player:%s'):format(GetPlayerServerId(PlayerId())), function(_, _, value)
            tempVars['stress'] = value
        end)

    end
end)
