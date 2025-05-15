local progressActive = false  -- Aynı anda yalnızca tek progress işlemi çalışsın
local playerState = LocalPlayer.state
local createdProps = {}

---@class ProgressPropProps
---@field model string
---@field bone? number
---@field pos vector3
---@field rot vector3
---@field rotOrder? number

---@class ProgressProps
---@field label? string
---@field duration number
---@field position? 'middle' | 'bottom'
---@field useWhileDead? boolean
---@field allowRagdoll? boolean
---@field allowCuffed? boolean
---@field allowFalling? boolean
---@field allowSwimming? boolean
---@field canCancel? boolean
---@field anim? { dict?: string, clip: string, flag?: number, blendIn?: number, blendOut?: number, duration?: number, playbackRate?: number, lockX?: boolean, lockY?: boolean, lockZ?: boolean, scenario?: string, playEnter?: boolean }
---@field prop? ProgressPropProps | ProgressPropProps[]
---@field disable? { move?: boolean, sprint?: boolean, car?: boolean, combat?: boolean, mouse?: boolean }
---@field icon? string   -- İsteğe bağlı, progress simgesi (varsayılan: "fas fa-circle")

-- Prop yaratma fonksiyonu (varsa animasyon ya da ek gösterim için)
local function createProp(ped, prop)
    lib.requestModel(prop.model)
    local coords = GetEntityCoords(ped)
    local object = CreateObject(prop.model, coords.x, coords.y, coords.z, false, false, false)
    AttachEntityToEntity(object, ped, GetPedBoneIndex(ped, prop.bone or 60309), 
        prop.pos.x, prop.pos.y, prop.pos.z,
        prop.rot.x, prop.rot.y, prop.rot.z,
        true, true, false, true, prop.rotOrder or 0, true)
    SetModelAsNoLongerNeeded(prop.model)
    return object
end

-- Eğer progress sırasında oyuncu durumuna (ölü, ragdoll, kelepçeli, düşüyor, yüzüyor) bağlı iptal kontrolü isteniyorsa
local function interruptProgress(data)
    if not data.useWhileDead and IsEntityDead(cache.ped) then return true end
    if not data.allowRagdoll and IsPedRagdoll(cache.ped) then return true end
    if not data.allowCuffed and IsPedCuffed(cache.ped) then return true end
    if not data.allowFalling and IsPedFalling(cache.ped) then return true end
    if not data.allowSwimming and IsPedSwimming(cache.ped) then return true end
    return false
end

-- Eski kontrol disable işlemleri – artık export fonksiyonuna disableControls parametresi verilecek,
-- fakat ekstra kontrollerden (interruptProgress gibi) döngü içerisinde iptal kontrolü yapıyoruz.
local isFivem = cache.game == 'fivem'
local controls = {
    INPUT_LOOK_LR = isFivem and 1 or 0xA987235F,
    INPUT_LOOK_UD = isFivem and 2 or 0xD2047988,
    INPUT_SPRINT = isFivem and 21 or 0x8FFC75D6,
    INPUT_AIM = isFivem and 25 or 0xF84FA74F,
    INPUT_MOVE_LR = isFivem and 30 or 0x4D8FB4C1,
    INPUT_MOVE_UD = isFivem and 31 or 0xFDA83190,
    INPUT_DUCK = isFivem and 36 or 0xDB096B85,
    INPUT_VEH_MOVE_LEFT_ONLY = isFivem and 63 or 0x9DF54706,
    INPUT_VEH_MOVE_RIGHT_ONLY = isFivem and 64 or 0x97A8FD98,
    INPUT_VEH_ACCELERATE = isFivem and 71 or 0x5B9FD4E2,
    INPUT_VEH_BRAKE = isFivem and 72 or 0x6E1F639B,
    INPUT_VEH_EXIT = isFivem and 75 or 0xFEFAB9B4,
    INPUT_VEH_MOUSE_CONTROL_OVERRIDE = isFivem and 106 or 0x39CCABD5
}

---------------------------------------------------------------
-- ZSX_UIV2 ile entegre edilmiş progress bar fonksiyonu
---------------------------------------------------------------
---@param data ProgressProps
---@return boolean?  -- İşlem tamamlandıysa true, iptal edildiyse false döner
function lib.progressBar(data)
    while progressActive do Wait(0) end
    progressActive = true

    -- ZSX_UIV2'nin disableControls formatına uygun obje oluşturma
    local disableControls = {
        disable_mouse   = data.disable and data.disable.mouse   or false,
        disable_walk    = data.disable and data.disable.move    or false,
        disable_driving = data.disable and data.disable.car     or false,
        disable_combat  = data.disable and data.disable.combat  or false
    }

    local icon = data.icon or "fas fa-circle"
    local text = data.label or "Task in progress"
    local duration = data.duration or 3000
    local canCancel = data.canCancel or false
    local anim = data.anim

    local prop1, prop2 = nil, nil
    if data.prop then
        if type(data.prop) == "table" and data.prop.model then
            prop1 = data.prop
        elseif type(data.prop) == "table" then
            prop1 = data.prop[1]
            prop2 = data.prop[2]
        end
    end

    local finished, canceled = false, false

    -- ZSX_UIV2 progress bar export fonksiyonu çağrısı
    exports['ZSX_UIV2']:ProgressBar(
        icon, 
        text, 
        duration,
        function() finished = true end,
        function() canceled = true end,
        canCancel,
        disableControls,
        anim,
        prop1,
        prop2
    )

    -- İşlem süresince interruptProgress kontrolü yapılıyor
    while not finished and not canceled do
        Wait(0)
        if interruptProgress(data) then
            canceled = true
        end
    end

    progressActive = false
    return finished
