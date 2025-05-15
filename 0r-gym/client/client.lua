
if Config.FrameWork == "ESX" then
    ESX = Config.FrameWorkExport()
elseif Config.FrameWork == "QBCore" then
    QBCore = Config.FrameWorkExport()
elseif Config.FrameWork == "QBX" then
    sharedConfig = Config.FrameWorkExport()
end

local minigameData = nil
local proteinMultiplier = 1
RegisterNUICallback("minigamePosition", function(data)
    minigameData = data.position
end)
local isExerciseActive = false

function Warm()
    local animDict = "mini@triathlon"
    local animName = "ig_2_gen_warmup_02"
    local propDuration = 6000 
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(100)
    end
    local ped = PlayerPedId()
    TaskPlayAnim(ped, animDict, animName, 8.0, 8.0, -1, 1, 0, false, false, false)

    Citizen.Wait(propDuration)
    ClearPedTasksImmediately(ped)
    RemoveAnimDict(animDict)
end


function createCamera()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 0, true, true)
    SetCamCoord(cam, coords.x, coords.y, coords.z + 2.0) 
    SetCamRot(cam, 90.0, 180.0, GetEntityHeading(ped))
end

local repeatCounter = 0

AddEventHandler("s-gym:startExercise", function(name, table)

    local propDuration = 5000 
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local isExerciseActive = false 
    repeatCounter = 0
    local function loadAnimDict(animDict)
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Citizen.Wait(100)
        end
    end
    local missionEntity = false
    local offsetHeading = 180.0
    if Config["Exercises"][name] and Config["Exercises"][name]["missionEntity"] then
        missionEntity = Config["Exercises"][name]["missionEntity"]
    end
    if Config["Exercises"][name] and Config["Exercises"][name]["offsetHeading"] then
        offsetHeading = Config["Exercises"][name]["offsetHeading"]
    end
    local closestObj = GetClosestObjectOfType(pedCoords.x, pedCoords.y, pedCoords.z, 1.2, GetHashKey(name), missionEntity, 0, 0)
    if DoesEntityExist(closestObj) then
        FreezeEntityPosition(ped, true)
        local offsetHeight = Config["Exercises"][name]["offsetHeight"] or 0.0
        local offsetX = Config["Exercises"][name]["offsetX"] or 0.0
        local offsetY = Config["Exercises"][name]["offsetY"] or 0.0
        local closestObjOffset = GetOffsetFromEntityInWorldCoords(closestObj, offsetX, offsetY, offsetHeight)
        SetEntityCoordsNoOffset(ped, closestObjOffset.x, closestObjOffset.y, closestObjOffset.z)
        SetEntityHeading(ped, GetEntityHeading(closestObj) + offsetHeading) 
    end
    --for k, v in pairs(Config[table]) do
        --if k == name then
            if Config[table][name]["exerciseProp"] ~= "" then
                RequestModel(Config[table][name]["exerciseProp"])
                while not HasModelLoaded(Config[table][name]["exerciseProp"]) do
                    Citizen.Wait(100)
                end
            end
            if Config.Warm then Warm()end 
            Citizen.Wait(2000)
            loadAnimDict(Config[table][name]["exerciseAnimDict"])
            loadAnimDict(Config[table][name]["idleAnimDict"])
            loadAnimDict(Config[table][name]["exitAnimDict"])
            if Config[table][name]["cameraDisable"] then 
                DestroyCam(cam, false)
            else 
                createCamera()
            end
            local boneIndex = GetPedBoneIndex(ped, 28422) 
            local offset = vector3(0.0, 0.0, 0.0) 
            local rotation = vector3(0.0, 0.0, 0.0) 
            if Config[table][name]["doubleProp"] == true then 
                leftBoneIndex = GetPedBoneIndex(ped, 71)
                rightBoneIndex = GetPedBoneIndex(ped, 71)
                propleft = CreateObject(GetHashKey(Config[table][name]["exerciseProp"]), 0.0, 0.0, 0.0, true, true, true)
                AttachEntityToEntity(propleft, PlayerPedId(), 71, 0.081712312043578, 0.013338212609497, -0.018618469553758, 0, 0, -101.1737891102, true, true, false, true, 1, true)
                propright = CreateObject(GetHashKey(Config[table][name]["exerciseProp"]), 0.0, 0.0, 0.0, true, true, true)
                AttachEntityToEntity(propright,PlayerPedId(), 71, 0.2067141295156, 0.66709077877692, 0.084074260066877, 73.439531412546, -68.521233530743, -102.19700044171, true, true, false, true, 1, true)
            elseif Config[table][name]["doubleProp"] == false then
                prop = CreateObject(GetHashKey(Config[table][name]["exerciseProp"]), 0.0, 0.0, 0.0, true, true, true)
                AttachEntityToEntity(prop, ped, boneIndex, offset, rotation, true, true, false, true, 1, true)
            elseif Config[table][name]["doubleProp"] == nil then 
                --print("None Prop")
            end
     
            TaskPlayAnim(ped, Config[table][name]["idleAnimDict"], Config[table][name]["idleAnimName"], 8.0, -8.0, -1, 1, 0, false, false, false)
    
            if Config.MiniGame["difficulty"] == "custom" then
                SendNUIMessage({
                    action = 'MINIGAME_DATA',
                    status = true,
                    currentRepeat = 0,
                    minigameKey = Config.MiniGame["keycharacter"],
                    unit = Config[table][name]["exerciseUnit"]
                })
            else
                print("ox")
            end
            DisableControlAction(0, 38, true)
            DisableControlAction(0, 311, true)
            while true do
                DisableControlAction(0, 38, true)
                DisableControlAction(0, 311, true)
                if isExerciseActive then 
                    DisableControlAction(0, 38, true)
                    DisableControlAction(0, 311, true)
                else
                    DisableControlAction(0, 38, false)
                    DisableControlAction(0, 311, false)
                end
                
                if Config.MiniGame["difficulty"] == "custom" then
                    if IsControlJustPressed(0, 74) then -- H
                        if minigameData == "green" then
                            repeatCounter = repeatCounter + 1
                            if not isExerciseActive then
                                TaskPlayAnim(ped, Config[table][name]["exerciseAnimDict"], Config[table][name]["exerciseAnimName"], 8.0, -8.0, -1, 1, 0, false, false, false)
                                isExerciseActive = true
                                SendNUIMessage({
                                    action = 'MINIGAME_DATA',
                                    status = true,
                                    currentRepeat = repeatCounter,
                                    minigameKey = Config.MiniGame["keycharacter"],
                                    unit = Config[table][name]["exerciseUnit"]
                                })
                                Citizen.Wait(2000) 
                                TaskPlayAnim(ped, Config[table][name]["idleAnimDict"], Config[table][name]["idleAnimName"], 8.0, -8.0, -1, 1, 0, false, false, false)
                                isExerciseActive = false
                                UpdateSkill(Config[table][name]["gainedSkill"], math.random(#Config.GainedSkillAmount) * proteinMultiplier)
                                addPoint(5)
                            end
                        elseif minigameData == "red" then
                            isExerciseActive = false
                            if Config[table][name]["exerciseProp"] == "prop_curl_bar_01" then 
                                Citizen.Wait(500) 
                                DeleteEntity(propleft)
                                DeleteEntity(propright)
                                Citizen.Wait(500) 
                                ClearPedTasks(ped)
                                FreezeEntityPosition(ped, false)
                                DeleteEntity(propleft)
                                DeleteEntity(propright)
                                DeleteEntity(prop)
                                RenderScriptCams(false, false, 0, 1, 0)
                                DestroyCam(cam, false)
                                SendNUIMessage({
                                    action = 'MINIGAME_DATA',
                                    status = false,
                                    currentRepeat = repeatCounter,
                                    minigameKey = Config.MiniGame["keycharacter"],
                                    unit = Config[table][name]["exerciseUnit"]
                                })
                                
                            else
                                TaskPlayAnim(ped, Config[table][name]["exitAnimDict"], Config[table][name]["exitAnimName"], 8.0, -8.0, -1, 1, 0, false, false, false)
                                if Config[table][name]["doubleProp"] then
                                    Citizen.Wait(2000) 
                                    DeleteEntity(propleft)
                                    DeleteEntity(propright)
                                    Citizen.Wait(3000) 
                                    ClearPedTasks(ped)
                                    FreezeEntityPosition(ped, false)
                                    DeleteEntity(propleft)
                                    DeleteEntity(propright)
                                    DeleteEntity(prop)
                                    RenderScriptCams(false, false, 0, 1, 0)
                                    DestroyCam(cam, false)
                                    SendNUIMessage({
                                        action = 'MINIGAME_DATA',
                                        status = false,
                                        currentRepeat = repeatCounter,
                                        minigameKey = Config.MiniGame["keycharacter"],
                                        unit = Config[table][name]["exerciseUnit"]
                                    })
                                    
                                else
                                    Citizen.Wait(3000) 
                                    ClearPedTasks(ped)
                                    FreezeEntityPosition(ped, false)
                                    DeleteEntity(propleft)
                                    DeleteEntity(propright)
                                    DeleteEntity(prop)
                                    RenderScriptCams(false, false, 0, 1, 0)
                                    DestroyCam(cam, false)
                                    SendNUIMessage({
                                        action = 'MINIGAME_DATA',
                                        status = false,
                                        currentRepeat = repeatCounter,
                                        minigameKey = Config.MiniGame["keycharacter"],
                                        unit = Config[table][name]["exerciseUnit"]
                                    })
                                    
                                end
                                if Config[table][name]["cameraDisable"] or Config[table][name]["doubleProp"] == nil then 
                                    Citizen.Wait(500) 
                                    DeleteEntity(propleft)
                                    DeleteEntity(propright)
                                    Citizen.Wait(500) 
                                    ClearPedTasks(ped)
                                    FreezeEntityPosition(ped, false)
                                    DeleteEntity(propleft)
                                    DeleteEntity(propright)
                                    DeleteEntity(prop)
                                    RenderScriptCams(false, false, 0, 1, 0)
                                    DestroyCam(cam, false)
                                    SendNUIMessage({
                                        action = 'MINIGAME_DATA',
                                        status = false,
                                        currentRepeat = repeatCounter,
                                        minigameKey = Config.MiniGame["keycharacter"],
                                        unit = Config[table][name]["exerciseUnit"]
                                    })
                                    
                                else
                                    Citizen.Wait(3000) 
                                    ClearPedTasks(ped)
                                    FreezeEntityPosition(ped, false)
                                    DeleteEntity(propleft)
                                    DeleteEntity(propright)
                                    DeleteEntity(prop)
                                    RenderScriptCams(false, false, 0, 1, 0)
                                    DestroyCam(cam, false)
                                    SendNUIMessage({
                                        action = 'MINIGAME_DATA',
                                        status = false,
                                        currentRepeat = repeatCounter,
                                        minigameKey = Config.MiniGame["keycharacter"],
                                        unit = Config[table][name]["exerciseUnit"]
                                    })
                                    
                                end
                            end
                        
                        
                        break
                        else 
                            SendNUIMessage({
                                action = 'MINIGAME_DATA',
                                status = true,
                                currentRepeat = repeatCounter,
                                minigameKey = Config.MiniGame["keycharacter"],
                                unit = Config[table][name]["exerciseUnit"]
                            })
                        end
                    end
        
               
                    if IsControlJustPressed(0, Config.MiniGame["cancelkey"]) or IsControlJustPressed(0, 73) then -- G or X
                        isExerciseActive = false
                        if Config[table][name]["exerciseProp"] == "prop_curl_bar_01" then 
                            Citizen.Wait(500) 
                            DeleteEntity(propleft)
                            DeleteEntity(propright)
                            Citizen.Wait(500) 
                            ClearPedTasks(ped)
                            FreezeEntityPosition(ped, false)
                            DeleteEntity(propleft)
                            DeleteEntity(propright)
                            DeleteEntity(prop)
                            RenderScriptCams(false, false, 0, 1, 0)
                            DestroyCam(cam, false)
                            SendNUIMessage({
                                action = 'MINIGAME_DATA',
                                status = false,
                                currentRepeat = repeatCounter,
                                minigameKey = Config.MiniGame["keycharacter"],
                                unit = Config[table][name]["exerciseUnit"]
                            })
                            
                        else
                            TaskPlayAnim(ped, Config[table][name]["exitAnimDict"], Config[table][name]["exitAnimName"], 8.0, -8.0, -1, 1, 0, false, false, false)
                            if Config[table][name]["doubleProp"] then
                                Citizen.Wait(2000) 
                                DeleteEntity(propleft)
                                DeleteEntity(propright)
                                Citizen.Wait(3000) 
                                ClearPedTasks(ped)
                                FreezeEntityPosition(ped, false)
                                DeleteEntity(propleft)
                                DeleteEntity(propright)
                                DeleteEntity(prop)
                                RenderScriptCams(false, false, 0, 1, 0)
                                DestroyCam(cam, false)
                                SendNUIMessage({
                                    action = 'MINIGAME_DATA',
                                    status = false,
                                    currentRepeat = repeatCounter,
                                    minigameKey = Config.MiniGame["keycharacter"],
                                    unit = Config[table][name]["exerciseUnit"]
                                })
                                
                            else
                                Citizen.Wait(3000) 
                                ClearPedTasks(ped)
                                FreezeEntityPosition(ped, false)
                                DeleteEntity(propleft)
                                DeleteEntity(propright)
                                DeleteEntity(prop)
                                RenderScriptCams(false, false, 0, 1, 0)
                                DestroyCam(cam, false)
                                SendNUIMessage({
                                    action = 'MINIGAME_DATA',
                                    status = false,
                                    currentRepeat = repeatCounter,
                                    minigameKey = Config.MiniGame["keycharacter"],
                                    unit = Config[table][name]["exerciseUnit"]
                                })
                                
                            end
                            if Config[table][name]["cameraDisable"] or Config[table][name]["doubleProp"] == nil then 
                                Citizen.Wait(500) 
                                DeleteEntity(propleft)
                                DeleteEntity(propright)
                                Citizen.Wait(500) 
                                ClearPedTasks(ped)
                                FreezeEntityPosition(ped, false)
                                DeleteEntity(propleft)
                                DeleteEntity(propright)
                                DeleteEntity(prop)
                                RenderScriptCams(false, false, 0, 1, 0)
                                DestroyCam(cam, false)
                                SendNUIMessage({
                                    action = 'MINIGAME_DATA',
                                    status = false,
                                    currentRepeat = repeatCounter,
                                    minigameKey = Config.MiniGame["keycharacter"],
                                    unit = Config[table][name]["exerciseUnit"]
                                })
                               
                            else
                                Citizen.Wait(3000) 
                                ClearPedTasks(ped)
                                FreezeEntityPosition(ped, false)
                                DeleteEntity(propleft)
                                DeleteEntity(propright)
                                DeleteEntity(prop)
                                RenderScriptCams(false, false, 0, 1, 0)
                                DestroyCam(cam, false)
                                SendNUIMessage({
                                    action = 'MINIGAME_DATA',
                                    status = false,
                                    currentRepeat = repeatCounter,
                                    minigameKey = Config.MiniGame["keycharacter"],
                                    unit = Config[table][name]["exerciseUnit"]
                                })
                               
                            end
                        end
                        
                        
                        break
                    end
                else
                    local success =  lib.skillCheck({'easy', 'easy', {areaSize = 50, speedMultiplier = 1}, 'easy'}, {'w'})
                    if success then
                        if not isExerciseActive then
                            TaskPlayAnim(ped, Config[table][name]["exerciseAnimDict"], Config[table][name]["exerciseAnimName"], 8.0, -8.0, -1, 1, 0, false, false, false)
                            isExerciseActive = true
                           
                            Citizen.Wait(2000) 
                            TaskPlayAnim(ped, Config[table][name]["idleAnimDict"], Config[table][name]["idleAnimName"], 8.0, -8.0, -1, 1, 0, false, false, false)
                            isExerciseActive = false
  
                        end
                    else
                        isExerciseActive = false
                        
                        TaskPlayAnim(ped, Config[table][name]["exitAnimDict"], Config[table][name]["exitAnimName"], 8.0, -8.0, -1, 1, 0, false, false, false)
                        Citizen.Wait(5000) 
                        ClearPedTasks(ped)
                        FreezeEntityPosition(ped, false)
                        DeleteEntity(propleft)
                        DeleteEntity(propright)
                        DeleteEntity(prop)
                        RenderScriptCams(false, false, 0, 1, 0)
                        DestroyCam(cam, false)
                        repeatCounter = 0
                        break
                    end
                end
               
                Citizen.Wait(0)
            end
        --end
    --end
end)




RegisterNUICallback("buySkill", function(data)
    selectedSkill = data.skill
    selectedSkillPrice = data.price
    selectedPercent = data.percent
    TriggerServerEvent("s-gym:buySkill", selectedSkill, selectedSkillPrice, selectedPercent)
end)

RegisterNetEvent('s-gym:skillPurchased')
AddEventHandler('s-gym:skillPurchased', function(skill, percent)
    local totalSkill = percent
    UpdateSkill(skill, totalSkill)
end)
RegisterNetEvent('s-gym:2xprotein')
AddEventHandler('s-gym:2xprotein', function()
    proteinMultiplier = Config.ProteinMultiplier
    Config.Notification(Locales.Default["2xprotein"], "success", 5000) 
    Wait(Config.ProteinEffectTime)
    proteinMultiplier = 1
end)


RegisterCommand("checktebex", function(source, args, rawCommand)
    if Config.TebexIntegration then 
        if args[1] then
            Config.Notification(Locales.Default["checked"] .. args[1], "success", 5000) 
            TriggerServerEvent("s-gym:checktebex", args[1])
        else
            Config.Notification(Locales.Default["pleaseenterargument"], "success", 5000) 
        end
    else
        Config.Notification(Locales.Default["tebexintegrationclosed"], "error", 5000) 
    end
   
end, false)

RegisterNUICallback('getTask', function(data)
    local taskNumber = data.number
    if taskNumber and Config.Tasks[taskNumber] and Config.Tasks[taskNumber].Task then
        Config.Tasks[taskNumber].Task()
    else
        Config.Notification(Locales.Default["tasknotfound"], "error", 5000) 
    end
end)

RegisterCommand("tasks", function()
    if Config.Task then 
    local tasks = {}
	for type, value in pairs(Config.Tasks) do
		table.insert(tasks, {
			["taskDescription"] = value["taskDescription"],
            ["taskReward"] = value["taskReward"]
		})
	end
    SetNuiFocus(true,true)
    SendNUIMessage({
        action = 'TASKS',
        tasks = tasks,
    })
    else 
        Config.Notification(Locales.Default["tasknotfound"], "error", 5000) 
    end
end)

RegisterCommand("makeexercise", function()
    if IsPedInAnyVehicle(PlayerPedId(), false) then return end
    SetNuiFocus(true,true)
    SendNUIMessage({
        action = 'FREE',
    })
end)
RegisterKeyMapping('makeexercise', 'Do Exercise', 'keyboard', Config.FreeExercisesKey)

local tutorialActive = false
RegisterCommand("gymtutorial", function()
    tutorialActive = not tutorialActive
    if tutorialActive then
        SendNUIMessage({
            action = 'KEYBIND_OPEN',
        })
    else
        SendNUIMessage({
            action = 'KEYBIND_CLOSE',
        })
    end
end)
function addPoint(point)
    local pointsToAdd = point
    TriggerServerEvent("s-gym:addSkillPoints", pointsToAdd)
end

RegisterNUICallback('freeExercise', function(data)
    local exName = data.exercise
   
        if lib.progressBar({
            duration = Config.FreeExercises[exName]["animDuration"],
            label = Config.FreeExercises[exName]["progressDescription"],
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
            anim = {
                dict = Config.FreeExercises[exName]["animDict"],
                clip = Config.FreeExercises[exName]["animName"],
                flag = 1,
            },
            
        }) then   UpdateSkill(Config.FreeExercises[exName]["rewardSkill"], Config.FreeExercises[exName]["rewardPoint"] * proteinMultiplier)
            ClearPedTasksImmediately(PlayerPedId()) else    ClearPedTasksImmediately(PlayerPedId()) end
end)


