Framework = {}

function Framework:GetIdentifier()
    if Config.Framework == "qb" then
        return FrameworkObject.Functions.GetPlayerData().citizenid
    elseif Config.Framework == "esx" then
        return FrameworkObject.GetPlayerData().identifier
    else
        -- Write your own code.
        return nil
    end
end

function Framework:GetJob()
    if Config.Framework == "qb" then
        return FrameworkObject.Functions.GetPlayerData().job.name
    elseif Config.Framework == "esx" then
        return FrameworkObject.GetPlayerData().job.name
    else
        -- Write your own code.
        return nil
    end
end

function Framework:GetMoney()
    if Config.Framework == "qb" then
        return FrameworkObject.Functions.GetPlayerData().money
    elseif Config.Framework == "esx" then
        local playerData = FrameworkObject.PlayerData
        if playerData and playerData.accounts then
            local cash = 0
            local bank = 0
            for _, account in pairs(playerData.accounts) do
                if account.name == "money" then
                    cash = account.money
                elseif account.name == "bank" then
                    bank = account.money
                end
            end
            return {cash = cash, bank = bank}
        end
        return {cash = 0, bank = 0} 
    else
        -- Write your own code
        return nil
    end
end

function Framework:Notify(text, type)
    if Config.Framework == "qb" then
        TriggerEvent('QBCore:Notify', text, type)
    elseif Config.Framework == 'esx' then
        TriggerEvent('esx:showNotification', text)
    end
end