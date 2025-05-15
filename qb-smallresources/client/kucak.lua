local QBCore = exports['qb-core']:GetCoreObject()

local carry = {
	InProgress = false,
	targetSrc = -1,
	type = "",
	personCarrying = {
		animDict = "missfinale_c2mcs_1",
		anim = "fin_c2_mcs_1_camman",
		flag = 49,
	},
	personCarried = {
		animDict = "nm",
		anim = "firemans_carry",
		attachX = 0.27,
		attachY = 0.15,
		attachZ = 0.63,
		flag = 33,
	},
	personPiggybacking = {
		animDict = "mx@piggypack_a",
		anim = "mxclip_a",
		flag = 49,
	},
	personBeingPiggybacked = {
		animDict = "mx@piggypack_b",
		anim = "mxanim_b",
		attachX = 0.0200,
		attachY = -0.4399,
		attachZ = 0.4200,
		flag = 33,
	}
}

local function drawNativeNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local function GetClosestPlayer(radius)
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _,playerId in ipairs(players) do
        local targetPed = GetPlayerPed(playerId)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(targetCoords-playerCoords)
            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = playerId
                closestDistance = distance
            end
        end
    end
	if closestDistance ~= -1 and closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end

local function ensureAnimDict(animDict)
    if not HasAnimDictLoaded(animDict) then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Wait(0)
        end        
    end
    return animDict
end

RegisterCommand("kucakla",function(source, args)
	if (not exports["ZSX_UIV2"]:IsProgressBarActive()) and (not exports["s4-cuffv3"]:HandCuffed()) and (GetEntityHeightAboveGround(PlayerPedId()) <= 2.0) and ((QBCore == nil and QBCore.Functions.GetPlayerData() == nil) or (not QBCore.Functions.GetPlayerData().metadata['isdead'])) then 
		if not (IsPedInAnyVehicle(PlayerPedId(), false) and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1)) then
			if not carry.InProgress then
				local closestPlayer = GetClosestPlayer(3)
				if closestPlayer then
					QBCore.Functions.Progressbar("keremukucakla", "Kişiyi kucaklıyorsun...", 300, false, true, {
						disableMovement = false,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
						}, {}, {}, {}, function() -- Done
						local targetSrc = GetPlayerServerId(closestPlayer)
						if targetSrc ~= -1 then
							local closestPlayer2 = GetClosestPlayer(3)
							if closestPlayer2 then
								carry.InProgress = true
								carry.targetSrc = targetSrc
								TriggerServerEvent("CarryPeople:sync",targetSrc)
								ensureAnimDict(carry.personCarrying.animDict)
								carry.type = "carrying"
							else
								QBCore.Functions.Notify("Yakında sırtına alabileceğin kimse yok!", "error", 4000)
							end
						else
							QBCore.Functions.Notify("Yakında sırtına alabileceğin kimse yok!", "error", 4000)
						end
					end)
				else
					QBCore.Functions.Notify("Yakında sırtına alabileceğin kimse yok!", "error", 4000)
				end
			else
				QBCore.Functions.Progressbar("keremukucakla2", "Kişiyi bırakıyorsun...", 300, false, true, {
					disableMovement = false,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
					}, {}, {}, {}, function() -- Done
					carry.InProgress = false
					ClearPedSecondaryTask(PlayerPedId())
					DetachEntity(PlayerPedId(), true, false)
					TriggerServerEvent("CarryPeople:stop",carry.targetSrc)
					carry.targetSrc = 0
				end)
			end
		else
			QBCore.Functions.Notify("Araçta bu işlemi yapamazsın.", "error", 4000)
		end
	else
		QBCore.Functions.Notify("İşlem başarısız.", "error", 4000)
	end
end,false)

