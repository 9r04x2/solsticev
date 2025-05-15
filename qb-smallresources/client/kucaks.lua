
local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('weapons:client:SetCurrentWeapon')
AddEventHandler('weapons:client:SetCurrentWeapon', function(weap,shootbool)
    if weap == nil then
        GiveWeap(current)
        current = nil
    else
        if current ~= nil then  
            GiveWeap(current)
            current = nil
        end
        current = tostring(weap.name)
        DeleteWeapon(current)
    end
end)


function polisKontrol(gerekenPolis)
    local durum = nil
    QBCore.Functions.TriggerCallback('ate-base:polis-sayi', function(OnlinePolis)
        if OnlinePolis >= gerekenPolis then
            durum = true
        else
            QBCore.Functions.Notify('Yeterli Sayısıda Polis Aktif Değil!', 'error')
            durum = false
        end
    end)

    while durum == nil do Citizen.Wait(10) end
    return durum
end

function esyaKontrol(esya)
    local durum = nil
    QBCore.Functions.TriggerCallback('ate-base:item-kontrol', function(status)
        if status then
            durum = true
        else
            QBCore.Functions.Notify('Üstünde Gereken Eşyalar Yok!', 'error')
            durum = false
        end
    end, esya)

    while durum == nil do Citizen.Wait(10) end
    return durum
end