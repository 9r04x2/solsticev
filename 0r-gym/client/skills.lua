if Config.FrameWork == "ESX" then
    ESX = Config.FrameWorkExport()
elseif Config.FrameWork == "QBCore" then
    QBCore = Config.FrameWorkExport()
elseif Config.FrameWork == "QBX" then
    sharedConfig = Config.FrameWorkExport()
end


if Config.FrameWork == "ESX" then
    RegisterNetEvent('esx:playerLoaded', function()
        FetchSkills()
    end)

elseif Config.FrameWork == "QBCore" then
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        FetchSkills()
    end)
elseif Config.FrameWork == "QBX" then
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        FetchSkills()
    end)
end                    
Citizen.CreateThread(function()
        if Config.RemoveSkills then
            while true do
            local seconds = Config.UpdateFrequency * 1000
            Citizen.Wait(seconds)

            for skill, value in pairs(Config.Skills) do
                UpdateSkill(skill, value["RemoveAmount"])
            end

            TriggerServerEvent("s-gym:update", json.encode(Config.Skills))
            end
        end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(25000)
		local ped = PlayerPedId()
		local vehicle = GetVehiclePedIsUsing(ped)

		if IsPedRunning(ped) then
			UpdateSkill("Stamina", 0.2)
		elseif IsPedInMeleeCombat(ped) then
			UpdateSkill("Strength", 0.5)
		elseif IsPedSwimmingUnderWater(ped) then
			UpdateSkill("Lung Capacity", 0.5)
		elseif IsPedShooting(ped) then
			UpdateSkill("Shooting", 0.5)
		elseif DoesEntityExist(vehicle) then
			local speed = GetEntitySpeed(vehicle) * 3.6

			if GetVehicleClass(vehicle) == 8 or GetVehicleClass(vehicle) == 13 and speed >= 5 then
				local rotation = GetEntityRotation(vehicle)
				if IsControlPressed(0, 210) then
					if rotation.x >= 25.0 then
						UpdateSkill("Driving", 0.2)
					end 
				end
			end
			if speed >= 80 then
				UpdateSkill("Driving", 0.2)
			end
		end
	end
end)

FetchSkills = function()
    if Config.FrameWork == "ESX" then
        ESX = Config.FrameWorkExport()
        ESX.TriggerServerCallback("s-gym:fetchStatus", function(data)
            if data then
                for status, value in pairs(data) do
                    if Config.Skills[status] then
                        Config.Skills[status]["Current"] = value["Current"]
                    else
                        -- Config.Notification("Removing: " .. status, "success", 5000) 
                    end
                end
            end
            RefreshSkills()
        end)
    elseif Config.FrameWork == "QBCore" then
        QBCore = Config.FrameWorkExport()
        QBCore.Functions.TriggerCallback("s-gym:fetchStatus", function(data)
            if data then
                for status, value in pairs(data) do
                    if Config.Skills[status] then
                        Config.Skills[status]["Current"] = value["Current"]
                    else
                        -- Config.Notification("Removing: " .. status, "success", 5000) 
                    end
                end
            end
            RefreshSkills()
        end)
    elseif Config.FrameWork == "QBX" then
        sharedConfig = Config.FrameWorkExport()
        lib.callback.await("s-gym:fetchStatus", function(data)
            if data then
                for status, value in pairs(data) do
                    if Config.Skills[status] then
                        Config.Skills[status]["Current"] = value["Current"]
                    else
                        -- Config.Notification("Removing: " .. status, "success", 5000) 
                    end
                end
            end
            RefreshSkills()
        end)
    end
    
end

RegisterCommand('skills', function(source, args)
    aduty = not aduty
    if aduty then 
    local skills = {}
	for type, value in pairs(Config.Skills) do
		table.insert(skills, {
			["current"] = value["Current"],
            ["description"] = value["skillDescription"],
            ["name"] = value["skillName"],
            ["pts"] = value["requiredPoints"],
		})
	end

    SendNUIMessage({
        action = 'SKILL_PAGE',
        skills = skills,
    })
    SendNUIMessage({
        action = 'KEYBIND_OPEN',
    })
    FetchSkills()
    else 
        SendNUIMessage({
            action = 'SKILL_PAGE_CLOSE',
            skills = skills,
        })
        SendNUIMessage({
            action = 'KEYBIND_CLOSE',
        })
    end
end)
RegisterCommand("mouse", function()
    aduty2 = not aduty2
    if aduty2 then 
        SetNuiFocus(true,true)
    else
        SetNuiFocus(false,false)
    end
end)
RegisterNUICallback("exit", function()
    SetNuiFocus(false, false)
  end)
  
GetCurrentSkill = function(skill)
    return Config.Skills[skill]
end

function NotificationCustom(skill, amount, time)
    SendNUIMessage({
        action = 'NOTIFICATION',
        GainedSkill = skill,
        GainedSkillAmount = amount,
        notifstatus = time,
    })
end

UpdateSkill = function(skill, amount)
   
    if not Config.Skills[skill] then
        Config.Notification("Skill " .. skill .. " doesn't exist", "error", 5000 )
        return
    end

    local SkillAmount = Config.Skills[skill]["Current"]
    
    if SkillAmount + tonumber(amount) < 0 then
        Config.Skills[skill]["Current"] = 0
    elseif SkillAmount + tonumber(amount) > 100 then
        Config.Skills[skill]["Current"] = 100
    else
        Config.Skills[skill]["Current"] = SkillAmount + tonumber(amount)
    end
    
    RefreshSkills()
    
  
        if tonumber(amount) > 0 then
            -- Config.Notification("+" .. amount .. "% " .. skill, "success", 5000)
            NotificationCustom(skill, amount, 2500)
        end

   
	TriggerServerEvent("s-gym:update", json.encode(Config.Skills))
end


function round(num) 
    return math.floor(num+.5) 
end

RefreshSkills = function()
    for type, value in pairs(Config.Skills) do
        
        if value["Stat"] then
            StatSetInt(value["Stat"], round(value["Current"]), true)
        end
        
        
    end
end