-- RegisterCommand("sırtla",function(source, args)
-- 	if (not exports["ZSX_UIV2"]:IsProgressBarActive()) and (not exports["s4-cuffv3"]:HandCuffed()) and (GetEntityHeightAboveGround(PlayerPedId()) <= 2.0) and ((QBCore == nil and QBCore.Functions.GetPlayerData() == nil) or (not QBCore.Functions.GetPlayerData().metadata['isdead'])) then 
-- 		if not (IsPedInAnyVehicle(PlayerPedId(), false) and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1)) then
-- 			if not carry.InProgress then
-- 				local closestPlayer = GetClosestPlayer(3)
-- 				if closestPlayer then
-- 					QBCore.Functions.Progressbar("keremukucakla", "Kişiyi sırtlıyorsun...", 300, false, true, {
-- 						disableMovement = false,
-- 						disableCarMovement = false,
-- 						disableMouse = false,
-- 						disableCombat = false,
-- 						}, {}, {}, {}, function() -- Done
-- 						local targetSrc = GetPlayerServerId(closestPlayer)
-- 						if targetSrc ~= -1 then
-- 							local closestPlayer2 = GetClosestPlayer(3)
-- 							if closestPlayer2 then
-- 								carry.InProgress = true
-- 								carry.targetSrc = targetSrc
-- 								TriggerServerEvent("PiggyPeople:sync",targetSrc)
-- 								ensureAnimDict(carry.personPiggybacking.animDict)
-- 								carry.type = "piggybacking"
-- 							else
-- 								QBCore.Functions.Notify("Yakında sırtına alabileceğin kimse yok!", "error", 4000)
-- 							end
-- 						else
-- 							QBCore.Functions.Notify("Yakında sırtına alabileceğin kimse yok!", "error", 4000)
-- 						end
-- 					end)
-- 				else
-- 					QBCore.Functions.Notify("Yakında sırtına alabileceğin kimse yok!", "error", 4000)
-- 				end
-- 			else
-- 				QBCore.Functions.Progressbar("keremukucakla2", "Kişiyi bırakıyorsun...", 300, false, true, {
-- 					disableMovement = false,
-- 					disableCarMovement = false,
-- 					disableMouse = false,
-- 					disableCombat = false,
-- 					}, {}, {}, {}, function() -- Done
-- 					carry.InProgress = false
-- 					ClearPedSecondaryTask(PlayerPedId())
-- 					DetachEntity(PlayerPedId(), true, false)
-- 					TriggerServerEvent("CarryPeople:stop",carry.targetSrc)
-- 					carry.targetSrc = 0
-- 				end)
-- 			end
-- 		else
-- 			QBCore.Functions.Notify("Araçta bu işlemi yapamazsın.", "error", 4000)
-- 		end
-- 	else
-- 		QBCore.Functions.Notify("İşlem başarısız.", "error", 4000)
-- 	end
-- end,false)

-- RegisterKeyMapping('sırtla', 'Kişi Sırtla', 'keyboard', 'F9')

-- -- X tuşu ile sırtlama bırakma
-- RegisterCommand('sirtlabirak', function()
--     if carry.InProgress then
--         QBCore.Functions.Progressbar("keremukucakla2", "Kişiyi bırakıyorsun...", 300, false, true, {
--             disableMovement = false,
--             disableCarMovement = false,
--             disableMouse = false,
--             disableCombat = false,
--         }, {}, {}, {}, function() -- Done
--             carry.InProgress = false
--             ClearPedSecondaryTask(PlayerPedId())
--             DetachEntity(PlayerPedId(), true, false)
--             TriggerServerEvent("CarryPeople:stop", carry.targetSrc)
--             carry.targetSrc = 0
--         end)
--     end
-- end, false)

-- RegisterKeyMapping('sirtlabirak', 'Kişiyi Bırak', 'keyboard', 'X')

RegisterNetEvent("CarryPeople:syncTarget")
AddEventHandler("CarryPeople:syncTarget", function(targetSrc)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(targetSrc))
	carry.InProgress = true
	ensureAnimDict(carry.personCarried.animDict)
	AttachEntityToEntity(PlayerPedId(), targetPed, 0, carry.personCarried.attachX, carry.personCarried.attachY, carry.personCarried.attachZ, 0.5, 0.5, 180, false, false, false, false, 2, false)
	carry.type = "beingcarried"
