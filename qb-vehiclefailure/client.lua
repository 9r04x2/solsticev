QBCore = nil

local pedInSameVehicleLast=false
local vehicle
local lastVehicle
local vehicleClass
local fCollisionDamageMult = 0.0
local fDeformationDamageMult = 0.0
local fEngineDamageMult = 0.0
local fBrakeForce = 1.0
local isBrakingForward = false
local isBrakingReverse = false

local healthEngineLast = 1000.0
local healthEngineCurrent = 1000.0
local healthEngineNew = 1000.0
local healthEngineDelta = 0.0
local healthEngineDeltaScaled = 0.0

local healthBodyLast = 1000.0
local healthBodyCurrent = 1000.0
local healthBodyNew = 1000.0
local healthBodyDelta = 0.0
local healthBodyDeltaScaled = 0.0

local healthPetrolTankLast = 1000.0
local healthPetrolTankCurrent = 1000.0
local healthPetrolTankNew = 1000.0
local healthPetrolTankDelta = 0.0
local healthPetrolTankDeltaScaled = 0.0
local tireBurstLuckyNumber
local showPro = false

math.randomseed(GetGameTimer());

local tireBurstMaxNumber = cfg.randomTireBurstInterval * 1200; 												-- the tire burst lottery runs roughly 1200 times per minute
if cfg.randomTireBurstInterval ~= 0 then tireBurstLuckyNumber = math.random(tireBurstMaxNumber) end			-- If we hit this number again randomly, a tire will burst.

local fixMessagePos = math.random(repairCfg.fixMessageCount)
local noFixMessagePos = math.random(repairCfg.noFixMessageCount)

local QBCore = exports['qb-core']:GetCoreObject()

-- Display blips on map
Citizen.CreateThread(function()
	if (cfg.displayBlips == true) then
		for _, item in pairs(repairCfg.mechanics) do
			item.blip = AddBlipForCoord(item.x, item.y, item.z)
			SetBlipSprite(item.blip, item.id)
			SetBlipScale(item.blip, 0.8)
			SetBlipAsShortRange(item.blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(item.name)
			EndTextCommandSetBlipName(item.blip)
		end
	end
end)

RegisterNetEvent('qb-vehiclefailure:client:RepairVehicle')
AddEventHandler('qb-vehiclefailure:client:RepairVehicle', function()
	local vehicle = QBCore.Functions.GetClosestVehicle()
	if vehicle ~= nil and vehicle ~= 0 then
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		local vehpos = GetEntityCoords(vehicle)
		if #(pos - vehpos) < 5.0 and not IsPedInAnyVehicle(ped) then
			local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
			if (IsBackEngine(GetEntityModel(vehicle))) then
				drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
			end
			if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
				RepairVehicle(vehicle)
			else
				ShowEnginePos = true
			end
		end
	end
end)

function CleanVehicle(vehicle)
	local ped = PlayerPedId()
	local pos = GetEntityCoords(ped)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_MAID_CLEAN", 0, true)
	QBCore.Functions.Progressbar("repair_vehicle", "Aracı temizliyorsun...", math.random(10000, 20000), false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		QBCore.Functions.Notify("Araç temizlendi!")
		SetVehicleDirtLevel(vehicle, 0.1)
        SetVehicleUndriveable(vehicle, false)
		WashDecalsFromVehicle(vehicle, 1.0)
		TriggerServerEvent('qb-vehiclefailure:server:removewashingkit', vehicle)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["cleaningkit"], "remove")
		ClearAllPedProps(ped)
		ClearPedTasks(ped)
	end, function() -- Cancel
		QBCore.Functions.Notify("Beceremedin!", "error")
		ClearAllPedProps(ped)
		ClearPedTasks(ped)
	end)
end

RegisterNetEvent('qb-vehiclefailure:client:SyncWash')
AddEventHandler('qb-vehiclefailure:client:SyncWash', function(veh)
	SetVehicleDirtLevel(veh, 0.1)
	SetVehicleUndriveable(veh, false)
	WashDecalsFromVehicle(veh, 1.0)
end)

