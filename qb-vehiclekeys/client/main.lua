local QBCore = exports['qb-core']:GetCoreObject()
local KeysList = {}

local isTakingKeys = false
local isCarjacking = false
local canCarjack = true
local AlertSend = false
local lastPickedVehicle = nil
local usingAdvanced = false
local IsHotwiring = false

CreateThread(function()
    while true do
        local sleep = 1000
        if LocalPlayer.state.isLoggedIn then
            sleep = 100
            local ped = PlayerPedId()
            local entering = GetVehiclePedIsTryingToEnter(ped)
            local carIsImmune = false
            if entering ~= 0 and not isBlacklistedVehicle(entering) then
                sleep = 2000
                local plate = QBCore.Functions.GetPlate(entering)
                local driver = GetPedInVehicleSeat(entering, -1)
                for _, veh in ipairs(Config.ImmuneVehicles) do
                    if GetEntityModel(entering) == joaat(veh) then
                        carIsImmune = true
                    end
                end
                if driver ~= 0 and not IsPedAPlayer(driver) and not HasKeys(plate) and not carIsImmune then
                    if IsEntityDead(driver) then
                        if not isTakingKeys then
                            isTakingKeys = true
                            TriggerServerEvent('qb-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(entering), 1)
                            QBCore.Functions.Progressbar("steal_keys", 'Anahtar alınıyor', 2500, false, false, {
                                disableMovement = false,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true
                            }, {}, {}, {}, function()
                                TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
                                isTakingKeys = false
                            end, function()
                                isTakingKeys = false
                            end)
                        end
                    elseif Config.LockNPCDrivingCars then
                        TriggerServerEvent('qb-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(entering), 2)
                    else
                        TriggerServerEvent('qb-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(entering), 1)
                        TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
                        local pedsInVehicle = GetPedsInVehicle(entering)
                        for _, pedInVehicle in pairs(pedsInVehicle) do
                            if pedInVehicle ~= GetPedInVehicleSeat(entering, -1) then
                                MakePedFlee(pedInVehicle)
                            end
                        end
                    end
                elseif driver == 0 and entering ~= lastPickedVehicle and not HasKeys(plate) and not isTakingKeys then
                    if Config.LockNPCParkedCars then
                    else
                    end
                end
            end
            if IsPedInAnyVehicle(ped, false) and not IsHotwiring then
                sleep = 1000
                local vehicle = GetVehiclePedIsIn(ped)
                local plate = QBCore.Functions.GetPlate(vehicle)
                local exemptVehicles = {
                    [`burrito`] = true, -- Araç model adı
                    [`lambokart`] = true, -- Araç model adı
                    [`Shifter_kart`] = true, -- Araç model adı
                    [`kart`] = true, -- Araç model adı
                }
                
                if exemptVehicles[GetEntityModel(vehicle)] then
                    -- Bu araçlarda düz kontak gerekmiyor
                    return
                else
                    -- Diğer araçlarda düz kontak işlemi
                end
                if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() and not HasKeys(plate) and not isBlacklistedVehicle(vehicle) and not AreKeysJobShared(vehicle) then
                    sleep = 0
                    local vehiclePos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 1.0, 0.5)
                    DrawText3D(vehiclePos.x, vehiclePos.y, vehiclePos.z, 'H - Düz Kontak')
                    SetVehicleEngineOn(vehicle, false, false, true)
                    if IsControlJustPressed(0, 74) then
                        Hotwire(alertId, alertName, street, arac, plate, renk, sex, x, y, date)
                        TriggerEvent("tgiann-policeAlert:alert", "Çalıntı Araç", alertId, alertName, street, arac, plate, renk, sex, x, y, date)
                    end
                end
            end
            if Config.CarJackEnable and canCarjack then
                local playerid = PlayerId()
                local aiming, target = GetEntityPlayerIsFreeAimingAt(playerid)
                if aiming and (target ~= nil and target ~= 0) then
                    if DoesEntityExist(target) and IsPedInAnyVehicle(target, false) and not IsEntityDead(target) and not IsPedAPlayer(target) then
                        local targetveh = GetVehiclePedIsIn(target)
                        for _, veh in ipairs(Config.ImmuneVehicles) do
                            if GetEntityModel(targetveh) == joaat(veh) then
                                carIsImmune = true
                            end
                        end
                        if GetPedInVehicleSeat(targetveh, -1) == target and not IsBlacklistedWeapon() then
                            local pos = GetEntityCoords(ped, true)
                            local targetpos = GetEntityCoords(target, true)
                            if #(pos - targetpos) < 5.0 and not carIsImmune then
                                CarjackVehicle(target)
                            end
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

function isBlacklistedVehicle(vehicle)
    local isBlacklisted = false
    for _,v in ipairs(Config.NoLockVehicles) do
        if GetHashKey(v) == GetEntityModel(vehicle) then
            isBlacklisted = true
            break;
        end
    end
    if Entity(vehicle).state.ignoreLocks or GetVehicleClass(vehicle) == 13 then isBlacklisted = true end
    return isBlacklisted
end

RegisterKeyMapping('togglelocks', 'Aracı Kilitle / Aç', 'keyboard', 'L')
RegisterCommand('togglelocks', function()
    ToggleVehicleLocks(GetVehicle())
end)

RegisterKeyMapping('engine', 'Motoru Kapat / Aç', 'MOUSE_BUTTON', 'MOUSE_MIDDLE')
RegisterCommand('engine', function()
    TriggerEvent('qb-vehiclekeys:client:ToggleEngine')
end)

AddEventHandler('onResourceStart', function(resourceName)
	if resourceName == GetCurrentResourceName() and QBCore.Functions.GetPlayerData() ~= {} then
		GetKeys()
	end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    GetKeys()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    KeysList = {}
end)

RegisterNetEvent('qb-vehiclekeys:client:AddKeys', function(plate)
    KeysList[plate] = true
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local vehicle = GetVehiclePedIsIn(ped)
        local vehicleplate = QBCore.Functions.GetPlate(vehicle)
        if plate == vehicleplate then
            SetVehicleEngineOn(vehicle, false, false, false)
        end
    end
end)

RegisterNetEvent('qb-vehiclekeys:client:RemoveKeys', function(plate)
    KeysList[plate] = nil
end)

-- RegisterCommand('qmodequery', function()
-- TriggerEvent('anahtaral')
-- end)

RegisterNetEvent('anahtaral')
AddEventHandler('anahtaral', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsUsing(ped)
    
    if veh == 0 then
        print('Bir araç içinde değilsiniz!')
        return
    end
    
    local plate = QBCore.Functions.GetPlate(veh)
    TriggerServerEvent('qb-vehiclekeys:client:GiveKeys', plate)
    TriggerEvent('vehiclekeys:client:SetOwner', plate)
    
    print('Aracın anahtarları alındı!')
end)


RegisterNetEvent('qb-vehiclekeys:client:ToggleEngine', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle == 0 then
        return
    end

    if GetPedInVehicleSeat(vehicle, -1) ~= ped then
        QBCore.Functions.Notify("Sadece sürücü koltuğunda aracın motorunu kontrol edebilirsin.", "error")
        return
    end

    local EngineOn = GetIsVehicleEngineRunning(vehicle)
    if HasKeys(QBCore.Functions.GetPlate(vehicle)) then
        if EngineOn then
            SetVehicleEngineOn(vehicle, false, false, true)
            QBCore.Functions.Notify('Motor durduruldu.', 'info')
        else
            SetVehicleEngineOn(vehicle, true, false, true)
            QBCore.Functions.Notify('Motor çalıştırıldı.', 'info')
        end
    else
        QBCore.Functions.Notify("Araç anahtarın yok.", "error")
    end
end)


RegisterNetEvent('qb-vehiclekeys:client:GiveKeys', function(id)
    local targetVehicle = GetVehicle()
    if targetVehicle then
        local targetPlate = QBCore.Functions.GetPlate(targetVehicle)
        if HasKeys(targetPlate) then
            if id and type(id) == "number" then
                GiveKeys(id, targetPlate)
            else
                if IsPedSittingInVehicle(PlayerPedId(), targetVehicle) then
                    local otherOccupants = GetOtherPlayersInVehicle(targetVehicle)
                    for p=1,#otherOccupants do
                        TriggerServerEvent('qb-vehiclekeys:server:GiveVehicleKeys', GetPlayerServerId(NetworkGetPlayerIndexFromPed(otherOccupants[p])), targetPlate)
                    end
                else
                    GiveKeys(GetPlayerServerId(QBCore.Functions.GetClosestPlayer()), targetPlate)
                end
            end
        else
            QBCore.Functions.Notify('Bu aracın anahtarları sizde yok!', 'error')
        end
    else
        QBCore.Functions.Notify('Yakınlarda araç bulunamadı!', 'error')
    end
end)

RegisterNetEvent('lockpicks:UseLockpick', function(isAdvanced)
    LockpickDoor(isAdvanced)
end)

RegisterNetEvent('vehiclekeys:client:SetOwner', function(plate)
    TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
end)

function GiveKeys(id, plate)
    local distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(id))))
    if distance < 3 and distance > 0.0 then
        TriggerServerEvent('qb-vehiclekeys:server:GiveVehicleKeys', id, plate)
    else
        QBCore.Functions.Notify('Yakınlarda anahtar verecek birisi bulunamadı!', 'error')
    end
