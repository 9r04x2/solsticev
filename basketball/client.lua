local MachineName, BallName = "pottiko", "prop_bskball_01"
local MachineProps = {}
local basketball = nil
local BasketBallThrow = false
local SelectMachine = nil
local ScoreData = {
    throw = 0,
    remaining = 0,
    score = 0,
}

CreateThread(function()
	while true do
		local sleep = 500
		local playercoord = GetEntityCoords(PlayerPedId())
		for k, v in ipairs(Config.Machines) do
			local offsetX = math.cos(math.rad(v.w + 90)) * 1.2
			local offsetY = math.sin(math.rad(v.w + 90)) * 1.2
			local markerX = v.x + offsetX
			local markerY = v.y + offsetY
			local markerZ = v.z

			local dst = #(playercoord - vector3(markerX, markerY, markerZ))
			if dst < 5 then
				if Config.Marker then
					DrawMarker(25, markerX, markerY, markerZ - 1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 200, 0, 0, 0, 1)
				end
				sleep = 1
				if dst < 1 then
					ScreenText(true, Config.Langs.Open)
					if IsControlJustPressed(0, 38) and dst < 3 then
                        local fetch = lib.callback.await('BakiTelli_basketball:MachineCheck', false, k)
                        if fetch then
                            SelectMachine = k
                            SendNUIMessage({
                                action = "openmenu",
                                price = Config.BallPrice,
                                speed = Config.BallSpeed
                            })
                            SetNuiFocus(true, true)
                            GetTopBasketball()
                        else 
                            notify('machine_busy')
                        end
					end
				else
					ScreenText(false)
				end
			end
		end
		Wait(sleep)
	end
end)

function DeleteAllProps()
	for k, v in ipairs(MachineProps) do
		DeleteEntity(v)
	end
	MachineProps = {}
end

function AllPropsSpawn() 
	for k, v in ipairs(Config.Machines) do
		Citizen.Wait(500)
		SpawnProp(k, MachineName, v)
	end
end

function SpawnProp(id, prop, coord)
	local model = GetHashKey(prop)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end
    local machine = CreateObject(model, coord.x, coord.y, coord.z - 1, false, true, true)
	SetEntityHeading(machine, (coord.w + 180) % 360)
    FreezeEntityPosition(machine, true)
	MachineProps[id] = machine
end

AddEventHandler('onClientResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    Wait(1000) 
    AllPropsSpawn()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    DeleteEntity(basketball)
    DeleteAllProps()
end)

RegisterNUICallback("close", function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback("startgame", function(data)
    selectball = tonumber(data.game)
    local price = Config.BallPrice * selectball
    local fetch = lib.callback.await('BakiTelli_basketball:PriceCheck', false, SelectMachine, price)
    if fetch then
        ScoreData.remaining = selectball
        SetNuiFocus(false, false)
        FreezeEntityPosition(PlayerPedId(), true)
        BasketBallSpawn()
        OpenMyScore()
    else
        notify('no_money')
    end
end)

function OpenMyScore()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openmyscore",
    })
    ScoreUpdate()
end

function ScoreUpdate()
    if (ScoreData.remaining - ScoreData.throw) <= 0 then 
        FinishGame()
    else
        BasketBallSpawn()
        SendNUIMessage({
            action = "scoreupdate",
            ScoreData = ScoreData
        })
    end
end

function FinishGame()
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "finishgame",
    })
    lib.callback.await('BakiTelli_basketball:FinishGame', false, SelectMachine, ScoreData.score)
    ScoreData = {
        throw = 0,
        remaining = 0,
        score = 0,
    }
    FreezeEntityPosition(PlayerPedId(), false)
    SelectMachine = nil
end

function AttachBasketball(entity, rotation)
    local boneIndex = GetPedBoneIndex(PlayerPedId(), 28422)
    AttachEntityToEntity(
        entity,
        PlayerPedId(),
        boneIndex,
        0.0, 0.0, 0.0,  -- offset
        0.0, 0.0, rotation,  -- rotation
        true, true, true, false, 0.0, true
    )
end

function GetTopBasketball()
    local fetch = lib.callback.await('BakiTelli_basketball:GetTopBasketball', false)
    SendNUIMessage({
        action = "topbasketball",
        fetch = fetch
    })
end

function StartBallRotationThread(ball)
    local ballRotation = 0.0
    Citizen.CreateThread(function()
        while not BasketBallThrow do
            ballRotation = (ballRotation > 360) and 0.0 or (ballRotation + 60)
            AttachBasketball(ball, ballRotation)
            SetFollowPedCamViewMode(2)
            Citizen.Wait(0)
        end
    end)
end

function PlayBasketballAnimation()
    LoadAnim('pickup_object')
    TaskPlayAnim(PlayerPedId(), 'pickup_object', 'putdown_low', 
        5.0, 1.5, 1.0, 48, 0.0, 0, 0, 0)
    Citizen.Wait(500)
    ClearPedTasksImmediately(PlayerPedId())
    LoadAnim('amb@world_human_mobile_film_shocking@male@base')
    TaskPlayAnim(PlayerPedId(), 
        'amb@world_human_mobile_film_shocking@male@base', 'base', 
        8.0, 8.0, -1, 51, 0, false, false, false)
end