end

---------------------------------------------------------------
-- ZSX_UIV2 ile entegre edilmiş progress circle fonksiyonu
---------------------------------------------------------------
---@param data ProgressProps
---@return boolean?
function lib.progressCircle(data)
    while progressActive do Wait(0) end
    progressActive = true

    local disableControls = {
        disable_mouse   = data.disable and data.disable.mouse   or false,
        disable_walk    = data.disable and data.disable.move    or false,
        disable_driving = data.disable and data.disable.car     or false,
        disable_combat  = data.disable and data.disable.combat  or false
    }

    local icon = data.icon or "fas fa-circle"
    local text = data.label or "Task in progress"
    local duration = data.duration or 3000
    local canCancel = data.canCancel or false
    local anim = data.anim

    local prop1, prop2 = nil, nil
    if data.prop then
        if type(data.prop) == "table" and data.prop.model then
            prop1 = data.prop
        elseif type(data.prop) == "table" then
            prop1 = data.prop[1]
            prop2 = data.prop[2]
        end
    end

    local finished, canceled = false, false

    exports['ZSX_UIV2']:ProgressBar(
        icon, 
        text, 
        duration,
        function() finished = true end,
        function() canceled = true end,
        canCancel,
        disableControls,
        anim,
        prop1,
        prop2
    )

    while not finished and not canceled do
        Wait(0)
        if interruptProgress(data) then
            canceled = true
        end
    end

    progressActive = false
    return finished
end

---------------------------------------------------------------
-- Progress işlemini iptal eden fonksiyon
---------------------------------------------------------------
function lib.cancelProgress()
    if not progressActive then
        error('No progress bar is active')
    end
    -- Eğer ZSX_UIV2 için direkt iptal fonksiyonu varsa onu burada çağırabilirsiniz;
    -- aksi halde bayrağı false yaparak iptal sinyali veriyoruz.
    progressActive = false
end

---------------------------------------------------------------
-- Aktif progress işleminin durumunu döndürür
---------------------------------------------------------------
---@return boolean
function lib.progressActive()
    return progressActive
end

---------------------------------------------------------------
-- Aşağıdaki kısım, progress ile ilişkili prop'ların (örn. el objeleri) oluşturulması ve temizlenmesi
---------------------------------------------------------------
local function deleteProgressProps(serverId)
    local playerProps = createdProps[serverId]
    if not playerProps then return end
    for i = 1, #playerProps do
        local prop = playerProps[i]
        if DoesEntityExist(prop) then
            DeleteEntity(prop)
        end
    end
    createdProps[serverId] = nil
end

RegisterNetEvent('onPlayerDropped', function(serverId)
    deleteProgressProps(serverId)
end)

AddStateBagChangeHandler('lib:progressProps', nil, function(bagName, key, value, reserved, replicated)
    if replicated then return end

    local ply = GetPlayerFromStateBagName(bagName)
    if ply == 0 then return end

    local ped = GetPlayerPed(ply)
    local serverId = GetPlayerServerId(ply)
    
    if not value then
        return deleteProgressProps(serverId)
    end
    
    createdProps[serverId] = {}
    local playerProps = createdProps[serverId]
    
    if value.model then
        playerProps[#playerProps + 1] = createProp(ped, value)
    else
        for i = 1, #value do
            local prop = value[i]
            if prop then
                playerProps[#playerProps + 1] = createProp(ped, prop)
            end
        end
    end
end)

---------------------------------------------------------------
-- NUI Callback'ı: Eğer eski progress export kullanılmışsa bunu kaldırabilirsiniz.
---------------------------------------------------------------
RegisterNUICallback('progressComplete', function(data, cb)
    cb(1)
    progressActive = false
end)

-- İptal komutu (varsayılan olarak 'x' tuşu ile tetiklenir)
RegisterCommand('cancelprogress', function()
    if progressActive and progressActive.canCancel then 
        progressActive = false 
    end
end)

if isFivem then
    RegisterKeyMapping('cancelprogress', locale('cancel_progress'), 'keyboard', 'x')
end
