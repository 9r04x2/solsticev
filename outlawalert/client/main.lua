local QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}
notLoaded, currentStreetName, intersectStreetName, lastStreet, speedlimit, nearbyPeds, isPlayerWhitelisted, playerPed, playerCoords, job, rank, firstname, lastname, phone = true
playerIsDead = false
time = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	PlayerData = QBCore.Functions.GetPlayerData()
	GetPlayerInfo()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(jobInfo)
    PlayerData.job = jobInfo
    job = PlayerData.job.name
    isPlayerWhitelisted = refreshPlayerWhitelisted()
end)

function GetPlayerInfo()
	PlayerData = QBCore.Functions.GetPlayerData()
        firstname = PlayerData.charinfo.firstname
        lastname = PlayerData.charinfo.lastname
        phone = PlayerData.charinfo.phone
        if firstname == nil then Citizen.Wait(1000) end
			job = PlayerData.job.name
    		isPlayerWhitelisted = refreshPlayerWhitelisted()
end

function getSpeed() return speedlimit end
function getStreet() return currentStreetName end
function getStreetandZone(coords)
	local zone = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
	local currentStreetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
	currentStreetName = GetStreetNameFromHashKey(currentStreetHash)
	playerStreetsLocation = currentStreetName .. ", " .. zone
	return playerStreetsLocation
end

function refreshPlayerWhitelisted()
	if not PlayerData then return false end
	if not PlayerData.job then return false end
	if Config.Debug then return true end
	for k,v in ipairs({'police', 'sheriff', 'sasp', 'usng', 'usarmy', 'parkranger', 'adalet', 'gov', 'lssp', 'lspr', 'dsd', 'doj', 'vespuccipd', 'bcsd', 'pbsd', 'weazel', 'fbi'}) do
		if v == PlayerData.job.name then
			return true
		end
	end
	return false
end

function BlacklistedWeapon(playerPed)
	for i = 1, #Config.WeaponBlacklist do
		local weaponHash = GetHashKey(Config.WeaponBlacklist[i])
		if GetSelectedPedWeapon(playerPed) == weaponHash then
			return true -- Is a blacklisted weapon
		end
	end
	return false -- Is not a blacklisted weapon
end

