local drugsInUse = 0
local drugStrength = 0
local addictions = {}
local immunity = 100
local addicted = false
local isSuffering = false
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    TriggerServerEvent('qb-addiction:Unload')
end)

RegisterNetEvent('qb-addiction:useMedication', function()
    local playerPed = PlayerPedId()
    pill(playerPed)
    updateHUD()
end)

RegisterNetEvent('qb-addiction:useDrug', function(drugName, gotAddicted)
    local player = PlayerId()
    local playerPed = PlayerPedId()
    local isInVehicle = IsPedInAnyVehicle(playerPed, false)

    if Config.UsableDrugs[drugName] then
        drugsInUse = drugsInUse + 1
        if drugStrength < 0 then drugStrength = 0 end
        drugStrength = drugStrength + Config.UsableDrugs[drugName].drugStrength
        if drugStrength > 0 then
            immunity = 100 - math.ceil((drugStrength/Config.DrugImmunity)*100)
        end

        -- Sadece araçta değilse animasyon çalıştır
        if not isInVehicle then
            if Config.UsableDrugs[drugName].animation == 'smoke' then
                smoke(playerPed)
            elseif Config.UsableDrugs[drugName].animation == 'syringe' then
                syringe(playerPed)
            elseif Config.UsableDrugs[drugName].animation == 'sniff' then
                sniff(playerPed)
            elseif Config.UsableDrugs[drugName].animation == 'pill' then
                pill(playerPed)
            elseif Config.UsableDrugs[drugName].animation == 'progressbar' then
                progbar(playerPed)
            end
        end

        if drugStrength > Config.DrugImmunity then
            removeEffects()
            SetEntityHealth(playerPed, 0)
            drugStrength = 0 
            immunity = 100
            SendNUIMessage({
                alert = true,
                drugName = 'Aşırı Dozda',
                content = {
                    header = 'Dikkat',
                    text = 'Kullandığınız',
                    description = 'Vücudunuz aldığınız ilaç miktarıyla başa çıkamadı...'
                }
            })
            updateHUD()
            return
        end

        if gotAddicted then
            SendNUIMessage({
                alert = true,
                drugName = Config.UsableDrugs[drugName].label,
                content = {
                    header = 'Dikkat',
                    text = 'Kullandığınız',
                    description = 'İlacın vücuttaki miktarı azaldıkça, kendinizi kötü hissedeceksiniz. Bağımlılıktan kurtulmak için doğru türde bir tedavi almanız gerekiyor.'
                }
            })
        end

        updateHUD()
        RequestAnimSet(Config.UsableDrugs[drugName].effect.walkingStyle)
        while not HasAnimSetLoaded(Config.UsableDrugs[drugName].effect.walkingStyle) do Wait(250) end
        SetPedMovementClipset(playerPed, Config.UsableDrugs[drugName].effect.walkingStyle, true)
        AnimpostfxPlay(Config.UsableDrugs[drugName].effect.screenFX, Config.UsableDrugs[drugName].effect.duration*1000, false)
        SetRunSprintMultiplierForPlayer(player, Config.UsableDrugs[drugName].effect.speedMultiplier)
        SetPedMotionBlur(playerPed, true)
        SetPedIsDrunk(playerPed, true)
        ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", Config.UsableDrugs[drugName].effect.cameraShakeIntensity)

        Wait(80000)
        removeEffects(drugName)
    end
end)



function loadAnimDict(name)
    RequestAnimDict(name)
    while (not HasAnimDictLoaded(name)) do Wait(250) end
end

function progbar(playerPed)
    local playerPed = PlayerPedId()
    QBCore.Functions.Progressbar('use_pain_killer', 'Joint içiliyor', 3500, false, false, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- İşlem tamamlandığında
        exports['ZSX_UIV2']:Notification("Başarılı", "Jointi İçtin!", "fas fa-check-circle", 5000)
        SetPedArmour(playerPed, GetPedArmour(playerPed) + 0)
        updateHUD()
    end, function() -- İşlem iptal edildiğinde
        exports['ZSX_UIV2']:Notification("Hata", "İşlem iptal edildi!", "fas fa-times-circle", 5000)
    end)
end