function CharacterCoords()
    local offsetX = math.cos(math.rad(Config.Machines[SelectMachine].w + 90)) * 1.35
    local offsetY = math.sin(math.rad(Config.Machines[SelectMachine].w + 90)) * 1.35
    local markerX = Config.Machines[SelectMachine].x + offsetX
    local markerY = Config.Machines[SelectMachine].y + offsetY
    local markerZ = Config.Machines[SelectMachine].z - 1
    SetEntityCoords(PlayerPedId(), markerX, markerY, markerZ)
    SetEntityHeading(PlayerPedId(), (Config.Machines[SelectMachine].w + 180) % 360)
end

function BasketBallSpawn()
    CharacterCoords()
    BasketBallThrow = false
    DeleteEntity(basketball)
    PlayBasketballAnimation()
    local forward = GetEntityForwardVector(PlayerPedId())
    local coords = GetEntityCoords(PlayerPedId()) + forward * 2
    local ball = CreateObject(GetHashKey(BallName), coords, true, true, true)
    SetEntityVelocity(ball, 0.0001, 0.0, 0.0)
    SetEntityAsMissionEntity(ball, true, true)
    AttachBasketball(ball, 0.0)
    basketball = ball
    Citizen.Wait(150)
    StartBallRotationThread(ball)
    SendNUIMessage({
        action = "openminigame",
    })
end


function CalculateThrowPower(marginValue)
    if marginValue >= -3 and marginValue <= 3 then
        return 0.35
    end

    local power = 0
    if marginValue >= 0 then
        power = 0.35 + ((marginValue - 3) / 44) * 0.65
    else
        power = 0.35 - ((math.abs(marginValue) - 3) / 44) * 0.25
    end

    if power > 0.21 and power < 0.48 then
        if power >= 0.35 then
            power = 0.5
        else
            power = 0.2
        end
    end

    power = math.min(1.0, math.max(0.1, power))
    return power
end

function BasketThrow(marginValue)
    if basketball then 
        BasketBallThrow = true 
        LoadAnim('amb@prop_human_movie_bulb@exit')
        ClearPedTasksImmediately(PlayerPedId())
        
        local offsetX = math.cos(math.rad(Config.Machines[SelectMachine].w + 90)) * 0.8
        local offsetY = math.sin(math.rad(Config.Machines[SelectMachine].w + 90)) * 0.8
        local markerX = Config.Machines[SelectMachine].x - offsetX
        local markerY = Config.Machines[SelectMachine].y - offsetY
        local basketPos = vector3(
            markerX,
            markerY,
            Config.Machines[SelectMachine].z + 2.6
        )
        
        local ballObj = basketball 
        local ballPos = GetEntityCoords(ballObj)
        DetachEntity(ballObj, true, true)
        basketball = nil

        local throwVector = basketPos - ballPos
        local distance = #throwVector
        throwVector = throwVector / distance

        local throwPower = CalculateThrowPower(marginValue)
        local baseVelocity = 10.0
        local gravity = 9.81
        local horizontalSpeed = baseVelocity * throwPower
        local verticalMultiplier
        if throwPower == 0.35 then
            verticalMultiplier = 2.0
        elseif throwPower < 0.35 then
            verticalMultiplier = 1.0 + throwPower
        else
            verticalMultiplier = 2.0 + (throwPower - 0.35)
        end
        
        local verticalSpeed = math.sqrt(2 * gravity * verticalMultiplier)

        SetEntityVelocity(ballObj, 
            throwVector.x * horizontalSpeed,
            throwVector.y * horizontalSpeed,
            verticalSpeed
        )

        TaskPlayAnim(PlayerPedId(), 'amb@prop_human_movie_bulb@exit', 'exit', 8.0, 8.0, -1, 48, 1, false, false, false)
        Citizen.Wait(2500)
        DeleteEntity(ballObj)
        Citizen.Wait(500)
        ClearPedTasks(PlayerPedId())
        if throwPower == 0.35 then
            ScoreData.score = ScoreData.score + 1
            notify('success')
        else
            notify('miss')
        end
        ScoreData.throw = ScoreData.throw + 1
        ScoreUpdate()
    end
end

-- function BasketThrow(marginValue)
--     if basketball then 
--         BasketBallThrow = true 
--         LoadAnim('amb@prop_human_movie_bulb@exit')
--         ClearPedTasksImmediately(PlayerPedId())
        
--         local forwardX = GetEntityForwardX(PlayerPedId())
--         local forwardY = GetEntityForwardY(PlayerPedId())
        
--         local ballObj = basketball 
--         DetachEntity(ballObj, true, true)
--         basketball = nil  

--         local throwPower = CalculateThrowPower(marginValue)
--         SetEntityVelocity(ballObj, 
--             forwardX * (throwPower * 10), 
--             forwardY * (throwPower * 10), 
--             throwPower * 10
--         )
--         TaskPlayAnim(PlayerPedId(), 'amb@prop_human_movie_bulb@exit', 'exit', 8.0, 8.0, -1, 48, 1, false, false, false)
--         Citizen.Wait(2500)
--         DeleteEntity(ballObj)
--         Citizen.Wait(500)
--         ClearPedTasks(PlayerPedId())
--         if throwPower == 0.35 then
--             ScoreData.score = ScoreData.score + 1
--             notify('success')
--         else
--             notify('miss')
--         end
--         ScoreData.throw = ScoreData.throw + 1
--         ScoreUpdate()
--     end
-- end

RegisterNUICallback("minigameResult", function(data, cb)
    local success = data.success
    local marginValue = tonumber(data.marginValue)
    BasketThrow(marginValue)
    if cb then cb('ok') end
end)

function LoadAnim(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
    return true
end