--
-- Custom code for common events
--
local QBCore = exports['qb-core']:GetCoreObject()




---@param vehicle integer Vehicle entity
---@param vehicleDbData table Vehicle row from the database
---@param type "personal" | "job" | "gang"
RegisterNetEvent("jg-advancedgarages:client:InsertVehicle:config", function(vehicle, vehicleDbData, type)
  -- Code placed in here will be run when the player inserts their vehicle (if the vehicle is owned; and passes all the checks)
end)

---@param vehicle integer Vehicle entity
RegisterNetEvent("jg-advancedgarages:client:ImpoundVehicle:config", function(vehicle)
  -- Code placed in here will be run just before the vehicle is set to impounded in the DB, and before the entity is deleted
end)

---@param vehicle integer Vehicle entity
---@param vehicleDbData table Vehicle row from the database
---@param type "personal" | "job" | "gang"
RegisterNetEvent("jg-advancedgarages:client:TakeOutVehicle:config", function(raw, vehicleDbData, type)
  local veh = raw
  if not DoesEntityExist(veh) then
      veh = NetworkGetEntityFromNetworkId(raw)
  end

  print(("[invoice][CL] TakeOutVehicle: raw=%s -> veh=%s, type=%s"):format(tostring(raw), tostring(veh), tostring(type)))

  local cid = QBCore.Functions.GetPlayerData().citizenid

  QBCore.Functions.TriggerCallback('jg-advancedgarages:checkPendingInvoices', function(hasPending)
      print(("[invoice][CL] callback returned hasPending=%s"):format(tostring(hasPending)))

      if hasPending then
          QBCore.Functions.Notify('Ödenmemiş faturanız var! Aracı çıkaramazsınız.', 'error')

          if DoesEntityExist(veh) then
              NetworkRequestControlOfEntity(veh)
              local t0 = GetGameTimer()
              while not NetworkHasControlOfEntity(veh) and GetGameTimer()-t0 < 2000 do
                  Wait(10)
              end

              SetEntityAsMissionEntity(veh, true, true)
              DeleteVehicle(veh)
          else
          end

          return
      end

  end, cid)
end)
---@param plate string
---@param newOwnerPlayerId integer
RegisterNetEvent("jg-advancedgarages:client:TransferVehicle:config", function(plate, newOwnerPlayerId)
end)

---@param vehicle integer Vehicle entity
---@param plate string
---@param garageId string
---@param vehicleDbData table Vehicle row from the database
---@param props table Vehicle properties
---@param fuel integer Fuel level
---@param body integer Body health
---@param engine integer Engine health
---@param damageModel table Damage model
RegisterNetEvent('jg-advancedgarages:client:insert-vehicle-verification', function(vehicle, plate, garageId, vehicleDbData, props, fuel, body, engine, damageModel, cb)
  cb(true)
end)

---@param plate string
---@param vehicleDbData table Vehicle row from the database
---@param garageId string

lib.callback.register("jg-advancedgarages:client:takeout-vehicle-verification", function(plate, vehicleDbData, garageId)
  local cid   = QBCore.Functions.GetPlayerData().citizenid

  local pending, done = false, false
  QBCore.Functions.TriggerCallback('jg-advancedgarages:checkPendingInvoices', function(hasPending)
      pending = hasPending
      done    = true
  end, cid)

  local t0 = GetGameTimer()
  while not done and GetGameTimer() - t0 < 5000 do
      Wait(10)
  end

  if pending then
      QBCore.Functions.Notify('Ödenmemiş faturanız var! Aracı çıkaramazsınız.', 'error')
      return false
  end

  return true
end)

-- Check whether a vehicle can be transferred between players, return false to prevent
---@param fromPlayerSrc integer
---@param toPlayerSrc integer
---@param plate string
---@return boolean allowTransfer
lib.callback.register("jg-advancedgarages:client:transfer-vehicle-verification", function(fromPlayerSrc, toPlayerSrc, plate, vehicleDbData)

  return true
end)
-- Check whether a vehicle can be transferred between garages, return false to prevent
---@param currentGarageId string
---@param fromGarageId string
---@param toGarageId string
---@param plate string
---@return boolean allowTransfer
lib.callback.register("jg-advancedgarages:client:transfer-garage-verification", function(currentGarageId, fromGarageId, toGarageId, plate)
  return true
end)