if config.framework ~= 'esx' then return end
-- local ESX = setmetatable({}, {
-- 	__index = function(self, index)
-- 		print('Self', self, index)
-- 		local obj = exports.es_extended:getSharedObject()
-- 		self.SetPlayerData = obj.SetPlayerData
-- 		self.PlayerLoaded = obj.PlayerLoaded
-- 		return self[index]
-- 	end
-- })
ESX = exports.es_extended:getSharedObject()

---@diagnostic disable-next-line: duplicate-set-field
function client.getPlayerData()
	return ESX.GetPlayerData()
end

---@diagnostic disable-next-line: duplicate-set-field
function client.setPlayerData(key, value)
	PlayerData[key] = value
	ESX.SetPlayerData(key, value)
end

RegisterNetEvent('esx:onPlayerLogout', client.onLogout)

AddEventHandler('esx:setPlayerData', function(data)
	if not PlayerData.loaded then return end

	if not data or not data?.job then
		return
	end

	PlayerData = {
		source = data.source,
		identifier = data.citizenid,
		name = ('%s %s'):format(data.firstName, data.lastName),
		sex = data.sex,
		dateofbirth = data.dateofbirth,
		job = data.job?.name,
		jobLabel = data.job?.label,
		grade = data.job?.grade,
		gradeLabel = data.job?.grade_label,
		callsign = '0',
		loaded = true
	}
	
	-- PlayerData[key] = value
	-- OnPlayerData(key, value)
end)

RegisterNetEvent('esx:playerLoaded', client.onLoad)