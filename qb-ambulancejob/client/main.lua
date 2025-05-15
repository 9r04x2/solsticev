QBCore = exports['qb-core']:GetCoreObject()

local getOutDict = 'switch@franklin@bed'
local getOutAnim = 'sleep_getup_rubeyes'
local canLeaveBed = true
local bedOccupying = nil
local bedObject = nil
local bedOccupyingData = nil
local closestBed = nil
local doctorCount = 0
local CurrentDamageList = {}
local cam = nil
local playerArmor = nil
inBedDict = "anim@gangops@morgue@table@"
inBedAnim = "body_search"
isInHospitalBed = false
isBleeding = 0
bleedTickTimer, advanceBleedTimer = 0, 0
fadeOutTimer, blackoutTimer = 0, 0
legCount = 0
armcount = 0
headCount = 0
playerHealth = nil
isDead = false
isStatusChecking = false
statusChecks = {}
statusCheckTime = 0
healAnimDict = "mini@cpr@char_a@cpr_str"
healAnim = "cpr_pumpchest"
injured = {}

BodyParts = {
    ['HEAD'] =          { label = Lang:t('body.head'),          causeLimp = false, isDamaged = false, severity = 0 },
    ['NECK'] =          { label = Lang:t('body.neck'),          causeLimp = false, isDamaged = false, severity = 0 },
    ['SPINE'] =         { label = Lang:t('body.spine'),         causeLimp = true, isDamaged = false, severity = 0 },
    ['UPPER_BODY'] =    { label = Lang:t('body.upper_body'),    causeLimp = false, isDamaged = false, severity = 0 },
    ['LOWER_BODY'] =    { label = Lang:t('body.lower_body'),    causeLimp = true, isDamaged = false, severity = 0 },
    ['LARM'] =          { label = Lang:t('body.left_arm'),      causeLimp = false, isDamaged = false, severity = 0 },
    ['LHAND'] =         { label = Lang:t('body.left_hand'),     causeLimp = false, isDamaged = false, severity = 0 },
    ['LFINGER'] =       { label = Lang:t('body.left_fingers'),  causeLimp = false, isDamaged = false, severity = 0 },
    ['LLEG'] =          { label = Lang:t('body.left_leg'),      causeLimp = true, isDamaged = false, severity = 0 },
    ['LFOOT'] =         { label = Lang:t('body.left_foot'),     causeLimp = true, isDamaged = false, severity = 0 },
    ['RARM'] =          { label = Lang:t('body.right_arm'),     causeLimp = false, isDamaged = false, severity = 0 },
    ['RHAND'] =         { label = Lang:t('body.right_hand'),    causeLimp = false, isDamaged = false, severity = 0 },
    ['RFINGER'] =       { label = Lang:t('body.right_fingers'), causeLimp = false, isDamaged = false, severity = 0 },
    ['RLEG'] =          { label = Lang:t('body.right_leg'),     causeLimp = true, isDamaged = false, severity = 0 },
    ['RFOOT'] =         { label = Lang:t('body.right_foot'),    causeLimp = true, isDamaged = false, severity = 0 },
}

-- Fonksiyonlar

local function GetAvailableBed(bedId)
    local pos = GetEntityCoords(PlayerPedId())
    local retval = nil
    if bedId == nil then
        for k, bed in pairs(Config.Locations["beds"]) do
            if not bed.taken and #(pos - vector3(bed.coords.x, bed.coords.y, bed.coords.z)) < 500 then
                retval = k
                break -- ilk uygun yatak bulununca döndür
            end
        end
    else
        local bed = Config.Locations["beds"][bedId]
        if bed and not bed.taken and #(pos - vector3(bed.coords.x, bed.coords.y, bed.coords.z)) < 500 then
            retval = bedId
        end
    end
    print('retval: ' .. tostring(retval))
    return retval
end

local function GetDamagingWeapon(ped)
    for k, v in pairs(Config.Weapons) do
        if HasPedBeenDamagedByWeapon(ped, k, 0) then
            return v
        end
    end
    return nil
end

local function IsDamagingEvent(damageDone, weapon)
    local luck = math.random(100)
    local multi = damageDone / Config.HealthDamage
    return luck < (Config.HealthDamage * multi) or (damageDone >= Config.ForceInjury or multi > Config.MaxInjuryChanceMulti or Config.ForceInjuryWeapons[weapon])
