local binocularsActive = false
local fov_max = 70.0
local fov_min = 5.0
local fov = (fov_max + fov_min) * 0.5
local speed_lr = 8.0
local speed_ud = 8.0

-- HUD Bileşenlerini Gizleme Fonksiyonu
local function HideHUDThisFrame()
    local componentsToHide = {1, 2, 3, 4, 6, 7, 8, 9, 11, 12, 13, 15, 18, 19}

    for _, component in ipairs(componentsToHide) do
        HideHudComponentThisFrame(component)
    end

    HideHelpTextThisFrame()
    HideHudAndRadarThisFrame()
end

-- Kamera Dönüş ve Kontrol
local function checkInputRot(cam, zoomValue)
    local rightAxisX = GetDisabledControlNormal(0, 220)
    local rightAxisY = GetDisabledControlNormal(0, 221)
    local rot = GetCamRot(cam, 2)

    if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
        local new_z = rot.z + rightAxisX * -1.0 * speed_ud * (zoomValue + 0.1)
        local new_x = math.max(math.min(20.0, rot.x + rightAxisY * -1.0 * speed_lr * (zoomValue + 0.1)), -89.5)
        SetCamRot(cam, new_x, 0.0, new_z, 2)
        SetEntityHeading(PlayerPedId(), new_z)
    end
end

-- Zoom Kontrolü
local function handleZoom(cam)
    local ped = PlayerPedId()
    local scrollUpControl = IsPedSittingInAnyVehicle(ped) and 17 or 241
    local scrollDownControl = IsPedSittingInAnyVehicle(ped) and 16 or 242

    if IsControlJustPressed(0, scrollUpControl) then
        fov = math.max(fov - Config.Binoculars.zoomSpeed, fov_min)
    end

    if IsControlJustPressed(0, scrollDownControl) then
        fov = math.min(fov + Config.Binoculars.zoomSpeed, fov_max)
    end

    local current_fov = GetCamFov(cam)

    if math.abs(fov - current_fov) < 0.1 then
        fov = current_fov
    end

    SetCamFov(cam, current_fov + (fov - current_fov) * 0.05)
end

-- Dürbün Döngüsü
local function binocularLoop()
    CreateThread(function()
        local ped = PlayerPedId()

        if not IsPedSittingInAnyVehicle(ped) then
            TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_BINOCULARS', 0, true)
            PlayPedAmbientSpeechNative(ped, 'GENERIC_CURSE_MED', 'SPEECH_PARAMS_FORCE')
        end

        Wait(2500)

        SetTimecycleModifier('default')
        SetTimecycleModifierStrength(0.3)

        local scaleform = RequestScaleformMovie('BINOCULARS')
        while not HasScaleformMovieLoaded(scaleform) do
            Wait(10)
        end

        local cam = CreateCam('DEFAULT_SCRIPTED_FLY_CAMERA', true)
        AttachCamToEntity(cam, ped, 0.0, 0.0, 1.0, true)
        SetCamRot(cam, 0.0, 0.0, GetEntityHeading(ped), 2)
        SetCamFov(cam, fov)
        RenderScriptCams(true, false, 0, true, false)
        PushScaleformMovieFunction(scaleform, 'SET_CAM_LOGO')
        PushScaleformMovieFunctionParameterInt(0)
        PopScaleformMovieFunctionVoid()

        while binocularsActive and IsPedUsingScenario(ped, 'WORLD_HUMAN_BINOCULARS') do
            if IsControlJustPressed(0, Config.Binoculars.storeBinocularsKey) then
                binocularsActive = false
                PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
                ClearPedTasks(ped)
            end

            local zoomValue = (1.0 / (fov_max - fov_min)) * (fov - fov_min)
            checkInputRot(cam, zoomValue)
            handleZoom(cam)
            HideHUDThisFrame()
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
            Wait(1000)
        end

        -- Temizlik İşlemleri
        binocularsActive = false
        ClearTimecycleModifier()
        fov = (fov_max + fov_min) * 0.5
        RenderScriptCams(false, false, 0, true, false)
        SetScaleformMovieAsNoLongerNeeded(scaleform)
        DestroyCam(cam, false)
        SetNightvision(false)
        SetSeethrough(false)
    end)
end




-- Etkinlik: Dürbünleri Aç/Kapat
RegisterNetEvent('binoculars:Toggle', function()
    binocularsActive = not binocularsActive
    if binocularsActive then
        binocularLoop()
    else
        ClearPedTasks(PlayerPedId())
    end
end)