function GetAllPeds()
	local getPeds = {}
	local findHandle, foundPed = FindFirstPed()
	local continueFind = (foundPed and true or false)
	local count = 0
	while continueFind do
		local pedCoords = GetEntityCoords(foundPed)
		if GetPedType(foundPed) ~= 28 and not IsEntityDead(foundPed) and not IsPedAPlayer(foundPed) and #(playerCoords - pedCoords) < Config.IhbarDistance then
			getPeds[#getPeds + 1] = foundPed
			count = count + 1
		end
		continueFind, foundPed = FindNextPed(findHandle)
	end
	EndFindPed(findHandle)
	return count
end

function zoneChance(type, zoneMod, street)
	if Config.DebugChance then return true end
	if not street then street = currentStreetName end
	playerCoords = GetEntityCoords(PlayerPedId())
	local zone, sendit = GetLabelText(GetNameOfZone(playerCoords.x, playerCoords.y, playerCoords.z)), false
	if not nearbyPeds then
		nearbyPeds = GetAllPeds()
	elseif nearbyPeds < 1 then if Config.Debug then print(('^1[%s] Nobody is nearby to send a report^7'):format(type)) end
		return false
	end
	if zoneMod == nil then zoneMod = 1 end
	zoneMod = (math.ceil(zoneMod+0.5))
	local hour = GetClockHours()
	if hour >= 21 or hour <= 4 then
		zoneMod = zoneMod * 1.6
		zoneMod = math.ceil(zoneMod+0.5)
	end
	zoneMod = zoneMod / (nearbyPeds / 3)
	zoneMod = (math.ceil(zoneMod+0.5))
	local sum = math.random(1, zoneMod)
	local chance = string.format('%.2f',(1 / zoneMod) * 100)..'%'

	if sum > 1 then
		if Config.Debug then print(('^1[%s] %s (%s) - %s nearby peds^7'):format(type, zone, chance, nearbyPeds)) end
		sendit = false
	else
		if Config.Debug then print(('^2[%s] %s (%s) - %s nearby peds^7'):format(type, zone, chance, nearbyPeds)) end
		sendit = true
	end
	return sendit
end

function vehicleData(vehicle)
	local vData = {}
	local vehicleClass = GetVehicleClass(vehicle)
	local vClass = {[0] = "compact araç", [1] = "sedan araç", [2] = "suv araç", [3] = "coupe araç", [4] = "muscle araç", [5] = "sport klasik araç", [6] = "sport araç", [7] = "super araç", [8] = "motor", [9] = "offroad araç", [10] = "endüstriyel araç", [11] = "kamu aracı", [12] = "van", [17] = "servis aracı", [18] = "devlet aracı", [19] = "askeri araç", [20] = "kamyon"}
	local vehClass = vClass[vehicleClass]
	local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
	local vehicleColour1, vehicleColour2 = GetVehicleColours(vehicle)
	if vehicleColour1 then
		if Config.Colours[tostring(vehicleColour2)] and Config.Colours[tostring(vehicleColour1)] then
			vehicleColour = Config.Colours[tostring(vehicleColour2)] .. " üstüne " .. Config.Colours[tostring(vehicleColour1)]
		elseif Config.Colours[tostring(vehicleColour1)] then
			vehicleColour = Config.Colours[tostring(vehicleColour1)]
		elseif Config.Colours[tostring(vehicleColour2)] then
			vehicleColour = Config.Colours[tostring(vehicleColour2)]
		else
			vehicleColour = "Unknown"
		end
	end
	local plate = "Bilinmiyor"
	local doorCount = 0
	if GetEntityBoneIndexByName(vehicle, 'door_pside_f') ~= -1 then doorCount = doorCount + 1 end
	if GetEntityBoneIndexByName(vehicle, 'door_pside_r') ~= -1 then doorCount = doorCount + 1 end
	if GetEntityBoneIndexByName(vehicle, 'door_dside_f') ~= -1 then doorCount = doorCount + 1 end
	if GetEntityBoneIndexByName(vehicle, 'door_dside_r') ~= -1 then doorCount = doorCount + 1 end
	if doorCount == 2 then doorCount = "İki kapılı " elseif doorCount == 3 then doorCount = "Üç kapılı " elseif doorCount == 4 then doorCount = "Dört kapılı " else doorCount = '' end
	vData.class, vData.name, vData.colour, vData.doors, vData.plate, vData.id = vehClass, vehicleName, vehicleColour, doorCount, plate, NetworkGetNetworkIdFromEntity(vehicle)
	return vData
end

local keremuyolla = true

Citizen.CreateThread(function()
    while true do
		sleep = 2000
		local ped = PlayerPedId()
		local pedCo = GetEntityCoords(ped)
		local dist = #(pedCo - vector3(2754.11, 1557.07, 24.5))
		local dist2 = #(pedCo - vector3(-3848.3, 7885.63, 88.78))
		local dist3 = #(pedCo - vector3(1257.41, 317.2, 81.99)) -- magic check 1
		local dist4 = #(pedCo - vector3(799.77, -2292.34, 37.54)) -- magic check 2
		local dist5 = #(pedCo - vector3(3890.53, 6966.15, 180.91)) -- bölge savaşı

		if dist < 280.0 or dist2 < 350.0 or dist3 < 70.0 or dist4 < 70.0 or dist5 < 300.0 then
			sleep = 0
		end

		if dist < 280.0 or dist2 < 350.0 or dist3 < 70.0 or dist4 < 70.0 or dist5 < 300.0 then
			keremuyolla = false
		else
			keremuyolla = true
		end
		Citizen.Wait(sleep)
    end
end)

function createBlip(data)
	Citizen.CreateThread(function()
		local alpha, blip = 255
		local sprite, colour, scale = 161, 84, 1.0
		if data.sprite then sprite = data.sprite end
		if data.colour then colour = data.colour end
		if data.scale then scale = data.scale end
		local entId = NetworkGetEntityFromNetworkId(data.netId)
		if data.netId and entId > 0 then
			blip = AddBlipForEntity(entId)
			SetBlipSprite(blip, sprite)
			SetBlipHighDetail(blip, true)
			SetBlipScale(blip, scale)
			SetBlipColour(blip, colour)
			SetBlipAlpha(blip, alpha)
			SetBlipAsShortRange(blip, false)
			SetBlipCategory(blip, 2)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(data.displayCode..' - '..data.dispatchMessage)
			EndTextCommandSetBlipName(blip)
			Citizen.Wait(data.length)
			RemoveBlip(blip)
			Citizen.Wait(0)
			blip = AddBlipForCoord(GetEntityCoords(entId))
		else
			data.netId = nil
			blip = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)
		end
		SetBlipSprite(blip, sprite)
		SetBlipHighDetail(blip, true)
		SetBlipScale(blip, scale)
		SetBlipColour(blip, colour)
		SetBlipAlpha(blip, alpha)
		SetBlipAsShortRange(blip, true)
		SetBlipCategory(blip, 2)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(data.displayCode..' - '..data.dispatchMessage)
		EndTextCommandSetBlipName(blip)
		while alpha ~= 0 do
			if data.netId then Citizen.Wait((data.length / 1000) * 5) else Citizen.Wait((data.length / 1000) * 20) end
			alpha = alpha - 1
			SetBlipAlpha(blip, alpha)
			if alpha == 0 then
				RemoveBlip(blip)
				return
			end
		end
	end)