end

local function DoLimbAlert()
    if not isDead and not InLaststand then
        if #injured > 0 then
            local limbDamageMsg = ''
            if #injured <= Config.AlertShowInfo then
                for k, v in pairs(injured) do
                    limbDamageMsg = limbDamageMsg .. Lang:t('info.pain_message', { limb = v.label, severity = Config.WoundStates[v.severity] })
                    if k < #injured then
                        limbDamageMsg = limbDamageMsg .. " | "
                    end
                end
            else
                limbDamageMsg = Lang:t('info.many_places')
            end
            QBCore.Functions.Notify(limbDamageMsg, "inform")
        end
    end
end

local function DoBleedAlert()
    if not isDead and tonumber(isBleeding) > 0 then
        QBCore.Functions.Notify(Lang:t('info.bleed_alert', { bleedstate = Config.BleedingStates[tonumber(isBleeding)].label }), "error")
    end
end

local function ApplyBleed(level)
    if isBleeding < 4 then
        isBleeding = math.min(isBleeding + level, 4)
        DoBleedAlert()
    end
end

local function SetClosestBed()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local current, dist = nil, nil
    for k, bed in pairs(Config.Locations["beds"]) do
        local d = #(pos - vector3(bed.coords.x, bed.coords.y, bed.coords.z))
        if not current or d < dist then
            current = k
            dist = d
        end
    end
    if current ~= closestBed and not isInHospitalBed then
        closestBed = current
    end
end

local function IsInjuryCausingLimp()
    for _, v in pairs(BodyParts) do
        if v.causeLimp and v.isDamaged then
            return true
        end
    end
    return false
end

local function ProcessRunStuff(ped)
    if IsInjuryCausingLimp() then
        RequestAnimSet("move_m@injured")
        while not HasAnimSetLoaded("move_m@injured") do
            Wait(0)
        end
        SetPedMovementClipset(ped, "move_m@injured", 1)
        SetPlayerSprint(PlayerId(), false)
    end
end

function ResetPartial()
    for _, v in pairs(BodyParts) do
        if v.isDamaged and v.severity <= 2 then
            v.isDamaged = false
            v.severity = 0
        end
    end

    for k, v in pairs(injured) do
        if v.severity <= 2 then
            v.severity = 0
            table.remove(injured, k)
        end
    end

    if isBleeding <= 2 then
        isBleeding = 0
        bleedTickTimer = 0
        advanceBleedTimer = 0
        fadeOutTimer = 0
        blackoutTimer = 0
    end

    TriggerServerEvent('hospital:server:SyncInjuries', {
        limbs = BodyParts,
        isBleeding = tonumber(isBleeding)
    })

    ProcessRunStuff(PlayerPedId())
    DoLimbAlert()
    DoBleedAlert()

    TriggerServerEvent('hospital:server:SyncInjuries', {
        limbs = BodyParts,
        isBleeding = tonumber(isBleeding)
    })
end

function ResetAll()
    isBleeding = 0
    bleedTickTimer = 0
    advanceBleedTimer = 0
    fadeOutTimer = 0
    blackoutTimer = 0
    onDrugs = 0
    wasOnDrugs = false
    onPainKiller = 0
    wasOnPainKillers = false
    injured = {}

    for _, v in pairs(BodyParts) do
        v.isDamaged = false
        v.severity = 0
    end

    TriggerServerEvent('hospital:server:SyncInjuries', {
        limbs = BodyParts,
        isBleeding = tonumber(isBleeding)
    })

    CurrentDamageList = {}
    ProcessRunStuff(PlayerPedId())
    DoLimbAlert()
    DoBleedAlert()
    TriggerServerEvent('hospital:server:SyncInjuries', {
        limbs = BodyParts,
        isBleeding = tonumber(isBleeding)
    })
    TriggerServerEvent("hospital:server:resetHungerThirst")
end

local function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(1)
    end
end

