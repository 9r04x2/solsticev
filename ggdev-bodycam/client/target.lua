local allowedJobs = {
    "police", "lspd", "vespuccipd", "bcsd", "pbsd", "lssp", "lspr", "dsd", "doj", "ambulance"
}

-- Meslek kontrolü fonksiyonu
local function isAuthorized(job)
    for _, j in ipairs(allowedJobs) do
        if j == job then
            return true
        end
    end
    return false
end

-- 'aktifkameralar' komutu
RegisterCommand('aktifkameralar', function(source, args, rawCommand)
    local PlayerJob = QBCore.Functions.GetPlayerData().job.name
    if isAuthorized(PlayerJob) then
        TriggerEvent('ate-bodycam:openActiveMenu')
    else
        exports['ZSX_UIV2']:Notification("Hata", "Bu komutu kullanma yetkiniz yok!", "fas fa-times-circle", 5000)
    end
end, false)

-- 'kayitlivideolar' komutu
RegisterCommand('kayitlivideolar', function(source, args, rawCommand)
    local PlayerJob = QBCore.Functions.GetPlayerData().job.name
    if isAuthorized(PlayerJob) then
        TriggerServerEvent('ate-bodycam:server:showrecordingUI')
    else
        exports['ZSX_UIV2']:Notification("Hata", "Bu komutu kullanma yetkiniz yok!", "fas fa-times-circle", 5000)
    end
end, false)
