local deadAnimDict = "dead"
local deadAnim = "dead_a"
local hold = 5
deathTime = Config.DeathTime
emstime = nil
-- Functions

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

function OnDeath()
    if not isDead then
        isDead = true
        TriggerServerEvent("hospital:server:SetDeathStatus", true)
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "demo", 0.1)
        exports['pma-voice']:overrideProximityCheck(function(player)
            return false
        end)
        local player = PlayerPedId()

        while GetEntitySpeed(player) > 0.5 or IsPedRagdoll(player) do
            Wait(10)
        end

        if isDead then
            local pos = GetEntityCoords(player)
            local heading = GetEntityHeading(player)

            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped) then
                local veh = GetVehiclePedIsIn(ped)
                local vehseats = GetVehicleModelNumberOfSeats(GetHashKey(GetEntityModel(veh)))
                for i = -1, vehseats do
                    local occupant = GetPedInVehicleSeat(veh, i)
                    if occupant == ped then
                        NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z + 0.5, heading, true, false)
                        SetPedIntoVehicle(ped, veh, i)
                    end
                end
            else
                NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z + 0.5, heading, true, false)
            end

            SetEntityInvincible(player, true)
            SetEntityHealth(player, GetEntityMaxHealth(player))
            if IsPedInAnyVehicle(player, false) then
                loadAnimDict("veh@low@front_ps@idle_duck")
                TaskPlayAnim(player, "veh@low@front_ps@idle_duck", "sit", 1.0, 1.0, -1, 1, 0, 0, 0, 0)
            else
                loadAnimDict(deadAnimDict)
                TaskPlayAnim(player, deadAnimDict, deadAnim, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
            end
            -- TriggerServerEvent('hospital:server:ambulanceAlert', Lang:t('info.civ_died'))
        end
    end
end

function DeathTimer()
    hold = 5
    while isDead do
        Wait(1000)
        deathTime = deathTime - 1
        if deathTime <= 0 then
            if IsControlPressed(0, 38) and hold <= 0 and not isInHospitalBed then
                QBCore.Functions.Notify('Hastaneye kaldırılıyorsun.')
                Wait(2000)
                TriggerEvent("hospital:client:RespawnAtHospital")
                exports['pma-voice']:resetProximityCheck()
                hold = 5
            end
            if IsControlPressed(0, 38) then
                if hold - 1 >= 0 then
                    hold = hold - 1
                else
                    hold = 0
                end
            end
            if IsControlReleased(0, 38) then
                hold = 5
            end
        end
    end
end

local function DrawTxt(x, y, width, height, scale, text, r, g, b, a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

AddEventHandler('gameEventTriggered', function(event, data)
    if event == "CEventNetworkEntityDamage" then
        if data[6] == 1 then
            local killerId = NetworkGetPlayerIndexFromPed(data[2])
            if GetPlayerServerId(killerId) == GetPlayerServerId(PlayerId()) then
                -- Screenshot eventi kaldırıldı
            end
        end
        local victim, attacker, victimDied, weapon = data[1], data[2], data[4], data[7]
        if not IsEntityAPed(victim) then return end
        TriggerEvent('hasar-yedim')

        if victimDied and NetworkGetPlayerIndexFromPed(victim) == PlayerId() and IsEntityDead(PlayerPedId()) then
            if not InLaststand then
                print("Ölüm sebebi ", weapon)
                ExecuteCommand('telsizcik')

                if weapon == -842959696 or weapon == -1569615261 or weapon == -544306709 or weapon == -10959621 or weapon == -1553120962 or weapon == -1024456158 then
                    SetLaststand(false)
                    local playerid = NetworkGetPlayerIndexFromPed(victim)
                    local playerName = GetPlayerName(playerid) .. " " .. "("..GetPlayerServerId(playerid)..")" or Lang:t('info.self_death')
                    local killerId = NetworkGetPlayerIndexFromPed(attacker)
                    local killerName = GetPlayerName(killerId) .. " " .. "("..GetPlayerServerId(killerId)..")" or Lang:t('info.self_death')
                    local weaponLabel = QBCore.Shared.Weapons[weapon] and QBCore.Shared.Weapons[weapon].label or 'Unknown'
                    local weaponName = QBCore.Shared.Weapons[weapon] and QBCore.Shared.Weapons[weapon].name or 'Unknown'
                    TriggerServerEvent("qb-log:server:CreateLog", "death", Lang:t('logs.death_log_title', {playername = playerName, playerid = GetPlayerServerId(playerid)}), "red", Lang:t('logs.death_log_message', {killername = killerName, playername = playerName, weaponlabel = weaponLabel, weaponname = weaponName}))
                    deathTime = Config.DeathTime
                    TriggerServerEvent('mikrofon-kapat', true)
                    TriggerEvent('izzy-radiov2:client:disconnect2', true)
                    OnDeath()
                    DeathTimer()
                else
                    SetLaststand(false)
                    local playerid = NetworkGetPlayerIndexFromPed(victim)
                    local playerName = GetPlayerName(playerid) .. " " .. "("..GetPlayerServerId(playerid)..")" or Lang:t('info.self_death')
                    local killerId = NetworkGetPlayerIndexFromPed(attacker)
                    local killerName = GetPlayerName(killerId) .. " " .. "("..GetPlayerServerId(killerId)..")" or Lang:t('info.self_death')
                    local weaponLabel = QBCore.Shared.Weapons[weapon] and QBCore.Shared.Weapons[weapon].label or 'Unknown'
                    local weaponName = QBCore.Shared.Weapons[weapon] and QBCore.Shared.Weapons[weapon].name or 'Unknown'
                    TriggerServerEvent("qb-log:server:CreateLog", "death", Lang:t('logs.death_log_title', {playername = playerName, playerid = GetPlayerServerId(playerid)}), "red", Lang:t('logs.death_log_message', {killername = killerName, playername = playerName, weaponlabel = weaponLabel, weaponname = weaponName}))
                    deathTime = Config.DeathTime
                    TriggerServerEvent('mikrofon-kapat', true)
                    TriggerEvent('izzy-radiov2:client:disconnect2', true)
                    OnDeath()
                    DeathTimer()
                end
            elseif InLaststand and not isDead then
                SetLaststand(false)
                local playerid = NetworkGetPlayerIndexFromPed(victim)
                local playerName = GetPlayerName(playerid) .. " " .. "("..GetPlayerServerId(playerid)..")" or Lang:t('info.self_death')
                local killerId = NetworkGetPlayerIndexFromPed(attacker)
                local killerName = GetPlayerName(killerId) .. " " .. "("..GetPlayerServerId(killerId)..")" or Lang:t('info.self_death')
                local weaponLabel = QBCore.Shared.Weapons[weapon] and QBCore.Shared.Weapons[weapon].label or 'Unknown'
                local weaponName = QBCore.Shared.Weapons[weapon] and QBCore.Shared.Weapons[weapon].name or 'Unknown'
                TriggerServerEvent("qb-log:server:CreateLog", "death", Lang:t('logs.death_log_title', {playername = playerName, playerid = GetPlayerServerId(playerid)}), "red", Lang:t('logs.death_log_message', {killername = killerName, playername = playerName, weaponlabel = weaponLabel, weaponname = weaponName}))
                deathTime = Config.DeathTime
                TriggerServerEvent('mikrofon-kapat', true)
                OnDeath()
                DeathTimer()
            end
        end
    end
end)

-- Threads

emsNotified = false

CreateThread(function()
	while true do
        local sleep = 1000
		if isDead or InLaststand then
            sleep = 0
            local ped = PlayerPedId()
            DisableAllControlActions(0)
            EnableControlAction(0, 1, true)
			EnableControlAction(0, 2, true)
			EnableControlAction(0, 245, true)
            EnableControlAction(0, 38, true)
            EnableControlAction(0, 0, true)
            EnableControlAction(0, 322, true)
            EnableControlAction(0, 288, true)
            EnableControlAction(0, 213, true)
            EnableControlAction(0, 249, true)
            EnableControlAction(0, 46, true)
            EnableControlAction(0, 47, true)

            if isDead then
                DisableControlAction(0, 249, true)
                if not isInHospitalBed then
                    if deathTime > 0 then
                        if emsNotified then
                            DrawTxt(0.80, 1.44, 1.0,1.0, 0.4, "BILDIRIM GÖNDERILDI | YENIDEN DOĞMANA ~b~" ..  math.ceil(deathTime) .. "~w~ SANIYE KALDI", 255, 255, 255, 255)
                        else
                            DrawTxt(0.80, 1.44, 1.0,1.0, 0.4, "[~b~G~s~] BILDIRIM GÖNDER | YENIDEN DOĞMANA ~b~" ..  math.ceil(deathTime) .. "~w~ SANIYE KALDI", 255, 255, 255, 255)
                        end
                    else
                        if emsNotified then
                            DrawTxt(0.80, 1.44, 1.0,1.0, 0.4, "BILDIRIM GÖNDERILDI | [~b~E~s~] basili tutarak hemen canlan Süre: [~g~".. hold .."~s~]", 255, 255, 255, 255)
                        else
                            DrawTxt(0.80, 1.44, 1.0,1.0, 0.4, "[~b~G~s~] BILDIRIM GÖNDER | [~b~E~s~] basili tutarak hemen canlan Süre: [~g~".. hold .."~s~]", 255, 255, 255, 255)
                        end
                    end
                end

                if IsControlJustPressed(0, 47) and not emsNotified then
                    emstime = GetGameTimer() + 150000
                    -- TriggerServerEvent('hospital:server:ambulanceAlert', Lang:t('info.civ_down'))
                    -- TriggerEvent("Tgiann-PolisBildirim:BildirimGonder", "Yaralı Vatandaş", false, false, false, "ambulance")
                    playerCoords = GetEntityCoords(PlayerPedId())
                    data = {dispatchCode = 'persondown', caller = "İhbar", coords = playerCoords, netId = NetworkGetNetworkIdFromEntity(playerPed), length = 20000}
                    TriggerServerEvent('wf-alerts:svNotify', data)
                    -- TriggerEvent("tgiann-policeAlert:alert2", "Yaralı Vatandaş", false)
                    emsNotified = true
                end

                if emstime then
                    if emstime < GetGameTimer() then
                        emsNotified = false
                        emstime = nil
                    end
                end

                if IsPedInAnyVehicle(ped, false) then
                    loadAnimDict("veh@low@front_ps@idle_duck")
                    if not IsEntityPlayingAnim(ped, "veh@low@front_ps@idle_duck", "sit", 3) then
                        TaskPlayAnim(ped, "veh@low@front_ps@idle_duck", "sit", 1.0, 1.0, -1, 1, 0, 0, 0, 0)
                    end
                else
                    if isInHospitalBed then
                        if not IsEntityPlayingAnim(ped, inBedDict, inBedAnim, 3) then
                            loadAnimDict(inBedDict)
                            TaskPlayAnim(ped, inBedDict, inBedAnim, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
                        end
                    else
                        if not IsEntityPlayingAnim(ped, deadAnimDict, deadAnim, 3) then
                            loadAnimDict(deadAnimDict)
                            TaskPlayAnim(ped, deadAnimDict, deadAnim, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
                        end
                    end
                end

                SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
            elseif InLaststand then
                sleep = 5

                if LaststandTime > Config.MinimumRevive then
                    if emsNotified then
                        DrawTxt(0.80, 1.44, 1.0,1.0, 0.4, "BILDIRIM GÖNDERILDI | ~b~" ..  math.ceil(LaststandTime) .. "~w~ SANIYE SONRA SANA YARDIM EDILEMEZ", 255, 255, 255, 255)
                    else
                        DrawTxt(0.80, 1.44, 1.0,1.0, 0.4, "[~b~G~s~] BILDIRIM GÖNDER | ~b~" ..  math.ceil(LaststandTime) .. "~w~ SANIYE SONRA SANA YARDIM EDILEMEZ", 255, 255, 255, 255)
                    end
                else
                    if emsNotified then
                        DrawTxt(0.80, 1.44, 1.0,1.0, 0.4, "BILDIRIM GÖNDERILDI | ~b~" ..  math.ceil(LaststandTime) .. "~w~ SANIYE SONRA SANA YARDIM EDILEMEZ", 255, 255, 255, 255)
                    else
                        DrawTxt(0.80, 1.44, 1.0,1.0, 0.4, "[~b~G~s~] BILDIRIM GÖNDER | ~b~" ..  math.ceil(LaststandTime) .. "~w~ SANIYE SONRA SANA YARDIM EDILEMEZ", 255, 255, 255, 255)
                    end
                end

                if IsControlJustPressed(0, 47) and not emsNotified then
                    emstime = GetGameTimer() + 150000
                    -- TriggerServerEvent('hospital:server:ambulanceAlert', Lang:t('info.civ_down'))
                    -- TriggerEvent("Tgiann-PolisBildirim:BildirimGonder", "Yaralı Vatandaş", false, false, false, "ambulance")
                    playerCoords = GetEntityCoords(PlayerPedId())
                    data = {dispatchCode = 'persondown', caller = "İhbar", coords = playerCoords, netId = NetworkGetNetworkIdFromEntity(playerPed), length = 20000}
                    TriggerServerEvent('wf-alerts:svNotify', data)
                    emsNotified = true
                end

                if emstime then
                    if emstime < GetGameTimer() then
                        emsNotified = false
                        emstime = nil
                    end
                end

                if not isEscorted then
                    if IsPedInAnyVehicle(ped, false) then
                        loadAnimDict("veh@low@front_ps@idle_duck")
                        if not IsEntityPlayingAnim(ped, "veh@low@front_ps@idle_duck", "sit", 3) then
                            TaskPlayAnim(ped, "veh@low@front_ps@idle_duck", "sit", 1.0, 1.0, -1, 1, 0, 0, 0, 0)
                        end
                    else
                        loadAnimDict(lastStandDict)
                        if not IsEntityPlayingAnim(ped, deadAnimDict, deadAnim, 1.0, 1.0, -1, 1, 0, 0, 0, 0) then
                            TaskPlayAnim(ped, deadAnimDict, deadAnim, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
                        end
                    end
                else
                    if IsPedInAnyVehicle(ped, false) then
                        loadAnimDict("veh@low@front_ps@idle_duck")
                        if IsEntityPlayingAnim(ped, "veh@low@front_ps@idle_duck", "sit", 3) then
                            StopAnimTask(ped, "veh@low@front_ps@idle_duck", "sit", 3)
                        end
                    else
                        loadAnimDict(deadAnimDict)
                        if IsEntityPlayingAnim(ped, deadAnimDict, deadAnim, 1.0, 1.0, -1, 1, 0, 0, 0, 0) then
                            StopAnimTask(ped, deadAnimDict, deadAnim, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
                        end
                    end
                end
            end
		end
        Wait(sleep)
	end
end)