end

isaretledim = false

RegisterNetEvent('wf-alerts:clNotify')
AddEventHandler('wf-alerts:clNotify', function(pData)
	if pData ~= nil then
		local sendit = false
		if QBCore == nil then 
			return
		end	
		local PlayerData = QBCore.Functions.GetPlayerData()
		if PlayerData then
			for i=1, #pData.recipientList do
				if pData.recipientList[i] == PlayerData.job.name then sendit = true break end
			end
			if sendit and PlayerData.job.onduty then
				Citizen.Wait(1500)
				if not pData.length then pData.length = 10000 end
				pData.street = getStreetandZone(vector3(pData.coords.x, pData.coords.y, pData.coords.z))
				SendNUIMessage({action = 'display', info = pData, job = PlayerData.job.name, length = pData.length})
				if pData.isImportant == 1 then
					TriggerServerEvent("InteractSound_SV:PlayOnSource", "emergency", 0.3)
				elseif pData.isImportant == 0 or pData.isImportant == nil then
					PlaySound(-1, "Event_Message_Purple", "GTAO_FM_Events_Soundset", 0, 0, 1)
				end
				isaretledim = true
				isaretle(pData)
				createBlip(pData)
				Citizen.Wait(pData.length+2000)
			end
		end
	end
end)

function isaretle(data)
	while isaretledim do
		Wait(0)
		if IsControlJustPressed(0, 38) then
			SetNewWaypoint(data.coords.x, data.coords.y)
			QBCore.Functions.Notify("Olay yeri gps'te işaretlendi.","success", 2000)
			isaretledim = false
		end
		Citizen.SetTimeout(5000, function()
		isaretledim = false
		end)
	end
end

