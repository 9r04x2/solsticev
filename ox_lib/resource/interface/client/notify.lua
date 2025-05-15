local settings = require 'resource.settings'
local lib = {} -- Eğer lib zaten tanımlı değilse

--- Yeni bildirim fonksiyonu: ox_lib tetiklendiğinde ZSX_UIV2 Notification'ı kullanır.
---@param data table -- NotifyProps veya DefaultNotifyProps formatında
function lib.notify(data)
    local header = data.title or "Solstice-Base"
    local text = data.description or ""

    local icon = ""
    if data.icon then 
        if type(data.icon) == "table" then
            icon = data.icon[1] or ""
        else
            icon = data.icon
        end
    end

    local duration = data.duration or 3000

    local serial = exports['ZSX_UIV2']:Notification(header, text, icon, duration)

    local sound = settings.notification_audio and data.sound
    if sound then
        if sound.bank then lib.requestAudioBank(sound.bank) end

        local soundId = GetSoundId()
        PlaySoundFrontend(soundId, sound.name, sound.set, true)
        ReleaseSoundId(soundId)

        if sound.bank then
            ReleaseNamedScriptAudioBank(sound.bank)
        end
    end

    return serial
end

--- Varsayılan bildirim fonksiyonu: status alanını type olarak ayarlar.
---@param data table -- DefaultNotifyProps formatında
function lib.defaultNotify(data)
    data.type = data.status or data.type
    if data.type == 'inform' then data.type = 'info' end
    return lib.notify(data)
end

-- Ox_lib tetiklendiğinde ilgili event'ler çağrılır.
RegisterNetEvent('ox_lib:notify', function(data)
    lib.notify(data)
end)

RegisterNetEvent('ox_lib:defaultNotify', function(data)
    lib.defaultNotify(data)
end)

-- Exportlar: Bu şekilde diğer kaynaklar bu fonksiyonlara erişebilir.
exports('notify', lib.notify)
exports('defaultNotify', lib.defaultNotify)