end

function GetKeys()
    QBCore.Functions.TriggerCallback('qb-vehiclekeys:server:GetVehicleKeys', function(keysList)
        KeysList = keysList
    end)
end

function HasKeys(plate)
    return KeysList[plate]
end
exports('HasKeys', HasKeys)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(3)
    end
end

function GetVehicleInDirection(coordFromOffset, coordToOffset)
    local ped = PlayerPedId()
    local coordFrom = GetOffsetFromEntityInWorldCoords(ped, coordFromOffset.x, coordFromOffset.y, coordFromOffset.z)
    local coordTo = GetOffsetFromEntityInWorldCoords(ped, coordToOffset.x, coordToOffset.y, coordToOffset.z)
    local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, PlayerPedId(), 0)
    local _, _, _, _, vehicle = GetShapeTestResult(rayHandle)
    return vehicle
end

function GetVehicle()
    local vehicle = GetVehiclePedIsIn(PlayerPedId())
    -- Adjust the raycast offsets to cover a larger area in front and below the player
    local RaycastOffsetTable = {
        {['fromOffset'] = vector3(0.0, 0.0, 0.0), ['toOffset'] = vector3(0.0, 50.0, -10.0)}, -- Increased from 20.0 to 50.0
        {['fromOffset'] = vector3(0.0, 0.0, 0.7), ['toOffset'] = vector3(0.0, 30.0, -10.0)}, -- Increased from 10.0 to 30.0
        {['fromOffset'] = vector3(0.0, 0.0, 0.7), ['toOffset'] = vector3(0.0, 30.0, -30.0)}  -- Increased from 20.0 to 30.0
    }

    local count = 0
    while vehicle == 0 and count < #RaycastOffsetTable do
        count = count + 1
        vehicle = GetVehicleInDirection(RaycastOffsetTable[count]['fromOffset'], RaycastOffsetTable[count]['toOffset'])
    end
    if not IsEntityAVehicle(vehicle) then vehicle = nil end
    return vehicle