local kodSend = false
RegisterCommand("kod", function(source, args)
	if QBCore.Functions.GetPlayerData().job.onduty == false then return QBCore.Functions.Notify("Mesaide değilsin!", "error") end

	local kodlvl = args[1]

   if kodlvl == nil then
      QBCore.Functions.Notify("Kod numarası belirtmelisin!", "error")
   end

  QBCore.Functions.TriggerCallback('gen_outlawalert:gps', function(gps)
	if gps then
		if tonumber(kodlvl) > 200 then return QBCore.Functions.Notify("200'den büyük kod gönderemezsin.", "error", 1000) end
	   if tonumber(kodlvl) ~= nil then 
	   	if tonumber(kodlvl) == 0 then
	   		if kodSend == false then
		   		PlayerJob = QBCore.Functions.GetPlayerData().job
					local charinfo = QBCore.Functions.GetPlayerData().charinfo
				if PlayerJob.name == "police" or PlayerJob.name == "sheriff" or PlayerJob.name == "sasp" or PlayerJob.name == "usng" or PlayerJob.name == "usarmy" or PlayerJob.name == "parkranger" or PlayerJob.name == "doj" or PlayerJob.name == "gov" or PlayerJob.name == "lssp" or PlayerJob.name == "lspr" or PlayerJob.name == "dsd" or PlayerJob.name == "vespuccipd" or PlayerJob.name == "bcsd" or PlayerJob.name == "pbsd" or PlayerJob.name == "weazel" or  PlayerJob.name == "ambulance" or PlayerJob.name == "fbi" then

						kodSend = true	
						data = {dispatchCode = 'persondown', caller = name, coords = playerCoords, netId = netId, length = 20000}
			         TriggerServerEvent("bb:officer:down", playerCoords)
			         Citizen.Wait(15000)
						kodSend = false
					end
				else
					QBCore.Functions.Notify("Bu kadar hızlı kod gönderemezsin!", "error")
				end
	   	else
	   		if kodSend == false then
					PlayerJob = QBCore.Functions.GetPlayerData().job
					local charinfo = QBCore.Functions.GetPlayerData().charinfo
				if PlayerJob.name == "police" or PlayerJob.name == "sheriff" or PlayerJob.name == "sasp" or PlayerJob.name == "usng" or PlayerJob.name == "usarmy" or PlayerJob.name == "parkranger" or PlayerJob.name == "doj" or PlayerJob.name == "gov" or PlayerJob.name == "lssp" or PlayerJob.name == "lspr" or PlayerJob.name == "dsd" or PlayerJob.name == "vespuccipd" or PlayerJob.name == "bcsd" or PlayerJob.name == "pbsd" or PlayerJob.name == "weazel" or  PlayerJob.name == "ambulance" or PlayerJob.name == "fbi" then

						kodSend = true
						data = {dispatchCode = 'persondown', caller = name, coords = playerCoords, netId = netId, length = 20000}
			         TriggerServerEvent("bb:ihbar:kod", tonumber(kodlvl), playerCoords)
			         Citizen.Wait(15000)
						kodSend = false
					end
				else
					QBCore.Functions.Notify("Bu kadar hızlı kod gönderemezsin!", "error")
				end
			end
	   end
	else
		QBCore.Functions.Notify("Üzerinde GPS yok kod gönderemezsin!", "error")
	end
	end)
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/kod', "PD/SD - Yardım çağrısı göndermek için kullanabilirsiniz.", {})
end)