RegisterNetEvent('qb-vehiclefailure:client:CleanVehicle')
AddEventHandler('qb-vehiclefailure:client:CleanVehicle', function()
	local vehicle = QBCore.Functions.GetClosestVehicle()
	if vehicle ~= nil and vehicle ~= 0 then
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		local vehpos = GetEntityCoords(vehicle)
		if #(pos - vehpos) < 3.0 and not IsPedInAnyVehicle(ped) then
			CleanVehicle(vehicle)	
		end
	end
end)

RegisterNetEvent('qb-vehiclefailure:client:RepairVehicleFull')
AddEventHandler('qb-vehiclefailure:client:RepairVehicleFull', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    if vehicle ~= nil and vehicle ~= 0 then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local vehpos = GetEntityCoords(vehicle)
        if #(pos - vehpos) < 5.0 and not IsPedInAnyVehicle(ped) then
            RepairVehicleFull(vehicle)
        else
            QBCore.Functions.Notify("Araç çok uzak!", "error")
        end
    end
end)

function RepairVehicleFull(vehicle)
    QBCore.Functions.Progressbar("repair_vehicle", "Araç tamir ediliyor..", math.random(10000, 15000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_player", 1.0)
        
        -- Araç motoru, gövdesi, lastikleri ve diğer parçaları tamir et
        SetVehicleFixed(vehicle) -- Aracın tüm parçalarını tamir eder
        SetVehicleDirtLevel(vehicle, 0) -- Aracın kir seviyesini sıfırlar
        SetVehicleUndriveable(vehicle, false) -- Aracın çalışamaz durumda olup olmadığını ayarlar
        WashDecalsFromVehicle(vehicle, 1.0) -- Araç üzerindeki lekeleri temizler
        SetVehicleEngineOn(vehicle, true, false) -- Motoru açar

        -- Aracın sağlık değerlerini ayarla
        SetVehicleEngineHealth(vehicle, 1000.0) -- Motor sağlığı
        SetVehicleBodyHealth(vehicle, 1000.0) -- Gövde sağlığı
        SetVehiclePetrolTankHealth(vehicle, 1000.0) -- Depo sağlığı

        QBCore.Functions.Notify("Araç başarıyla tamir edildi.", "success")
        TriggerServerEvent('qb-vehiclefailure:removeItem', "advancedrepairkit")
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_player", 1.0)
        QBCore.Functions.Notify("Tamir işlemi iptal edildi!", "error")
    end)
end

function RepairVehicle(vehicle)
	if (IsBackEngine(GetEntityModel(vehicle))) then
        SetVehicleDoorOpen(vehicle, 5, false, false)
    else
        SetVehicleDoorOpen(vehicle, 4, false, false)
    end
	QBCore.Functions.Progressbar("repair_vehicle", "Aracı tamir ediyorsun..", math.random(10000, 20000), false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = "mini@repair",
		anim = "fixing_a_player",
		flags = 16,
	}, {}, {}, function() -- Done
		StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_player", 1.0)
		QBCore.Functions.Notify("Araç tamir edildi!")
		SetVehicleEngineHealth(vehicle, 500.0)
		SetVehicleTyreFixed(vehicle, 0)
		SetVehicleTyreFixed(vehicle, 1)
		SetVehicleTyreFixed(vehicle, 2)
		SetVehicleTyreFixed(vehicle, 3)
		SetVehicleTyreFixed(vehicle, 4)
		if (IsBackEngine(GetEntityModel(vehicle))) then
			SetVehicleDoorShut(vehicle, 5, false)
		else
			SetVehicleDoorShut(vehicle, 4, false)
		end
		TriggerServerEvent('qb-qb-vehiclefailure:removeItem', "repairkit")
	end, function() -- Cancel
		StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_player", 1.0)
		QBCore.Functions.Notify("Beceremedin!", "error")
		if (IsBackEngine(GetEntityModel(vehicle))) then
			SetVehicleDoorShut(vehicle, 5, false)
		else
			SetVehicleDoorShut(vehicle, 4, false)
		end
	end)