-- SET BED CAM: Ek anti-hile kontrolü eklendi; geçerli yatak verisi (bedOccupyingData) yoksa işlem iptal edilir.
local function SetBedCam()
    if not bedOccupyingData or not bedOccupyingData.coords then
        QBCore.Functions.Notify("Geçerli yatak verisi bulunamadı!", "error")
        return
    end

    isInHospitalBed = true
    canLeaveBed = false
    local player = PlayerPedId()

    DoScreenFadeOut(1000)
    while not IsScreenFadedOut() do
        Wait(100)
    end

    if IsPedDeadOrDying(player) then
        local pos = GetEntityCoords(player, true)
        NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z, GetEntityHeading(player), true, false)
    end

    bedObject = GetClosestObjectOfType(bedOccupyingData.coords.x, bedOccupyingData.coords.y, bedOccupyingData.coords.z, 1.0, bedOccupyingData.model, false, false, false)
    if bedObject then
        FreezeEntityPosition(bedObject, true)
    else
        QBCore.Functions.Notify("Yatak nesnesi bulunamadı!", "error")
        return
    end

    SetEntityCoords(player, bedOccupyingData.coords.x, bedOccupyingData.coords.y, bedOccupyingData.coords.z + 0.02)
    Wait(500)
    FreezeEntityPosition(player, true)

    loadAnimDict(inBedDict)
    TaskPlayAnim(player, inBedDict, inBedAnim, 8.0, 1.0, -1, 1, 0, false, false, false)
    SetEntityHeading(player, bedOccupyingData.coords.w)

    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)
    AttachCamToPedBone(cam, player, 31085, 0, 1.0, 1.0, true)
    SetCamFov(cam, 90.0)
    local heading = GetEntityHeading(player)
    heading = (heading > 180) and heading - 180 or heading + 180
    SetCamRot(cam, -45.0, 0.0, heading, 2)

    DoScreenFadeIn(1000)
    Wait(1000)
    FreezeEntityPosition(player, true)
end

-- LeaveBed: Yatak verisi doğrulanarak yalnızca geçerli durumda işlem yapılır.
local function LeaveBed()
    if not bedOccupying or not bedObject then
        QBCore.Functions.Notify("Çıkış için geçerli yatak bulunamadı!", "error")
        return
    end

    local player = PlayerPedId()
    RequestAnimDict(getOutDict)
    while not HasAnimDictLoaded(getOutDict) do
        Wait(0)
    end

    FreezeEntityPosition(player, false)
    SetEntityInvincible(player, false)
    SetEntityHeading(player, bedOccupyingData and (bedOccupyingData.coords.w + 90) or 0)
    TaskPlayAnim(player, getOutDict, getOutAnim, 100.0, 1.0, -1, 8, -1, false, false, false)
    Wait(4000)
    ClearPedTasks(player)
    TriggerServerEvent('hospital:server:LeaveBed', bedOccupying)
    FreezeEntityPosition(bedObject, true)
    RenderScriptCams(false, true, 200, true, true)
    DestroyCam(cam, false)
    cam = nil
    bedOccupying = nil
    bedObject = nil
    bedOccupyingData = nil
    isInHospitalBed = false

    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.metadata["injail"] > 0 then
            TriggerEvent("prison:client:Enter", PlayerData.metadata["injail"])
        end
    end)
end

-- Canlandırma (Revive) ve İyileştirme işlemleri

RegisterNetEvent('hospital:client:Revive', function(tip, key)
    TriggerServerEvent('mikrofon-kapat', false)
    local player = PlayerPedId()

    if isDead or InLaststand then
        local pos = GetEntityCoords(player, true)
        NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z, GetEntityHeading(player), true, false)
        isDead = false
        SetEntityInvincible(player, false)
        SetLaststand(false)
    end

    if isInHospitalBed then
        loadAnimDict(inBedDict)
        TaskPlayAnim(player, inBedDict, inBedAnim, 8.0, 1.0, -1, 1, 0, false, false, false)
        canLeaveBed = true
    end

    TriggerServerEvent("hospital:server:RestoreWeaponDamage")
    if tip == "laststand" then
        SetEntityHealth(player, 120)
    else
        SetEntityHealth(player, 200)
    end
    SetEntityMaxHealth(player, 200)
    ClearPedBloodDamage(player)
    SetPlayerSprint(PlayerId(), true)
    ResetAll()
    ResetPedMovementClipset(player, 0.0)
    TriggerServerEvent('hud:server:RelieveStress', 100)
    TriggerServerEvent("hospital:server:SetDeathStatus", false)
    TriggerServerEvent("hospital:server:SetLaststandStatus", false)
    exports['pma-voice']:resetProximityCheck()
    emsNotified = false
    QBCore.Functions.Notify(Lang:t('info.healthy'))