Citizen.CreateThread(function()
	while notLoaded do Citizen.Wait(0) end
	local speedlimitValues = {["Joshua Rd"]=90, ["East Joshua Road"]=90, ["Marina Dr"]=70, ["Alhambra Dr"]=70, ["Niland Ave"]=70, ["Zancudo Ave"]=70, ["Armadillo Ave"]=70, ["Algonquin Blvd"]=70, ["Mountain View Dr"]=70, ["Cholla Springs Ave"]=70, ["Panorama Dr"]=70, ["Lesbos Ln"]=70, ["Calafia Rd"]=70, ["North Calafia Way"]=70, ["Cassidy Trail"]=70, ["Seaview Rd"]=70, ["Grapeseed Main St"]=70, ["Grapeseed Ave"]=70, ["Joad Ln"]=70, ["Union Rd"]=70, ["O'Neil Way"]=70, ["Senora Fwy"]=120, ["Catfish View"]=70, ["Great Ocean Hwy"]=70, ["Paleto Blvd"]=70, ["Duluoz Ave"]=70, ["Procopio Dr"]=70, ["Cascabel Ave"]=70, ["Procopio Promenade"]=70, ["Pyrite Ave"]=70, ["Fort Zancudo Approach Rd"]=70, ["Barbareno Rd"]=70, ["Ineseno Road"]=70, ["West Eclipse Blvd"]=70, ["Playa Vista"]=70, ["Bay City Ave"]=70, ["Del Perro Fwy"]=120, ["Equality Way"]=70, ["Red Desert Ave"]=70, ["Magellan Ave"]=70, ["Sandcastle Way"]=70, ["Vespucci Blvd"]=70, ["Prosperity St"]=70, ["San Andreas Ave"]=70, ["North Rockford Dr"]=70, ["South Rockford Dr"]=70, ["Marathon Ave"]=70, ["Boulevard Del Perro"]=70, ["Cougar Ave"]=70, ["Liberty St"]=70, ["Bay City Incline"]=70, ["Conquistador St"]=70, ["Cortes St"]=70, ["Vitus St"]=70, ["Aguja St"]=70, ["Goma St"]=70, ["Melanoma St"]=70, ["Palomino Ave"]=70, ["Invention Ct"]=70, ["Imagination Ct"]=70, ["Rub St"]=70, ["Tug St"]=70, ["Ginger St"]=70, ["Lindsay Circus"]=70, ["Calais Ave"]=70, ["Adam's Apple Blvd"]=70, ["Alta St"]=70, ["Integrity Way"]=70, ["Swiss St"]=70, ["Strawberry Ave"]=70, ["Capital Blvd"]=70, ["Crusade Rd"]=70, ["Innocence Blvd"]=70, ["Davis Ave"]=70, ["Little Bighorn Ave"]=70, ["Roy Lowenstein Blvd"]=70, ["Jamestown St"]=70, ["Carson Ave"]=45, ["Grove St"]=70, ["Brouge Ave"]=70, ["Covenant Ave"]=70, ["Dutch London St"]=70, ["Signal St"]=70, ["Elysian Fields Fwy"]=120, ["Plaice Pl"]=70, ["Chum St"]=70, ["Chupacabra St"]=70, ["Miriam Turner Overpass"]=70, ["Autopia Pkwy"]=70, ["Exceptionalists Way"]=70, ["La Puerta Fwy"]=120, ["New Empire Way"]=70, ["Runway1"]="--", ["Greenwich Pkwy"]=70, ["Kortz Dr"]=70, ["Banham Canyon Dr"]=70, ["Buen Vino Rd"]=70, ["Route 68"]=120, ["Zancudo Grande Valley"]=70, ["Zancudo Barranca"]=70, ["Galileo Rd"]=70, ["Mt Vinewood Dr"]=70, ["Marlowe Dr"]=70, ["Milton Rd"]=70, ["Kimble Hill Dr"]=70, ["Normandy Dr"]=70, ["Hillcrest Ave"]=70, ["Hillcrest Ridge Access Rd"]=70, ["North Sheldon Ave"]=70, ["Lake Vinewood Dr"]=70, ["Lake Vinewood Est"]=70, ["Baytree Canyon Rd"]=70, ["Peaceful St"]=70, ["North Conker Ave"]=70, ["Wild Oats Dr"]=70, ["Whispymound Dr"]=70, ["Didion Dr"]=70, ["Cox Way"]=70, ["Picture Perfect Drive"]=70, ["South Mo Milton Dr"]=70, ["Cockingend Dr"]=70, ["Mad Wayne Thunder Dr"]=70, ["Hangman Ave"]=70, ["Dunstable Ln"]=70, ["Dunstable Dr"]=70, ["Greenwich Way"]=70, ["Greenwich Pl"]=70, ["Hardy Way"]=70, ["Richman St"]=70, ["Ace Jones Dr"]=70, ["Los Santos Freeway"]=120, ["Senora Rd"]=70, ["Nowhere Rd"]=35, ["Smoke Tree Rd"]=70, ["Cholla Rd"]=70, ["Cat-Claw Ave"]=70, ["Senora Way"]=70, ["Palomino Fwy"]=120, ["Shank St"]=70, ["Macdonald St"]=70, ["Route 68 Approach"]=120, ["Vinewood Park Dr"]=70, ["Vinewood Blvd"]=70, ["Mirror Park Blvd"]=70, ["Glory Way"]=70, ["Bridge St"]=70, ["West Mirror Drive"]=70, ["Nikola Ave"]=70, ["East Mirror Dr"]=70, ["Nikola Pl"]=35, ["Mirror Pl"]=70, ["El Rancho Blvd"]=70, ["Olympic Fwy"]=120, ["Fudge Ln"]=70, ["Amarillo Vista"]=70, ["Labor Pl"]=70, ["El Burro Blvd"]=70, ["Sustancia Rd"]=55, ["South Shambles St"]=70, ["Hanger Way"]=70, ["Orchardville Ave"]=70, ["Popular St"]=70, ["Buccaneer Way"]=55, ["Abattoir Ave"]=70, ["Voodoo Place"]=40, ["Mutiny Rd"]=70, ["South Arsenal St"]=70, ["Forum Dr"]=70, ["Morningwood Blvd"]=70, ["Dorset Dr"]=70, ["Caesars Place"]=70, ["Spanish Ave"]=70, ["Portola Dr"]=70, ["Edwood Way"]=70, ["San Vitus Blvd"]=70, ["Eclipse Blvd"]=70, ["Gentry Lane"]=40, ["Las Lagunas Blvd"]=70, ["Power St"]=70, ["Mt Haan Dr"]=70, ["Elgin Ave"]=70, ["Hawick Ave"]=70, ["Meteor St"]=70, ["Alta Pl"]=70, ["Occupation Ave"]=70, ["Carcer Way"]=70, ["Eastbourne Way"]=70, ["Rockford Dr"]=70, ["Abe Milton Pkwy"]=70, ["Laguna Pl"]=70, ["Sinners Passage"]=70, ["Atlee St"]=70, ["Sinner St"]=70, ["Supply St"]=70, ["Amarillo Way"]=70, ["Tower Way"]=70, ["Decker St"]=70, ["Tackle St"]=70, ["Low Power St"]=70, ["Clinton Ave"]=70, ["Fenwell Pl"]=70, ["Utopia Gardens"]=70, ["Cavalry Blvd"]=70, ["South Boulevard Del Perro"]=70, ["Americano Way"]=70, ["Sam Austin Dr"]=70, ["East Galileo Ave"]=70, ["Galileo Park"]=70, ["West Galileo Ave"]=70, ["Tongva Dr"]=70, ["Zancudo Rd"]=70, ["Movie Star Way"]=70, ["Heritage Way"]=70, ["Perth St"]=70, ["Chianski Passage"]=70, ["Lolita Ave"]=70, ["Meringue Ln"]=70, ["Strangeways Dr"]=70}
	while true do
		Citizen.Wait(0)
		playerCoords = GetEntityCoords(PlayerPedId())
		if currentStreetName then lastStreet = currentStreetName end
		local currentStreetHash = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
		currentStreetName = GetStreetNameFromHashKey(currentStreetHash)
		if currentStreetName ~= lastStreet or not speedlimit then speedlimit = speedlimitValues[currentStreetName] end
		nearbyPeds = GetAllPeds()
		Citizen.Wait(500)
	end
end)

