if config.framework ~= 'qb' then return end

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerUnload', client.onLogout)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(data)
	if not PlayerData.loaded then return end

	PlayerData = {
		source = data.source,
		identifier = data.citizenid,
		name = ('%s %s'):format(data.charinfo.firstname, data.charinfo.lastname),
		groups = groups,
		sex = data.charinfo.gender,
		dateofbirth = data.charinfo.birthdate,
		job = data.job.name,
		jobLabel = data.job.label,
		grade = data.job.grade.level,
		gradeLabel = data.job.grade.name,
		gang = data.gang.name,
		callsign = data.metadata.callsign,
		loaded = true
	}

	if (data.metadata.isdead or data.metadata.inlaststand) ~= PlayerData.dead then
		PlayerData.dead = data.metadata.isdead or data.metadata.inlaststand
	end
end)

function client.getPlayerData()
	return QBCore.Functions.GetPlayerData()
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', client.onLoad)