end)

RegisterNetEvent('hospital:client:SetPain', function()
    ApplyBleed(math.random(1, 4))
    if not BodyParts[Config.Bones[24816]].isDamaged then
        BodyParts[Config.Bones[24816]].isDamaged = true
        BodyParts[Config.Bones[24816]].severity = math.random(1, 4)
        injured[#injured + 1] = {
            part = Config.Bones[24816],
            label = BodyParts[Config.Bones[24816]].label,
            severity = BodyParts[Config.Bones[24816]].severity
        }
    end

    if not BodyParts[Config.Bones[40269]].isDamaged then
        BodyParts[Config.Bones[40269]].isDamaged = true
        BodyParts[Config.Bones[40269]].severity = math.random(1, 4)
        injured[#injured + 1] = {
            part = Config.Bones[40269],
            label = BodyParts[Config.Bones[40269]].label,
            severity = BodyParts[Config.Bones[40269]].severity
        }
    end

    TriggerServerEvent('hospital:server:SyncInjuries', {
        limbs = BodyParts,
        isBleeding = tonumber(isBleeding)
    })
end)

RegisterNetEvent('hospital:client:KillPlayer', function()
    SetEntityHealth(PlayerPedId(), 0)
end)

RegisterNetEvent('hospital:client:HealInjuries', function(type)
    if type == "full" then
        ResetAll()
    else
        ResetPartial()
    end
    TriggerServerEvent("hospital:server:RestoreWeaponDamage")
    QBCore.Functions.Notify(Lang:t('success.wounds_healed'), 'success')
end)

RegisterNetEvent('hospital:client:SendToBed', function(id, data, isRevive)
    bedOccupying = id
    bedOccupyingData = data
    SetBedCam()
    CreateThread(function()
        Wait(5)
        if isRevive then
            QBCore.Functions.Notify(Lang:t('success.being_helped'), 'success')
            QBCore.Functions.Progressbar("reviveing", "Tedavi Oluyorsun", Config.AIHealTimer * 1000, false, false, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- İşlem tamamlandığında
                QBCore.Functions.Notify("Tedavi oldunuz", 'success')
                TriggerEvent("hospital:client:Revive", false)
            end)
        else
            canLeaveBed = true
        end
    end)
end)

RegisterNetEvent("hospital:client:hastanede", function()
    anayin()
    QBCore.Functions.Notify(Lang:t('success.being_helped'), 'success')
    QBCore.Functions.Progressbar("reviveing", "Tedavi Oluyorsun", Config.AIHealTimer * 1000, false, false, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- İşlem tamamlandığında
        QBCore.Functions.Notify("Tedavi oldunuz", 'success')
        TriggerEvent("hospital:client:Revive", false)
    end)
end)

RegisterNetEvent('hospital:client:SetBed', function(id, isTaken)
    if Config.Locations["beds"][id] then
        Config.Locations["beds"][id].taken = isTaken
    end
end)

RegisterNetEvent('hospital:client:SetBed2', function(id, isTaken)
    Config.Locations["jailbeds"][id].taken = isTaken
end)

RegisterNetEvent('hospital:client:RespawnAtHospital', function(key)
    TriggerServerEvent("hospital:server:RespawnAtHospital")
    if exports["qb-policejob"]:IsHandcuffed() then
        TriggerEvent("police:client:GetCuffed", -1)
    end
    TriggerEvent("police:client:DeEscort")
end)

RegisterNetEvent('hospital:client:SendBillEmail', function(amount)
    SetTimeout(math.random(2500, 4000), function()
        local gender = Lang:t('info.mr')
        if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then
            gender = Lang:t('info.mrs')
        end
        local charinfo = QBCore.Functions.GetPlayerData().charinfo
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Lang:t('mail.sender'),
            subject = Lang:t('mail.subject'),
            message = Lang:t('mail.message', { gender = gender, lastname = charinfo.lastname, costs = amount }),
            button = {}
        })
    end)