Citizen.CreateThread(function()
	local vehicleWhitelist = {[0]=true,[1]=true,[2]=true,[3]=true,[4]=true,[5]=true,[6]=true,[7]=true,[8]=true,[9]=true,[10]=true,[11]=true,[12]=true,[17]=true,[19]=true,[20]=true}
	local sleep = 100
	while true do
		if not notLoaded then
			playerPed = PlayerPedId()
			if (not isPlayerWhitelisted or Config.Debug) then
				for k, v in pairs(Config.Timer) do
					if v > 0 then Config.Timer[k] = v - 1 end
				end

				if GetVehiclePedIsUsing(playerPed) ~= 0 then
					local vehicle = GetVehiclePedIsUsing(playerPed, true)
						if vehicleWhitelist[GetVehicleClass(vehicle)] then
						local driver = GetPedInVehicleSeat(vehicle, -1)
						if Config.Timer['Shooting'] == 0 and not BlacklistedWeapon(playerPed) and not IsPedCurrentWeaponSilenced(playerPed) and IsPedArmed(playerPed, 4) then
							sleep = 10
							if IsPedShooting(playerPed) and zoneChance('Driveby', 2, currentStreetName) and keremuyolla then
								local veh = vehicleData(vehicle)
								data = {dispatchCode = 'driveby', caller = "İhbar", coords = playerCoords, netId = veh.id, length = 10000,
								info = ('[%s] %s%s'):format(veh.plate, veh.doors, veh.class), info2 = veh.colour}
								TriggerServerEvent('wf-alerts:svNotify', data)
								Config.Timer['Shooting'] = Config.Shooting.Success
							else
								Config.Timer['Shooting'] = Config.Shooting.Fail
							end
						elseif Config.Timer['Speeding'] == 0 and playerPed == driver and speedlimit then
							sleep = 100
							if (GetEntitySpeed(vehicle) * 30.6) >= (speedlimit + (math.random(30,60))) then
								if zoneChance('Speeding', 4, currentStreetName) then
									Citizen.Wait(400)
									if IsPedInAnyVehicle(playerPed, true) and ((GetEntitySpeed(vehicle) * 3.6) >= (speedlimit + (math.random(30,60)))) then
										local veh = vehicleData(vehicle)
										data = {dispatchCode = 'speeding', caller = "İhbar", coords = playerCoords, netId = veh.id,
										info = ('[%s] %s%s'):format(veh.plate, veh.doors, veh.class), info2 = veh.colour}
										TriggerServerEvent('wf-alerts:svNotify', data)
										Config.Timer['Speeding'] = Config.Speeding.Success
									end
								else
									Config.Timer['Speeding'] = Config.Speeding.Fail
								end
							end
						elseif Config.Timer['Autotheft'] == 0 and (IsPedGettingIntoAVehicle(playerPed) and GetSeatPedIsTryingToEnter(playerPed) == -1) and ((driver > 0 and not IsPedAPlayer(driver)) or IsVehicleAlarmActivated(vehicle)) then
							sleep = 100
							local veh = vehicleData(vehicle)
							QBCore.Functions.TriggerCallback('linden_outlawalert:isVehicleOwned', function(hasowner) veh.owned = hasowner end, veh.plate)
							if not veh.owned then
								if zoneChance('Autotheft', 2, currentStreetName) then
									data = {dispatchCode = 'autotheft', caller = "İhbar", coords = playerCoords, netId = veh.id,
									info = ('[%s] %s %s'):format(veh.plate, veh.name..',', veh.class), info2 = veh.colour}
									TriggerServerEvent('wf-alerts:svNotify', data)
									Config.Timer['Autotheft'] = Config.Autotheft.Success
								else
									Config.Timer['Autotheft'] = Config.Autotheft.Fail
								end
							end
						else sleep = 100 end
					end
				else
					if Config.Timer['Shooting'] == 0 and not BlacklistedWeapon(playerPed) and not IsPedCurrentWeaponSilenced(playerPed) and IsPedArmed(playerPed, 4) then
						sleep = 10
						if IsPedShooting(playerPed) and zoneChance('Shooting', 2, currentStreetName) and keremuyolla then
							data = {dispatchCode = 'shooting', caller = "İhbar", coords = playerCoords, netId = NetworkGetNetworkIdFromEntity(playerPed), length = 10000}
							TriggerServerEvent('wf-alerts:svNotify', data)
							Config.Timer['Shooting'] = Config.Shooting.Success
						else
							Config.Timer['Shooting'] = Config.Shooting.Fail
						end
					elseif Config.Timer['Melee'] == 0 and IsPedInMeleeCombat(playerPed) and HasPedBeenDamagedByWeapon(GetMeleeTargetForPed(playerPed), 0, 1) then
						sleep = 10
						if zoneChance('Melee', 3, currentStreetName) then
							data = {dispatchCode = 'melee', caller = "İhbar", coords = playerCoords, netId = NetworkGetNetworkIdFromEntity(playerPed), length = 10000}
							TriggerServerEvent('wf-alerts:svNotify', data)
							Config.Timer['Melee'] = Config.Melee.Success
						else
							Config.Timer['Melee'] = Config.Melee.Fail
						end
					else sleep = 100 end
				end
			end
		else 
			Citizen.Wait(2000)
		end
		Citizen.Wait(sleep)
	end
end)

