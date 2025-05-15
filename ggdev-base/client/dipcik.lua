Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed( -1 )
        local weapon = GetSelectedPedWeapon(ped)
      
        if IsPedArmed(ped, 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
      
      
        if weapon == GetHashKey("WEAPON_FIREEXTINGUISHER") then     
            if IsPedShooting(ped) then
                SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_FIREEXTINGUISHER"))
            end
        end
    end

--Shift R
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        DisableControlAction(1, 140, true)
        if not IsPlayerTargettingAnything(PlayerId()) then
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

    -- Silah Damge
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(1000)
    SetPedSuffersCriticalHits(PlayerPedId(), true)    --Bos ise sil amq
    N_0x4757f00bc6323cfe(GetHashKey("weapon_nightstick"), -0.001)
    end
    end)
    
end)
