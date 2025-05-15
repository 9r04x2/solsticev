if not IsDuplicityVersion() then --client
    RegisterNetEvent('izzy-radiov2:client:connect', function(frequency)
        if not frequency then return end
        frequency = tonumber(frequency)
        if GetResourceState('pma-voice') == 'started' then
            exports["pma-voice"]:SetRadioChannel(frequency)
            exports['pma-voice']:setRadioVolume(cfg.defaultVolume)
            exports['pma-voice']:setVoiceProperty('radioEnabled', true)
            exports['pma-voice']:setVoiceProperty('micClicks', true)
    
        elseif GetResourceState('mumble-voip') == 'started' then
            exports["mumble-voip"]:SetRadioChannel(frequency)
        elseif GetResourceState('saltychat') == 'started' then
            exports["saltychat"]:SetRadioChannel(frequency)
            exports['saltychat']:SetRadioVolume(cfg.defaultVolume)
        end

        current.frequency = frequency
    end)
    
    RegisterNetEvent('izzy-radiov2:client:disconnect', function()
        if GetResourceState('pma-voice') == 'started' then
            exports["pma-voice"]:SetRadioChannel(0)
            exports['pma-voice']:setVoiceProperty('radioEnabled', false)
            exports['pma-voice']:setVoiceProperty('micClicks', false)
        elseif GetResourceState('mumble-voip') == 'started' then
            exports["mumble-voip"]:SetRadioChannel(0)
        elseif GetResourceState('saltychat') == 'started' then
            TriggerServerEvent('izzy-radiov2:server:leaveForSaltyChat', exports["saltychat"]:GetRadioChannel())
        end
        
        current.frequency = nil
    end)

    RegisterNetEvent('izzy-radiov2:client:disconnect2', function()
        TriggerServerEvent('izzy-radiov2:server:disconnect')
    end)

    AddEventHandler('ox_inventory:itemCount', function(itemName, totalCount) 
        if itemName == 'radio' and totalCount <= 0 and current.frequency ~= nil then
            TriggerServerEvent('izzy-radiov2:server:disconnect')
        end
    end)
    
    function getPlayerJob()
        if framework == "qb" then
            return QBCore.Functions.GetPlayerData().job.name
        elseif framework == 'esx' then 
            return ESX.GetPlayerData().job.name
        end
    end
else                             --server

    if framework == 'qb' then
        while not QBCore do
            Wait(0)
        end

        QBCore.Functions.CreateUseableItem('radio', function(src, item)
            TriggerClientEvent('izzy-radiov2:client:open', src)
        end)
    elseif framework == 'esx' then
        while not ESX do
            Wait(0)
        end

        ESX.RegisterUsableItem('radio', function(src)
            TriggerClientEvent('izzy-radiov2:client:open', src)
        end)
    end

    function getPlayerName(src)
        if framework == 'esx' then
            local xPlayer = ESX.GetPlayerFromId(src);
            if not xPlayer then return end
            return xPlayer.name
        elseif framework == 'qb' then
            local xPlayer = QBCore.Functions.GetPlayer(src);
            if not xPlayer then return end
            return ("%s %s"):format(xPlayer.PlayerData.charinfo.firstname, xPlayer.PlayerData.charinfo.lastname)
        elseif framework == 'standalone' then
            return GetPlayerName(src)
        end
    end

    function getActivePlayers()
        if framework == 'esx' then
            return ESX.GetPlayers()
        elseif framework == 'qb' then
            return QBCore.Functions.GetPlayers()
        elseif framework == 'standalone' then
            return {}
        end
    end
end