end)

RegisterNetEvent("PiggyPeople:syncTarget")
AddEventHandler("PiggyPeople:syncTarget", function(targetSrc)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(targetSrc))
	carry.InProgress = true
	ensureAnimDict(carry.personBeingPiggybacked.animDict)
	AttachEntityToEntity(PlayerPedId(), targetPed, 0, carry.personBeingPiggybacked.attachX, carry.personBeingPiggybacked.attachY, carry.personBeingPiggybacked.attachZ, 0.5, 0.5, 180, false, false, false, false, 2, false)
	carry.type = "beingPiggybacked"
end)

RegisterNetEvent("CarryPeople:cl_stop")
AddEventHandler("CarryPeople:cl_stop", function()
	carry.InProgress = false
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
	if not (carry.targetSrc == -1) or not (carry.targetSrc == 0) then 
		TriggerServerEvent("CarryPeople:stop",carry.targetSrc)
		carry.targetSrc = 0
	end
end)

Citizen.CreateThread(function()
	while true do
		if carry.InProgress then
			if carry.type == "beingcarried" then
				if not IsEntityPlayingAnim(PlayerPedId(), carry.personCarried.animDict, carry.personCarried.anim, 3) then
					TaskPlayAnim(PlayerPedId(), carry.personCarried.animDict, carry.personCarried.anim, 8.0, -8.0, 100000, carry.personCarried.flag, 0, false, false, false)
				end
			elseif carry.type == "carrying" then
				if not IsEntityPlayingAnim(PlayerPedId(), carry.personCarrying.animDict, carry.personCarrying.anim, 3) then
					TaskPlayAnim(PlayerPedId(), carry.personCarrying.animDict, carry.personCarrying.anim, 8.0, -8.0, 100000, carry.personCarrying.flag, 0, false, false, false)
				end
			elseif carry.type == "piggybacking" then
				if not IsEntityPlayingAnim(PlayerPedId(), carry.personPiggybacking.animDict, carry.personPiggybacking.anim, 3) then
					TaskPlayAnim(PlayerPedId(), carry.personPiggybacking.animDict, carry.personPiggybacking.anim, 8.0, -8.0, 100000, carry.personPiggybacking.flag, 0, false, false, false)
				end
			elseif carry.type == "beingPiggybacked" then
				SetCurrentPedWeapon(PlayerPedId(), "WEAPON_UNARMED")
				if not IsEntityPlayingAnim(PlayerPedId(), carry.personBeingPiggybacked.animDict, carry.personBeingPiggybacked.anim, 3) then
					TaskPlayAnim(PlayerPedId(), carry.personBeingPiggybacked.animDict, carry.personBeingPiggybacked.anim, 8.0, -8.0, 100000, carry.personBeingPiggybacked.flag, 0, false, false, false)
				end
			end
		else
			Citizen.Wait(2000)
		end
		Wait(0)
	end
end)


function isBeingCarried()
	if carry.InProgress and (carry.type == "beingcarried" or carry.type == "beingPiggybacked") then 
		return true
	else
		return false 
	end

end

exports('isBeingCarried', isBeingCarried)

AddEventHandler("baseevents:onPlayerDied", function()
    
	if carry.type == "carrying" then 
		carry.InProgress = false
		ClearPedSecondaryTask(PlayerPedId())
		DetachEntity(PlayerPedId(), true, false)
		TriggerServerEvent("CarryPeople:stop",carry.targetSrc)
		carry.targetSrc = 0
	elseif carry.type == "piggybacking" then 
		carry.InProgress = false
		ClearPedSecondaryTask(PlayerPedId())
		DetachEntity(PlayerPedId(), true, false)
		TriggerServerEvent("CarryPeople:stop",carry.targetSrc)
		carry.targetSrc = 0
	end	
end)