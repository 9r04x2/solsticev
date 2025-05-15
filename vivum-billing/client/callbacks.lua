local callbacks = {}
local currentUniqueId = 0

function EmitCallback(event, cb, ...)
	currentUniqueId = currentUniqueId + 1

	callbacks[currentUniqueId] = cb
	TriggerServerEvent("vivum-billing:emitCallback", event, currentUniqueId, ...)
end

RegisterNetEvent("vivum-billing:resCallback", function(unique, ...)
	if callbacks[unique] then
		callbacks[unique](...)
		callbacks[unique] = nil
	end
end)
