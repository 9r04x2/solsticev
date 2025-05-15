function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 0, -1)
end

_menuPool = NativeUI.CreatePool()
Menu1 = NativeUI.CreateMenu("Scene Control", "~b~Change the scene")
Menu2 = NativeUI.CreateMenu("Scene Control", "~b~Change the scene")
Menu3 = NativeUI.CreateMenu("Scene Control", "~b~Change the scene")
_menuPool:Add(Menu1)
_menuPool:Add(Menu2)
_menuPool:Add(Menu3)

local newitem = {}
newitem[1] = {item = NativeUI.CreateItem("Default", "Change the scene to: "..tostring("Default")), scene = "Default"}
Menu1:AddItem(newitem[1].item)
Menu2:AddItem(newitem[1].item)
Menu3:AddItem(newitem[1].item)
for k,v in pairs(entitySet) do
	local idx = #newitem+1
	newitem[idx] = {item = NativeUI.CreateItem(v.name, "Change the scene to: "..tostring(v.name)), scene = k}
	Menu1:AddItem(newitem[idx].item)
	Menu1.OnItemSelect = function(sender, item, index)
		for k1,v1 in pairs(newitem) do
			if item == v1.item then
				if showPrint then
					print("Change to: "..tostring(v1.scene))
				end
				TriggerServerEvent("Church1:ChangeEntitySet", v1.scene)
			end
		end
	end
	Menu2:AddItem(newitem[idx].item)
	Menu2.OnItemSelect = function(sender, item, index)
		for k1,v1 in pairs(newitem) do
			if item == v1.item then
				if showPrint then
					print("Change to: "..tostring(v1.scene))
				end
				TriggerServerEvent("Church2:ChangeEntitySet", v1.scene)
			end
		end
	end
	Menu3:AddItem(newitem[idx].item)
	Menu3.OnItemSelect = function(sender, item, index)
		for k1,v1 in pairs(newitem) do
			if item == v1.item then
				if showPrint then
					print("Change to: "..tostring(v1.scene))
				end
				TriggerServerEvent("Church3:ChangeEntitySet", v1.scene)
			end
		end
	end
end

_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		if (Menu1:Visible() or Menu2:Visible() or Menu3:Visible()) then
            _menuPool:ProcessMenus()
		else
			Wait(10)
        end
	end
end)

local isNear1 = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local ped = PlayerPedId()
		local coords = {}
		coords.x,coords.y,coords.z = table.unpack(GetEntityCoords(ped))
		if #(vector3(coords.x,coords.y,coords.z)-vector3(sceneControl1.x,sceneControl1.y,sceneControl1.z)) < 40.0 then
			--DrawMarker
			if not isNear1 then
				TriggerServerEvent("Church1:AskForEntitySet")
				-- TriggerServerEvent("Church1:AskForBuzzer")
			end
			isNear1 = true
			if #(vector3(coords.x,coords.y,coords.z)-vector3(sceneControl1.x,sceneControl1.y,sceneControl1.z)) < 1.5 then
				DisplayHelpText("Press ~input_context~ to access the scene menu")
				if IsControlJustReleased(1, 51) then
					Menu1:Visible(true)
				end
			else
				if Menu1:Visible() then
					Menu1:Visible(false)
				end
			end
		else
			Citizen.Wait(100)
		end
	end
end)

local isNear2 = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local ped = PlayerPedId()
		local coords = {}
		coords.x,coords.y,coords.z = table.unpack(GetEntityCoords(ped))
		if #(vector3(coords.x,coords.y,coords.z)-vector3(sceneControl2.x,sceneControl2.y,sceneControl2.z)) < 40.0 then
			--DrawMarker
			if not isNear2 then
				TriggerServerEvent("Church2:AskForEntitySet")
				-- TriggerServerEvent("Church1:AskForBuzzer")
			end
			isNear2 = true
			if #(vector3(coords.x,coords.y,coords.z)-vector3(sceneControl2.x,sceneControl2.y,sceneControl2.z)) < 1.5 then
				DisplayHelpText("Press ~input_context~ to access the scene menu")
				if IsControlJustReleased(1, 51) then
					Menu2:Visible(true)
				end
			else
				if Menu2:Visible() then
					Menu2:Visible(false)
				end
			end
		else
			Citizen.Wait(100)
		end
	end
end)

local isNear3 = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local ped = PlayerPedId()
		local coords = {}
		coords.x,coords.y,coords.z = table.unpack(GetEntityCoords(ped))
		if #(vector3(coords.x,coords.y,coords.z)-vector3(sceneControl3.x,sceneControl3.y,sceneControl3.z)) < 40.0 then
			--DrawMarker
			if not isNear3 then
				TriggerServerEvent("Church3:AskForEntitySet")
				-- TriggerServerEvent("Church1:AskForBuzzer")
			end
			isNear3 = true
			if #(vector3(coords.x,coords.y,coords.z)-vector3(sceneControl3.x,sceneControl3.y,sceneControl3.z)) < 1.5 then
				DisplayHelpText("Press ~input_context~ to access the scene menu")
				if IsControlJustReleased(1, 51) then
					Menu3:Visible(true)
				end
			else
				if Menu3:Visible() then
					Menu3:Visible(false)
				end
			end
		else
			Citizen.Wait(100)
		end
	end
end)

RegisterNetEvent('Church1:SendEntitySet', function(set)
	if showPrint then
		print("receive new set : "..tostring(set).." current id: "..tostring( GetInteriorAtCoords(GetEntityCoords(PlayerPedId()))))
	end
	for k,v in pairs(entitySet) do
		if k==set then
			ActivateInteriorEntitySet(interiorID1,k)
			if showPrint then
				print(tostring(k).." activated"..tostring(interiorID1))
			end
		else
			DeactivateInteriorEntitySet(interiorID1,k)
			if showPrint then
				print(tostring(k).." deactivated")
			end
		end
	end
	 RefreshInterior(interiorID1)
end)

RegisterNetEvent('Church2:SendEntitySet', function(set)
	if showPrint then
		print("receive new set : "..tostring(set).." current id: "..tostring( GetInteriorAtCoords(GetEntityCoords(PlayerPedId()))))
	end
	for k,v in pairs(entitySet) do
		if k==set then
			ActivateInteriorEntitySet(interiorID2,k)
			if showPrint then
				print(tostring(k).." activated"..tostring(interiorID2))
			end
		else
			DeactivateInteriorEntitySet(interiorID2,k)
			if showPrint then
				print(tostring(k).." deactivated")
			end
		end
	end
	 RefreshInterior(interiorID2)
end)

RegisterNetEvent('Church3:SendEntitySet', function(set)
	if showPrint then
		print("receive new set : "..tostring(set).." current id: "..tostring( GetInteriorAtCoords(GetEntityCoords(PlayerPedId()))))
	end
	for k,v in pairs(entitySet) do
		if k==set then
			ActivateInteriorEntitySet(interiorID3,k)
			if showPrint then
				print(tostring(k).." activated"..tostring(interiorID3))
			end
		else
			DeactivateInteriorEntitySet(interiorID3,k)
			if showPrint then
				print(tostring(k).." deactivated")
			end
		end
	end
	 RefreshInterior(interiorID3)
end)