function sniff(playerPed)
    loadAnimDict("anim@mp_player_intcelebrationmale@face_palm")
    TaskPlayAnim(playerPed,"anim@mp_player_intcelebrationmale@face_palm","face_palm",8.0,8.0, -1, 0, 0, true, true, true)
    Wait(2500)
    ClearPedTasks(playerPed)
end

function pill(playerPed)
    loadAnimDict("mp_suicide")
    TaskPlayAnim(playerPed,"mp_suicide","pill",8.0,8.0, -1, 0, 0, true, true, true)
    Wait(2500)
    ClearPedTasks(playerPed)
end

function syringe(playerPed)
    loadAnimDict("rcmpaparazzo1ig_4")
    TaskPlayAnim(playerPed,"rcmpaparazzo1ig_4","miranda_shooting_up",8.0,8.0, -1, 16, 0, true, true, true)
    local hash = GetHashKey("prop_syringe_01")
    RequestModel(hash)
    while not HasModelLoaded(hash) do Wait(0) end
    local prop = CreateObject(hash, GetEntityCoords(playerPed), true, true, false)
    SetModelAsNoLongerNeeded(hash)
    AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.03, 0.03, 143.0, 30.0, 0.0, true, true, false, false, 1, true)
    Wait(13000)
    AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 28422), -0.02, 0.01, -0.02, 1.0, 0, 0.0, true, true, false, false, 1, true)
    Wait(15000)
    DetachEntity(prop, 0, 0)
    DeleteEntity(prop)
    ClearPedTasks(playerPed)
end

function smoke(playerPed)
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Wait(10000)
    ClearPedTasks(playerPed)
end

function removeEffects(drugName)
    local player = PlayerId()
    local playerPed = PlayerPedId()
    drugsInUse = drugsInUse - 1
    
    if drugName then
        drugStrength = drugStrength - Config.UsableDrugs[drugName].drugStrength
        immunity = 100 - math.ceil((drugStrength/Config.DrugImmunity)*100)
        if drugStrength <= 0 then 
            drugStrength = 0
            immunity = 100
        end
        updateHUD()
    end
    
    if drugsInUse <= 0 then
        -- Reset player speed
        SetRunSprintMultiplierForPlayer(player, 1.0)
        
        -- Disable motion blur
        SetPedMotionBlur(playerPed, false)
        
        -- Reset the player's walking style to normal
        ResetPedMovementClipset(playerPed, 0)
        
        -- Ensure the drunk state is reset
        SetPedIsDrunk(playerPed, false)
        
        -- Stop any ongoing camera shake
        StopGameplayCamShaking(false)
        
        -- Stop any ongoing screen effects
        AnimpostfxStopAll()
        
        -- Reapply the normal walk style to ensure it's reset
        ClearPedTasksImmediately(playerPed)
        
        -- Set the camera back to normal view
        SetGameplayCamShakeAmplitude(0.0)
    end
end


RegisterNetEvent('qb-addiction:data', function(data, use)
    addictions = data
    if use then
        return
    end
    updateHUD()
end)

function updateHUD()
    local data = {}
    if immunity < 0 then
        immunity = 0
    elseif immunity > 100 then
        immunity = 100
    end
    if immunity < 100 then table.insert(data, {name = 'Bağışıklık', percent = immunity}) end
    local addict = false
    for k, v in pairs(addictions) do
        local percent = math.ceil((v/Config.UsableDrugs[k].addiction.time)*100)
        if v <= 0 then addict = true end
        table.insert(data, {name = Config.UsableDrugs[k].label, percent = percent})
    end
    addicted = addict
    if addicted then 
        suffering()
    else
        isSuffering = false
    end
    SendNUIMessage({data = data})
end

function suffering()
    if isSuffering then return end
    isSuffering = true
    local playerPed = PlayerPedId()
    Citizen.CreateThread(function()
        while addicted do
            DisableControlAction(0, 21, true)
            AnimpostfxPlay("DeathFailMPIn", 0, true)
            Wait(1)
            if GetHashKey("MOVE_M@DRUNK@SLIGHTLYDRUNK") ~= GetPedMovementClipset(PlayerPedId()) then 
                RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
                while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do Wait(250) end
                SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
            end
        end
        AnimpostfxStop("DeathFailMPIn")
        ResetPedMovementClipset(playerPed)
        return
    end)
end