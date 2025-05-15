QBCore = exports['qb-core']:GetCoreObject()
PlayerData = QBCore.Functions.GetPlayerData()

local crouched = false
local proned = false
local crouchKey = 36
local proneKey = 20

-- Idle camera kontrolü ve varsayılan yürüme stili
Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if not GetPedConfigFlag(ped, 78, 1) then
            SetPedUsingActionMode(ped, false, -1, 0)
        end
        DisableIdleCamera(true)
        Citizen.Wait(7000)  -- Bu kontrolü 2 saniyede bir yaparak optimize ettim
    end
end)

-- Son yürüyüş stilini kaydetme
local lastStyle = nil
RegisterNetEvent('cylex_animmenuv2:client:onWalkSet', function(style)
    lastStyle = style
end)

-- Crouch mekanizması
Citizen.CreateThread(function()
    function RequestWalking(set)
        RequestAnimSet(set)
        while not HasAnimSetLoaded(set) do
            Citizen.Wait(10)  -- Bekleme süresini optimize ettim
        end
    end
    
    while true do
        Citizen.Wait(5)  -- Daha hızlı tepki vermesi gereken yerlerde 5ms kullandım
        local ped = PlayerPedId()

        if DoesEntityExist(ped) and not IsEntityDead(ped) then
            DisableControlAction(0, crouchKey, true) -- Crouch tuşunu devre dışı bırakma
            if not IsPauseMenuActive() then
                if IsDisabledControlJustPressed(0, crouchKey) then
                    RequestAnimSet("move_ped_crouched")
                    if crouched then
                        ResetPedMovementClipset(ped, 0.60)
                        crouched = false
                        if lastStyle then
                            RequestWalking(lastStyle)
                            SetPedMovementClipset(ped, lastStyle, 0.2)
                            RemoveAnimSet(lastStyle)
                        end
                    else
                        SetPedMovementClipset(ped, "move_ped_crouched", 0.60)
                        crouched = true
                    end
                end
            end
        end
    end
end)

-- Crouch modunda belirli kontrolleri devre dışı bırakma
Citizen.CreateThread(function()
    while true do
        if crouched then
            DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 25, true) -- Aim
            Citizen.Wait(1)  -- Sürekli kontrol edilmesi gerektiği için kısa bekleme süresi koydum
        else
            Citizen.Wait(250)  -- Crouched değilse daha uzun süre bekleyebiliriz
        end
    end
end)

-- Boşluğa yumruk atmayı engelleme
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)  -- Yumruk kontrolü sürekli çalışmalı, bu yüzden düşük bekleme süresi kullandım
        DisableControlAction(1, 140, true) -- Boşluğa yumruk
        if not IsPlayerTargettingAnything(PlayerId()) then
            DisableControlAction(1, 141, true) -- Saldırı
            DisableControlAction(1, 142, true) -- Saldırı 2
        end
    end
end)