end)

RegisterNetEvent('hospital:client:SetDoctorCount', function(amount)
    doctorCount = amount
end)

RegisterNetEvent('hospital:client:adminHeal', function()
    local ped = PlayerPedId()
    SetEntityHealth(ped, 200)
    TriggerServerEvent("hospital:server:resetHungerThirst")
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    local ped = PlayerPedId()
    TriggerServerEvent("hospital:server:SetDeathStatus", false)
    TriggerServerEvent('hospital:server:SetLaststandStatus', false)
    exports['pma-voice']:resetProximityCheck()
    TriggerServerEvent("hospital:server:SetArmor", GetPedArmour(ped))
    if bedOccupying then
        TriggerServerEvent("hospital:server:LeaveBed", bedOccupying)
    end
    isDead = false
    deathTime = 0
    SetEntityInvincible(ped, false)
    SetPedArmour(ped, 0)
    ResetAll()
end)

-- Threads

CreateThread(function()
    while true do
        local sleep = 1000
        if isInHospitalBed and canLeaveBed then
            sleep = 0
            exports['qb-core']:DrawText(Lang:t('text.bed_out'))
            if IsControlJustReleased(0, 38) then
                exports['qb-core']:KeyPressed(38)
                LeaveBed()
                exports['qb-core']:HideText()
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    while true do
        Wait((1000 * Config.MessageTimer))
        DoLimbAlert()
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        SetClosestBed()
        if isStatusChecking then
            statusCheckTime = statusCheckTime - 1
            if statusCheckTime <= 0 then
                statusChecks = {}
                isStatusChecking = false
            end
        end
    end
end)

-- Interaktif alanlar

local listen = false
local function CheckInControls(variable)
    CreateThread(function()
        listen = true
        while listen do
            if IsControlJustPressed(0, 38) then
                exports['qb-core']:KeyPressed(38)
                if variable == "checkin" then
                    TriggerEvent('qb-ambulancejob:checkin')
                    listen = false
                elseif variable == "beds" then
                    TriggerEvent('qb-ambulancejob:beds')
                    listen = false
                end
            end
            Wait(1)
        end
    end)
end

local onCooldown = false

RegisterNetEvent('qb-ambulancejob:checkin', function()
    QBCore.Functions.TriggerCallback('qb-ambulancejob:server:getOnDutyDoctors', function(doctorCount)

        if doctorCount >= 2 then
            if not onCooldown then
                local playerCoords = GetEntityCoords(PlayerPedId())
                local data = {
                    dispatchCode = 'calldoctor',
                    caller       = "İhbar",
                    coords       = playerCoords,
                    netId        = NetworkGetNetworkIdFromEntity(PlayerPedId()),
                    length       = 15000
                }
                TriggerServerEvent('wf-alerts:svNotify', data)
                QBCore.Functions.Notify("Birimlere çağrınız iletildi!", "success")

                onCooldown = true
                SetTimeout(60000, function()
                    onCooldown = false
                end)
            else
                QBCore.Functions.Notify("Zaten bir çağrı gönderdiniz. Lütfen bekleyin.", "error")
            end

        else
            TriggerEvent('animations:client:EmoteCommandStart', {"notal"})
            QBCore.Functions.Progressbar("hospital_checkin", Lang:t('progress.checking_in'), 2000, false, true, {
                disableMovement    = true,
                disableCarMovement = true,
                disableMouse       = false,
                disableCombat      = true,
            }, {}, {}, {}, function()
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                local bedId = GetAvailableBed()
                if bedId then
                    TriggerServerEvent("hospital:server:SendToBed", bedId, true)
                else
                    QBCore.Functions.Notify(Lang:t('error.beds_taken'), "error")
                end
            end, function()
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                QBCore.Functions.Notify(Lang:t('error.canceled'), "error")
            end)
        end

    end)
end)
RegisterNetEvent('qb-ambulancejob:beds', function()
    if GetAvailableBed(closestBed) then
        TriggerServerEvent("hospital:server:SendToBed", closestBed, false)
    else
        QBCore.Functions.Notify(Lang:t('error.beds_taken'), "error")
    end
end)


