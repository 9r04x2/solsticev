function waitUntil(cb, idle, timeout)
	local waiting = true
	idle = idle or 0
	
	if timeout then
		SetTimeout(timeout, function()
			waiting = false
		end)
	end

	while waiting do
		if cb() then return true end
		Wait(idle)
	end

	return false
end

function waitUntilPromise(cb, idle, timeout)
	local p = promise:new()
	idle = idle or 0

	if timeout then
		SetTimeout(timeout, function()
			p:resolve(false)
		end)
	end

	CreateThread(function()
		while p.state == 0 do
			if cb() then
				p:resolve(true)
				break
			end
			Wait(idle)
		end
	end)

	return p
end

return waitUntil