end


function AreKeysJobShared(veh)
    local vehName = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
    local vehPlate = GetVehicleNumberPlateText(veh)
    local jobName = QBCore.Functions.GetPlayerData().job.name
    local onDuty = QBCore.Functions.GetPlayerData().job.onduty
    for job, v in pairs(Config.SharedKeys) do
        if job == jobName then
	    if Config.SharedKeys[job].requireOnduty and not onDuty then return false end
	    for _, vehicle in pairs(v.vehicles) do
            if string.upper(vehicle) == string.upper(vehName) then
		    if not HasKeys(vehPlate) then
		        TriggerServerEvent("qb-vehiclekeys:server:AcquireVehicleKeys", vehPlate)
		    end
		    return true
	        end
            end
        end
    end
    return false
end

function ToggleVehicleLocks(veh)
    if veh then
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local vehicleCoords = GetEntityCoords(veh)
        local distance = #(playerCoords - vehicleCoords)

        -- Set the maximum distance you want to allow vehicle locking from
        local maxDistance = 5 -- You can adjust this value (e.g., 10.0 units)

        if distance <= maxDistance then
            if not isBlacklistedVehicle(veh) then
                if HasKeys(QBCore.Functions.GetPlate(veh)) or AreKeysJobShared(veh) then
                    local vehLockStatus = GetVehicleDoorLockStatus(veh)
                    loadAnimDict("anim@mp_player_intmenu@key_fob@")
                    TaskPlayAnim(playerPed, 'anim@mp_player_intmenu@key_fob@', 'fob_click', 3.0, 3.0, -1, 49, 0, false, false, false)
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "lock", 0.3)
                    NetworkRequestControlOfEntity(veh)

                    if vehLockStatus == 1 then
                        TriggerServerEvent('qb-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(veh), 2)
                        QBCore.Functions.Notify('Araç kilitlendi.', 'info')
                    else
                        TriggerServerEvent('qb-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(veh), 1)
                        QBCore.Functions.Notify('Araç kilidi açıldı.', 'info')
                    end

                    SetVehicleLights(veh, 2)
                    Wait(250)
                    SetVehicleLights(veh, 1)
                    Wait(200)
                    SetVehicleLights(veh, 0)
                    Wait(300)
                    ClearPedTasks(playerPed)
                else
                    QBCore.Functions.Notify('Bu aracın anahtarları üzerinizde bulunamadı!', 'error')
                end
            else
                TriggerServerEvent('qb-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(veh), 1)
            end
        else
            QBCore.Functions.Notify('Araç çok uzakta!', 'error') -- Notify the player if they are too far
        end
    end
end


function GetOtherPlayersInVehicle(vehicle)
    local otherPeds = {}
    for seat=-1,GetVehicleModelNumberOfSeats(GetEntityModel(vehicle))-2 do
        local pedInSeat = GetPedInVehicleSeat(vehicle, seat)
        if IsPedAPlayer(pedInSeat) and pedInSeat ~= PlayerPedId() then
            otherPeds[#otherPeds+1] = pedInSeat
        end
    end
    return otherPeds
end

function GetPedsInVehicle(vehicle)
    local otherPeds = {}
    for seat=-1,GetVehicleModelNumberOfSeats(GetEntityModel(vehicle))-2 do
        local pedInSeat = GetPedInVehicleSeat(vehicle, seat)
        if not IsPedAPlayer(pedInSeat) and pedInSeat ~= 0 then
            otherPeds[#otherPeds+1] = pedInSeat
        end
    end
    return otherPeds
end

function IsBlacklistedWeapon()
    local weapon = GetSelectedPedWeapon(PlayerPedId())
    if weapon ~= nil then
        for _, v in pairs(Config.NoCarjackWeapons) do
            if weapon == GetHashKey(v) then
                return true
            end
        end
    end
    return false
end

function LockpickDoor(isAdvanced)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    if vehicle == nil or vehicle == 0 then return end
    if HasKeys(QBCore.Functions.GetPlate(vehicle)) then return end
    if #(pos - GetEntityCoords(vehicle)) > 2.5 then return end
    if GetVehicleDoorLockStatus(vehicle) <= 0 then return end
    usingAdvanced = isAdvanced
    local success = exports['qb-lock']:StartLockPickCircle(4, 7)
    if success then
        LockpickFinishCallback(true)
    else
        LockpickFinishCallback(false)
    end
end

function LockpickFinishCallback(success)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local chance = math.random()
    if success then
        lastPickedVehicle = vehicle
        if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
            TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', QBCore.Functions.GetPlate(vehicle))
        else
            QBCore.Functions.Notify('Araç kilidi başarıyla açıldı.', 'success')
            TriggerServerEvent('qb-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(vehicle), 1)
        end
    else
        AttemptPoliceAlert("Düz Kontak")
    end
    if usingAdvanced then
        if chance <= Config.RemoveLockpickAdvanced then
            TriggerServerEvent('qb-vehiclekeys:server:breakLockpick', 'advancedlockpick')
        end
    else
        if chance <= Config.RemoveLockpickNormal then
            TriggerServerEvent('qb-vehiclekeys:server:breakLockpick', 'lockpick')
        end
    end
end
 
function Hotwire(vehicle, plate)
    local hotwireTime = math.random(Config.minHotwireTime, Config.maxHotwireTime)
    local ped = PlayerPedId()
    SetVehicleAlarm(vehicle, true)
    SetVehicleAlarmTimeLeft(vehicle, hotwireTime)
    local success = exports['qb-lock']:StartLockPickCircle(4, 7)
    IsHotwiring = true
    if success then
        TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
        IsHotwiring = false
    else
        QBCore.Functions.Notify('Anahtarları bulamadın!', 'error')
        IsHotwiring = false
    end
end

function CarjackVehicle(target)
    if not Config.CarJackEnable then return end
    isCarjacking = true
    canCarjack = false
    loadAnimDict('mp_am_hold_up')
    local vehicle = GetVehiclePedIsUsing(target)
    local occupants = GetPedsInVehicle(vehicle)
    for p=1,#occupants do
        local ped = occupants[p]
        CreateThread(function()
            TaskPlayAnim(ped, "mp_am_hold_up", "holdup_victim_20s", 8.0, -8.0, -1, 49, 0, false, false, false)
            PlayPain(ped, 6, 0)
        end)
        Wait(math.random(200,500))
    end
    CreateThread(function()
        while isCarjacking do
            local distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(target))
            if IsPedDeadOrDying(target) or distance > 7.5 then
                TriggerEvent("progressbar:client:cancel")
            end
            Wait(100)
        end
    end)
    QBCore.Functions.Progressbar("rob_keys", 'Araç anahtarları alınıyor', Config.CarjackingTime, false, true, {}, {}, {}, {}, function()
        local hasWeapon, weaponHash = GetCurrentPedWeapon(PlayerPedId(), true)
        if hasWeapon and isCarjacking then
            local carjackChance
            if Config.CarjackChance[tostring(GetWeapontypeGroup(weaponHash))] then
                carjackChance = Config.CarjackChance[tostring(GetWeapontypeGroup(weaponHash))]
            else
                carjackChance = 0.5
            end
            if math.random() <= carjackChance then
                local plate = QBCore.Functions.GetPlate(vehicle)
                    for p=1,#occupants do
                        local ped = occupants[p]
                        CreateThread(function()
                        TaskLeaveVehicle(ped, vehicle, 0)
                        PlayPain(ped, 6, 0)
                        Wait(1250)
                        ClearPedTasksImmediately(ped)
                        PlayPain(ped, math.random(7,8), 0)
                        MakePedFlee(ped)
                    end)
                end
                TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
            else
                QBCore.Functions.Notify('Düz kontak işlemi başarısız oldu!', 'error')
                MakePedFlee(target)
            end
            isCarjacking = false
            Wait(2000)
            AttemptPoliceAlert("Araç Hırsızlığı")
            Wait(Config.DelayBetweenCarjackings)
            canCarjack = true
        end
    end, function()
        MakePedFlee(target)
        isCarjacking = false
        Wait(Config.DelayBetweenCarjackings)
        canCarjack = true
    end)
end

function AttemptPoliceAlert(car)
    if not AlertSend then
        local chance = Config.PoliceAlertChance
        if GetClockHours() >= 1 and GetClockHours() <= 6 then
            chance = Config.PoliceNightAlertChance
        end
        local playerPed = PlayerPedId()
        local playerVehicle = GetVehiclePedIsIn(playerPed, false)
        if GetVehicleClass(playerVehicle) == 18 then

            TriggerEvent("gen_outlawalert:arachirsizligi", playerVehicle)
        end
        if math.random() <= chance then
            TriggerEvent("gen_outlawalert:arachirsizligi", playerVehicle)
        end
        AlertSend = true
        SetTimeout(Config.AlertCooldown, function()
            AlertSend = false
        end)
    end
end
function MakePedFlee(ped)
    SetPedFleeAttributes(ped, 0, 0)
    TaskReactAndFleePed(ped, PlayerPedId())
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 245)
    SetTextOutline(true)
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
end