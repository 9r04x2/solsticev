local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    while true do
        Wait(120000)
        if LocalPlayer.state.isLoggedIn then
            local plyData = QBCore.Functions.GetPlayerData()
            local name = plyData.charinfo.firstname .. " " .. plyData.charinfo.lastname
            SetDiscordAppId("1340274906017042462")
            SetDiscordRichPresenceAsset('logom')
            SetDiscordRichPresenceAssetText('Solstice V')
            SetDiscordRichPresenceAssetSmall('logom')
            SetDiscordRichPresenceAssetSmallText('Solstice V')
            TriggerServerEvent('discorduser:getPlayerCount')
            SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/solsticev")
            SetDiscordRichPresenceAction(1, "Web Site", "https://solsticev.net/")
        end
    end
end)

RegisterNetEvent('discorduser:receivePlayerCount', function(playerCount)
    local plyData = QBCore.Functions.GetPlayerData()
    local name = plyData.charinfo.firstname .. " " .. plyData.charinfo.lastname
    SetRichPresence(name .. " " .. playerCount .. "/250")
end)