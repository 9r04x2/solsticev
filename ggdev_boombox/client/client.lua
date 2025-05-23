-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

xSound = exports.xsound
activeRadios = {}
Framework = nil

if GetResourceState('es_extended') == 'started' or GetResourceState('es_extended') == 'starting' then
    Framework = 'ESX'
    ESX = exports['es_extended']:getSharedObject()
elseif GetResourceState('qb-core') == 'started' or GetResourceState('qb-core') == 'starting' then
    Framework = 'qb'
    QBCore = exports['qb-core']:GetCoreObject()
else
    print("^0[^1ERROR^0] Check the Server console for infos!^0")
end

RegisterNetEvent('ggdev_boombox:useBoombox')
AddEventHandler('ggdev_boombox:useBoombox', function()
    local ped = PlayerPedId()
    local hash = loadModel('prop_boombox_01')
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 3.0, 0.5))
    local radio = CreateObjectNoOffset(hash, x, y, z, true, false)
    SetModelAsNoLongerNeeded(hash)
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`)
    AttachEntityToEntity(radio, ped, GetPedBoneIndex(ped, 57005), 0.32, 0, -0.05, 0.10, 270.0, 60.0, true, true, false, true, 1, true)
    hasBoomBox(radio)
end)

RegisterNetEvent('ggdev_boombox:deleteObj', function(netId)
    if DoesEntityExist(NetToObj(netId)) then
        DeleteObject(NetToObj(netId))
        if not DoesEntityExist(NetToObj(netId)) then
            TriggerServerEvent('ggdev_boombox:objDeleted')
        end
    end
end)

AddEventHandler('ggdev_boombox:pickup', function()
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local radio = `prop_boombox_01`
    local closestRadio = GetClosestObjectOfType(pedCoords, 3.0, radio, false)
    local radioCoords = GetEntityCoords(closestRadio)
    local musicId = 'id_'..closestRadio
    TaskTurnPedToFaceCoord(ped, radioCoords.x, radioCoords.y, radioCoords.z, 2000)
    TaskPlayAnim(ped, "pickup_object", "pickup_low", 8.0, 8.0, -1, 50, 0, false, false, false)
    Wait(1000)
    if xSound:soundExists(musicId) then
        TriggerServerEvent("ggdev_boombox:soundStatus", "stop", musicId, {})
    end
    FreezeEntityPosition(closestRadio, false)
    TriggerServerEvent("ggdev_boombox:deleteObj", ObjToNet(closestRadio))
    if activeRadios[closestRadio] then
        activeRadios[closestRadio] = nil
    end 
    TriggerServerEvent('ggdev_boombox:syncActive', activeRadios)
    ClearPedTasks(ped)
end)

RegisterNetEvent('ggdev_boombox:soundStatus')
AddEventHandler('ggdev_boombox:soundStatus', function(type, musicId, data)
    CreateThread(function()
        if type == "position" then
            if xSound:soundExists(musicId) then
                xSound:Position(musicId, data.position)
            end
        end
        if type == "play" then
            TriggerServerEvent('ggdev_boombox:DiscordKnows', data.link)
            xSound:PlayUrlPos(musicId, data.link, data.volume, data.position)
            xSound:Distance(musicId, data.distance)
            xSound:setVolume(musicId, data.volume)
        end

        if type == "volume" then
            xSound:setVolume(musicId, data.volume)
        end

        if type == "stop" then
            xSound:Destroy(musicId)
        end
    end)
end)

AddEventHandler('ggdev_boombox:interact', function()
    local pedCoords = GetEntityCoords(PlayerPedId())
    local radio = GetClosestObjectOfType(pedCoords, 5.0, `prop_boombox_01`, false)
    local radioCoords = GetEntityCoords(radio)
    interactBoombox(radio, radioCoords)
end)

AddEventHandler('ggdev_boombox:savedSongs', function(radio)
    savedSongsMenu(radio)
end)

AddEventHandler('ggdev_boombox:saveSong', function()
    local input = lib.inputDialog('Save Song', {'Name', 'Youtube Link'})
    if input[1] and input[2] then
        TriggerServerEvent('ggdev_boombox:save', input[1], input[2])
        exports['ZSX_UIV2']:Notification("Başarılı", "Song Saved", "fas fa-check-circle", 5000)
    else
        exports['ZSX_UIV2']:Notification("Hata", "You entered incomplete information", "fas fa-times-circle", 5000)
    end
end)

AddEventHandler('ggdev_boombox:selectSavedSong', function(data)
    selectSavedSong(data)
end)

AddEventHandler('ggdev_boombox:playSavedSong', function(data)
    local musicId = 'id_'..data.id
    TriggerServerEvent("ggdev_boombox:soundStatus", "play", musicId, { position = activeRadios[data.id].pos, link = data.link, volume = '0.2', distance = 25 })
    activeRadios[data.id].data = {playing = true, currentId = 'id_'..PlayerId()}
    TriggerServerEvent('ggdev_boombox:syncActive', activeRadios)
end)

AddEventHandler('ggdev_boombox:deleteSong', function(data)
	local confirmed = lib.alertDialog({
		header = 'Delete Song',
		content = 'Are you sure you wish to delete song?',
		centered = true,
		cancel = true
	})
	if confirmed == 'confirm' then
		TriggerServerEvent('ggdev_boombox:deleteSong', data)
		exports['ZSX_UIV2']:Notification("Başarılı", "Song deleted", "fas fa-check-circle", 5000)
	else
		exports['ZSX_UIV2']:Notification("Hata", "You have cancelled your previous action", "fas fa-times-circle", 5000)
	end
end)

AddEventHandler('ggdev_boombox:playMenu', function(data)
    local musicId = 'id_'..data.id
    if data.type == 'play' then
        local keyboard = lib.inputDialog('Play Music', {'Youtube URL','Distance (Max 40)', 'Volume (1-100)'})
        if keyboard then
            if keyboard[1] and tonumber(keyboard[2]) and tonumber(keyboard[2]) <= 40 and tonumber(keyboard[3]) and tonumber(keyboard[3]) <= 100 then
                TriggerServerEvent("ggdev_boombox:soundStatus", "play", musicId, { position = activeRadios[data.id].pos, link = keyboard[1], volume = keyboard[3]/100, distance = keyboard[2] })
                activeRadios[data.id].data = {playing = true, currentId = 'id_'..PlayerId()}
                TriggerServerEvent('ggdev_boombox:syncActive', activeRadios)
            end
        end
    elseif data.type == 'stop' then
        TriggerServerEvent("ggdev_boombox:soundStatus", "stop", musicId, {})
        activeRadios[data.id].data = {playing = false}
        TriggerServerEvent('ggdev_boombox:syncActive', activeRadios)
    elseif data.type == 'volume' then
        local keyboard = lib.inputDialog('Change Volume', {'Volume (1-100)'})    
        if keyboard then
            if tonumber(keyboard[1]) and tonumber(keyboard[1]) <= 100 then
                TriggerServerEvent("ggdev_boombox:soundStatus", "volume", musicId, {volume = keyboard[1]/100})
            end
        end
    elseif data.type == 'distance' then
        local keyboard = lib.inputDialog('Change Distance', {'Distance (Max 40)'})
        if keyboard then
            if tonumber(keyboard[1]) and tonumber(keyboard[1]) <= 40 then
                TriggerServerEvent("ggdev_boombox:soundStatus", "distance", musicId, {distance = keyboard[1]})
            end
        end
    end
end)

RegisterNetEvent('ggdev_boombox:syncActive')
AddEventHandler('ggdev_boombox:syncActive', function(activeBoxes)
    activeRadios = activeBoxes
end)