end

function IsBackEngine(vehModel)
    for _, model in pairs(BackEngineVehicles) do
        if GetHashKey(model) == vehModel then
            return true
        end
    end
    return false
end

local function notification(msg)
	QBCore.Functions.Notify(msg)
end

local function isPedDrivingAVehicle()
	local ped = PlayerPedId()
	vehicle = GetVehiclePedIsIn(ped, false)
	if IsPedInAnyVehicle(ped, false) then
		-- Check if ped is in driver seat
		if GetPedInVehicleSeat(vehicle, -1) == ped then
			local class = GetVehicleClass(vehicle)
			-- We don't want planes, helicopters, bicycles and trains
			if class ~= 21 and class ~= 13 then
				return true
			end
		end
	end
	return false
end

local function IsNearMechanic()
	local ped = PlayerPedId()
	local pedLocation = GetEntityCoords(ped, 0)
	for _, item in pairs(repairCfg.mechanics) do
		local distance = #(vector3(item.x, item.y, item.z) - pedLocation)
		if distance <= item.r then
			return true
		end
	end
end

local function fscale(inputValue, originalMin, originalMax, newBegin, newEnd, curve)
	local OriginalRange = 0.0
	local NewRange = 0.0
	local zeroRefCurVal = 0.0
	local normalizedCurVal = 0.0
	local rangedValue = 0.0
	local invFlag = 0

	if (curve > 10.0) then curve = 10.0 end
	if (curve < -10.0) then curve = -10.0 end

	curve = (curve * -.1)
	curve = 10.0 ^ curve

	if (inputValue < originalMin) then
	  inputValue = originalMin
	end
	if inputValue > originalMax then
	  inputValue = originalMax
	end

	OriginalRange = originalMax - originalMin

	if (newEnd > newBegin) then
		NewRange = newEnd - newBegin
	else
	  NewRange = newBegin - newEnd
	  invFlag = 1
	end

	zeroRefCurVal = inputValue - originalMin
	normalizedCurVal  =  zeroRefCurVal / OriginalRange

	if (originalMin > originalMax ) then
	  return 0
	end

	if (invFlag == 0) then
		rangedValue =  ((normalizedCurVal ^ curve) * NewRange) + newBegin
	else
		rangedValue =  newBegin - ((normalizedCurVal ^ curve) * NewRange)
	end

	return rangedValue
end

local function tireBurstLottery() -- Teker patlaması kapalı
	local tireBurstNumber = math.random(tireBurstMaxNumber)
	if tireBurstNumber == tireBurstLuckyNumber then
		-- We won the lottery, lets burst a tire.
		if GetVehicleTyresCanBurst(vehicle) == false then return end
		local numWheels = GetVehicleNumberOfWheels(vehicle)
		local affectedTire
		if numWheels == 2 then
			affectedTire = (math.random(2)-1)*0		-- wheel 0 or 4
		elseif numWheels == 4 then
			affectedTire = (math.random(4)-1)
			if affectedTire > 1 then affectedTire = affectedTire + 0 end	-- 0, 1, 4, 5
		elseif numWheels == 6 then
			affectedTire = (math.random(6)-1)
		else
			affectedTire = 0
		end
		SetVehicleTyreBurst(vehicle, affectedTire, false, 1000.0)
		tireBurstLuckyNumber = math.random(tireBurstMaxNumber)			-- Select a new number to hit, just in case some numbers occur more often than others
	end
end

--[[
local function tireBurstLottery()
	local tireBurstNumber = math.random(tireBurstMaxNumber)
	if tireBurstNumber == tireBurstLuckyNumber then
		-- We won the lottery, lets burst a tire.
		if GetVehicleTyresCanBurst(vehicle) == false then return end
		local numWheels = GetVehicleNumberOfWheels(vehicle)
		local affectedTire
		if numWheels == 2 then
			affectedTire = (math.random(2)-1)*4		-- wheel 0 or 4
		elseif numWheels == 4 then
			affectedTire = (math.random(4)-1)
			if affectedTire > 1 then affectedTire = affectedTire + 2 end	-- 0, 1, 4, 5
		elseif numWheels == 6 then
			affectedTire = (math.random(6)-1)
		else
			affectedTire = 0
		end
		SetVehicleTyreBurst(vehicle, affectedTire, false, 1000.0)
		tireBurstLuckyNumber = math.random(tireBurstMaxNumber)			-- Select a new number to hit, just in case some numbers occur more often than others
	end
end
--]]



