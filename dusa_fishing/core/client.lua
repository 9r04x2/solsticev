if not lib then return end

---@diagnostic disable-next-line: duplicate-set-field
function client.setPlayerData(key, value)
	PlayerData[key] = value
	OnPlayerData(key, value)
end

function client.hasItem(item, count)
	if not PlayerData.loaded then return end

	local itemCount = exports['qb-inventory']:GetItemByName(source, item)
	if itemData and itemData.count >= (count or 1) then
		return itemData.count
	end
end

function client.hasGroup(group)
	if not PlayerData.loaded then return end

	if type(group) == 'table' then
		for name, rank in pairs(group) do
			local groupRank = PlayerData.groups[name]
			if groupRank and groupRank >= (rank or 0) then
				return name, groupRank
			end
		end
	else
		local groupRank = PlayerData.groups[group]
		if groupRank then
			return group, groupRank
		end
	end
end

function client.onLoad()
	if PlayerData.loaded then 
		return 
	end

	PlayerData.loaded = true
	GlobalState.gpsChannels = {}

end

function client.onLogout()
	if not PlayerData.loaded then return end

	PlayerData.loaded = false

    if client.interval then
        ClearInterval(client.interval)
        ClearInterval(client.tick)
    end

end

function client.openStash(netId, source)
    if config.inventory == 'ox_inventory' then
        exports.ox_inventory:openInventory('stash', {id= 'Tackle', owner= source})
    elseif config.inventory == 'ps-inventory' or config.inventory == 'qs-inventory' then
        local stash = {
            id = 'Tackle_'..netId,
            label = 'Tackle Box',
            slots = 10,
            maxweight = 100000,
            owner = PlayerData.identifier
        }

        TriggerEvent("inventory:client:SetCurrentStash",  "Tackle_"..netId)    
        TriggerServerEvent('inventory:server:OpenInventory', "stash", "Tackle_"..netId, stash)
    elseif config.inventory == 'qb-inventory' then
        local stash = {
            id = 'Tackle_'..netId,
            label = 'Tackle Box',
            slots = 10,
            maxweight = 100000,
            owner = PlayerData.identifier
        }
        TriggerServerEvent('dusa_fishing:openQBStash', "Tackle_"..netId, stash)
    elseif config.inventory == 'codem-inventory' then
        local stash = {
            id = 'Tackle_'..netId,
            label = 'Tackle Box',
            slots = 10,
            maxweight = 100000,
            owner = PlayerData.identifier
        }
        TriggerServerEvent('codem-inventory:server:openstash', stash.id, stash.slots, stash.maxweight, stash.label)
    end
end

AddEventHandler('onResourceStart', function(resource)
    if resource ~= shared.resource then return end
    -- if not config.debug then return end

	local data = client.getPlayerData()
	PlayerData.loaded = true
	if config.framework == 'qb' then TriggerEvent('QBCore:Player:SetPlayerData', data)
	else TriggerEvent('esx:setPlayerData', data) end

	TriggerServerEvent('dusa_fishing:playerLoaded', data)
end)

local success, result = pcall(lib.load, ('core.%s.client'):format(shared.framework))

if not success then
    lib.print.error(result)
    lib = nil
    return
end