CreateThread(function()
    for k, v in pairs(Config.Locations["checking"]) do
        exports["qb-smallresources"]:pedcreate("doktor-"..k, `s_m_m_doctor_01`, 1144.47, -1539.77, 34.03, 278.85)
    end
end)

-- Convar turns into a boolean
if Config.UseTarget then
    CreateThread(function()
        for k, v in pairs(Config.Locations["checking"]) do
            exports['qb-target']:AddCircleZone("checking"..k, vector3(v.x, v.y, v.z), 2.5, {
                name = "checking"..k,
                heading = -72,
                debugPoly = false,
                minZ = v.z - 4,
                maxZ = v.z + 4,
            }, {
                options = {
                    {
                        type = "client",
                        icon = "fa fa-clipboard",
                        event = "qb-ambulancejob:checkin",
                        label = "Tedavi Ol",
                    }
                },
                distance = 3.5
            })
            Wait(1000)
        end

        -- for k, v in pairs(Config.Locations["beds"]) do
        --     exports['qb-target']:AddBoxZone("beds"..k,  v.coords, 2.5, 2.3, {
        --         name = "beds"..k,
        --         heading = -20,
        --         debugPoly = false,
        --         minZ = v.coords.z - 1,
        --         maxZ = v.coords.z + 1,
        --     }, {
        --         options = {
        --             {
        --                 type = "client",
        --                 event = "qb-ambulancejob:beds",
        --                 icon = "fas fa-bed",
        --                 label = "Layin Bed",
        --             }
        --         },
        --         distance = 1.5
        --     })
        -- end
    end)
else
    CreateThread(function()
        for k, v in pairs(Config.Locations["checking"]) do
            exports['qb-target']:AddCircleZone("checking"..k, vector3(v.x, v.y, v.z), 1.0, {
                name = "checking"..k,
                heading = -72,
                debugPoly = false,
                minZ = v.z - 2,
                maxZ = v.z + 2,
            }, {
                options = {
                    {
                        type = "client",
                        icon = "fa fa-clipboard",
                        event = "qb-ambulancejob:checkin",
                        label = "Tedavi Ol",
                    }
                },
                distance = 2.5
            })
        end
        -- local checkingPoly = {}
        -- for k, v in pairs(Config.Locations["checking"]) do
        --     checkingPoly[#checkingPoly+1] = BoxZone:Create(vector3(v.x, v.y, v.z), 3.5, 2, {
        --         heading = -72,
        --         name="checkin"..k,
        --         debugPoly = false,
        --         minZ = v.z - 2,
        --         maxZ = v.z + 2,
        --     })
        --     local checkingCombo = ComboZone:Create(checkingPoly, {name = "checkingCombo", debugPoly = false})
        --     checkingCombo:onPlayerInOut(function(isPointInside)
        --         if isPointInside then
        --             if doctorCount >= Config.MinimalDoctors then
        --                 exports['qb-core']:DrawText(Lang:t('text.call_doc'),'left')
        --                 CheckInControls("checkin")
        --             else
        --                 exports['qb-core']:DrawText(Lang:t('text.check_in'), 'left')
        --                 CheckInControls("checkin")
        --             end
        --         else
        --             listen = false
        --             exports['qb-core']:HideText()
        --         end
        --     end)
        -- end
        -- local bedPoly = {}
        -- for k, v in pairs(Config.Locations["beds"]) do
        --     bedPoly[#bedPoly+1] = BoxZone:Create(v.coords, 2.5, 2.3, {
        --         name="beds"..k,
        --         heading = -20,
        --         debugPoly = false,
        --         minZ = v.coords.z - 1,
        --         maxZ = v.coords.z + 1,
        --     })
        --     local bedCombo = ComboZone:Create(bedPoly, {name = "bedCombo", debugPoly = false})
        --     bedCombo:onPlayerInOut(function(isPointInside)
        --         if isPointInside then
        --             exports['qb-core']:DrawText(Lang:t('text.lie_bed'), 'left')
        --             CheckInControls("beds")
        --         else
        --             listen = false
        --             exports['qb-core']:HideText()
        --         end
        --     end)
        -- end
    end)
end

-- Export
exports('YatakKontrol', function()
    return isInHospitalBed
end)