RegisterNetEvent('iens:repair')
AddEventHandler('iens:repair', function()
	if isPedDrivingAVehicle() then
		local ped = PlayerPedId()
		vehicle = GetVehiclePedIsIn(ped, false)
		if IsNearMechanic() then
			return
		end
		if GetVehicleEngineHealth(vehicle) < cfg.cascadingFailureThreshold + 5 then
			if GetVehicleOilLevel(vehicle) > 0 then
				SetVehicleUndriveable(vehicle,false)
				SetVehicleEngineHealth(vehicle, cfg.cascadingFailureThreshold + 5)
				SetVehiclePetrolTankHealth(vehicle, 750.0)
				healthEngineLast=cfg.cascadingFailureThreshold +5
				healthPetrolTankLast=750.0
					SetVehicleEngineOn(vehicle, true, false )
				SetVehicleOilLevel(vehicle,(GetVehicleOilLevel(vehicle)/3)-0.5)
				notification(repairCfg.fixMessages[fixMessagePos] .. ", ve şimdi garaja git!")
				fixMessagePos = fixMessagePos + 1
				if fixMessagePos > repairCfg.fixMessageCount then fixMessagePos = 1 end
			else
				notification("Aracın çok hasarlı!")
			end
		else
			notification(repairCfg.noFixMessages[noFixMessagePos] )
			noFixMessagePos = noFixMessagePos + 1
			if noFixMessagePos > repairCfg.noFixMessageCount then noFixMessagePos = 1 end
		end
	else
		notification("Tamir etmek için bir araçta olmalısınız!")
	end
end)


-- Sellektör işlemi için tuş ataması (J tuşu için)
RegisterCommand('selector', function()
    toggleHighBeams()
end, false)

-- KeyMapping kaydı (J tuşuna basarak çalıştır)
RegisterKeyMapping('selector', 'Selektör Yap', 'keyboard', 'j')

-- Sellektör fonksiyonu (10 kez farları hızlıca aç/kapat)
function toggleHighBeams()
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        -- Selektör işlemi: Farları 10 kez hızlıca aç/kapat
        for i = 1, 10 do
            -- Farları aç
            SetVehicleFullbeam(vehicle, true)
            Wait(100) -- 100ms bekle
            -- Farları kapat
            SetVehicleFullbeam(vehicle, false)
            Wait(100) -- 100ms bekle
        end
    else
        print("Araçta değilsiniz!")
    end
end


RegisterNetEvent('iens:repaira')
AddEventHandler('iens:repaira', function()
	if isPedDrivingAVehicle() then
		local ped = PlayerPedId()
		vehicle = GetVehiclePedIsIn(ped, false)
		SetVehicleDirtLevel(vehicle)
		SetVehicleUndriveable(vehicle, false)
		WashDecalsFromVehicle(vehicle, 1.0)
		notification("Araç tamir edildi!")
		SetVehicleFixed(vehicle)
		healthBodyLast=1000.0
		healthEngineLast=1000.0
		healthPetrolTankLast=1000.0
		SetVehicleEngineOn(vehicle, true, false )
		return
	else
		notification("Tamir etmek için bir araçta olmalısınız!")
	end
end)

RegisterNetEvent('iens:besked')
AddEventHandler('iens:besked', function()

notification("~r~There is roadside assistance available call that via your phone!")

end)



function procent(time)
    showPro = true
    TimeLeft = 0
    repeat
        TimeLeft = TimeLeft + 1
        Citizen.Wait(time)
    until(TimeLeft == 100)
    showPro = false
end