RegisterNetEvent("gen_outlawalert:arachirsizligi")
AddEventHandler("gen_outlawalert:arachirsizligi", function(vehicle)
	local veh = vehicleData(vehicle)
	data = {dispatchCode = 'autotheft', caller = "İhbar", coords = playerCoords, netId = veh.id,
   info = ('[%s] %s %s'):format(veh.plate, veh.name..',', veh.class), info2 = veh.colour}
   TriggerServerEvent('wf-alerts:svNotify', data)


   local alertData = {
        title = "10-16 - Araç hırsızlığı",
        coords = {x = playerCoords.x, y = playerCoords.y, z = playerCoords.z},
        description =veh.name.." - " ..veh.class..  " | " ..veh.colour.. " | "..veh.plate,
    }
    TriggerEvent("qb-phone:client:addPoliceAlert", alertData)
end)

local canSendDistress  = true
RegisterNetEvent("ambulance:ihbar")
AddEventHandler("ambulance:ihbar", function()
	if canSendDistress then
		if (QBCore.Functions.GetPlayerData().metadata["isdead"] or QBCore.Functions.GetPlayerData().metadata["inlaststand"])then
			canSendDistress = false
			QBCore.Functions.Notify("İlkyardım talebin başarıyla gönderildi!", "success")
			local netId = NetworkGetNetworkIdFromEntity(playerPed)
			local name = ('%s %s'):format(firstname, lastname)
			local title = ('%s %s'):format(PlayerData.job.name, lastname)
			refreshPlayerWhitelisted()
			if isPlayerWhitelisted then
				Citizen.Wait(2000)
				data = {dispatchCode = 'persondown', caller = name, coords = playerCoords, netId = netId, length = 20000}
				isaretledim = true
				isaretle(data)
				TriggerServerEvent("bb:officer:down", playerCoords)
				Citizen.Wait(20000)
				canSendDistress = true
			elseif Config.Enable.PlayerDowned then
				Citizen.Wait(2000)
				data = {dispatchCode = 'persondown', caller = name, coords = playerCoords, netId = netId, length = 20000}
				isaretledim = true
				isaretle(data)
				TriggerServerEvent('wf-alerts:svNotify', data)
				Citizen.Wait(20000)
				canSendDistress = true
			end
		end
	else
		QBCore.Functions.Notify("Zaten yakın zamanda bir ihbar gönderdin, biraz sabırlı ol!", "error")
	end
end, false)
