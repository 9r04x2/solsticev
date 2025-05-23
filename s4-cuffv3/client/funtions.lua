

local QBCore = exports['qb-core']:GetCoreObject()

cuffed = false

function OpenGeneralMenu()
    local closestPlayer, closestDistance = QBCore.Functions.GetClosestPed()
    local playerData = QBCore.Functions.GetPlayerData()

    local jobsAllowed = {
        police      = true,
        lssp        = true,
        dsd         = true,
        lspr        = true,
        bcsd        = true,
        ambulance   = true,
        vespuccipd  = true,
        pbsd        = true,
        doj         = true,
    }
    if not jobsAllowed[playerData.job.name] then return end

    local menu = {
        { header = "─────  Kelepçe Menü  ─────", txt = "", isMenuHeader = true },
        { header = "Kişiyi Ara",               txt = "", params = { event = "police:client:SearchPlayer" } },
        { header = "Kişiyi Taşı/Bırak",     txt = "", params = { event = "cuff:client:action", args = { action = "birak"    } } },
        { header = "Kişiyi araca koy",      txt = "", params = { event = "cuff:client:action", args = { action = "arac_bin" } } },
        { header = "Kişiyi araçtan çıkar",  txt = "", params = { event = "cuff:client:action", args = { action = "arac_in"  } } },
    }

    exports['qb-menu']:openMenu(menu)
end
function OpenRemoveBandMenu()
    local menu = {
        { header = "─────  Kelepçe Menü  ─────", txt = "", isMenuHeader = true },
        { header = "Black tape",              txt = "", params = { event = "cuff:client:action", args = { action = "bant"   } } },
        { header = "Cash money",              txt = "", params = { event = "cuff:client:action", args = { action = "money"  } } },
    }

    exports['qb-menu']:openMenu(menu)
end

RegisterCommand('openmenu', function()
    if not cuffed then
        OpenGeneralMenu()
    end
end, false)

RegisterKeyMapping('openmenu', 'PD Menü Aç', 'keyboard', 'F4')



function loadModel(model)
	RequestModel(GetHashKey(model))
	while (not HasModelLoaded(GetHashKey(model))) do
		Citizen.Wait(1)
	end
end

function loadDict(dict)
	while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end

function AnimSet(set)
	while not HasAnimSetLoaded(set) do
		RequestAnimSet(set)
		Citizen.Wait(1)
	end
end

function GetClosestAliveNPC(coords)
	local pedPool = GetGamePool("CPed")
	local coords = coords or GetEntityCoords(PlayerPedId())
	local closestPed = -1
	local closestDist = -1
	for _, ped in pairs(pedPool) do
		if not IsPedAPlayer(ped) and not IsPedDeadOrDying(ped) then 
			local distance = #(coords - GetEntityCoords(ped))
			if closestDist == -1 or distance < closestDist then
				closestPed = ped
				closestDist = distance
			end
		end
	end
	return closestPed, closestDist
end

function setIMG(x) 
	RequestNamedPtfxAsset("core")
	local txd = CreateRuntimeTxd('texture')
	local duiObj = CreateDui(x, 256, 256)
    _G.duiObj = duiObj
    local dui = GetDuiHandle(duiObj)
    local tx = CreateRuntimeTextureFromDuiHandle(txd, '_texture', dui)
    AddReplaceTexture('p_cs_cuffs_02_s', 'prop_chrome_03', 'texture', '_texture')
end
 
function startAnim()
	Citizen.CreateThread(function() 
		player = PlayerPedId() 
    	SetEnableHandcuffs(player, true) 
    	SetPedCanPlayGestureAnims(player, false) 
    	SetPedPathCanUseLadders(player, false) 
		
		
		while cuffed == true  do
    	    sleep = 500
    	    if not IsEntityPlayingAnim(player, animDict, animName, 49) or IsPedRagdoll(player) then 
			    sleep = 1
    	        TaskPlayAnim(player, animDict, animName, 8.0, -8, -1, 49, 0, false, false, false) 
    	    end
		    Citizen.Wait(sleep)
		end
		ClearPedTasks(player) 
    	SetPedCanPlayGestureAnims(player, true) 
    	SetPedPathCanUseLadders(player, true) 
    	SetEnableHandcuffs(player, false) 
  end)
end
 
function ProcessCuffs(type) 
    if cuffed == true then 
	   cuffed = false
	   startAnim() 
	end
	
    if type == 0 then 
        animName = "idle";
        animDict = "mp_arresting";
    elseif type == 1 then  
       animName = "idle";
       animDict = "anim@move_m@prisoner_cuffed";
    end

	cuffed = true
	startAnim()
end

function disableControls()
   Citizen.CreateThread(function() 
	  while cuffed == true do

	    DisableControlAction(0, 140, true)
        DisableControlAction(0, 141, true)
        DisableControlAction(0, 257, true)
        DisableControlAction(0, 142, true)
        DisableControlAction(0, 25, true)
        DisableControlAction(0, 24, true)
        DisableControlAction(0, 69, true)
        DisableControlAction(0, 92, true)
        DisableControlAction(0, 114, true)
		DisableControlAction(0, 56, true)
		DisableControlAction(0, 289, true)

		DisableControlAction(0, 21, true) -- Sol shift tuşunu devre dışı bırak
		DisableControlAction(0, 22, true) -- Boşluk tuşunu devre dışı bırak
	
		DisableControlAction(0, 24, true) -- Attack
		DisableControlAction(0, 257, true) -- Attack 2
		DisableControlAction(0, 25, true) -- Aim
		DisableControlAction(0, 263, true) -- Melee Attack 1


		DisableControlAction(0, 45, true) -- Reload
		DisableControlAction(0, 22, true) -- Jump
		DisableControlAction(0, 44, true) -- Cover
		DisableControlAction(0, 37, true) -- Select Weapon
		DisableControlAction(0, 23, true) -- Also 'enter'?

		DisableControlAction(0, 288,  true) -- Disable phone
		DisableControlAction(0, 289, true) -- Inventory
		DisableControlAction(0, 170, true) -- Animations
		DisableControlAction(0, 167, true) -- Job

		DisableControlAction(0, 0, true) -- Disable changing view
		DisableControlAction(0, 26, true) -- Disable looking behind
		DisableControlAction(0, 73, true) -- Disable clearing animation
		DisableControlAction(2, 199, true) -- Disable pause screen

		DisableControlAction(0, 59, true) -- Disable steering in vehicle
		DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
		DisableControlAction(0, 72, true) -- Disable reversing in vehicle

		DisableControlAction(2, 36, true) -- Disable going stealth

		DisableControlAction(0, 47, true)  -- Disable weapon
		DisableControlAction(0, 264, true) -- Disable melee
		DisableControlAction(0, 257, true) -- Disable melee
		DisableControlAction(0, 140, true) -- Disable melee
		DisableControlAction(0, 141, true) -- Disable melee
		DisableControlAction(0, 142, true) -- Disable melee
		DisableControlAction(0, 143, true) -- Disable melee
		DisableControlAction(0, 75, true)  -- Disable exit vehicle
		DisableControlAction(0, 49, true)  -- Disable exit vehicle
		DisableControlAction(0, 145, true)  -- Disable exit vehicle
		DisableControlAction(0, 185, true)  -- Disable exit vehicle
		DisableControlAction(0, 251, true)  -- Disable exit vehicle
		DisableControlAction(27, 75, true) -- Disable exit vehicle
		Citizen.Wait(0)
	  end
   end)
end