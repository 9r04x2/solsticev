
local QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = false
local PlayerData = nil

CreateThread(function()
	PlayerData = QBCore.Functions.GetPlayerData()
	if PlayerData then
		PlayerData = PlayerData
    PlayerJob = PlayerData.job
	end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
  QBCore.Functions.GetPlayerData(function(PlayerData)
    PlayerJob = PlayerData.job
  end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)


function checkJob()
    if Config.GPSJobs[PlayerJob.name] == nil then 
      return false
    else 
      return PlayerJob.name
    end
end

function SendNotify(text) 
    TriggerEvent('QBCore:Notify',text)
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
  
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end


function notUsing()
  return true
end