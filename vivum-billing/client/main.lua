local open = false

CreateThread(function()
	local phoneState = GetResourceState("lb-phone")

	if phoneState == "starting" or phoneState == "started" then
		Mode = "lb-phone"
		
		while GetResourceState("lb-phone") ~= "started" do
			Wait(100)
		end

		local added, errorMessage = exports["lb-phone"]:AddCustomApp({
			identifier = "billing",
			name = (Config.OverrideAppName and Config.OverrideAppName ~= "") and Config.OverrideAppName or
				"Billing",
			description = "Receive and send individual or corporate invoices",
			developer = "Vivum",
			defaultApp = Config.DefaultApp,
			ui = GetCurrentResourceName() .. "/dist/index.html",
			icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/dist/app.png",
		})

		if not added then
			print("Could not add app:", errorMessage)
		end
	else
		Mode = "standalone"

		if not Config.DisableStandaloneUI then
			RegisterCommand("bills", function()
				SendAppMessage({
					action = "MutateState",
					key = "VISIBLE",
					values = { true }
				})

				SetNuiFocus(true, true)
				TriggerScreenblurFadeIn(500)

				open = true
			end, false)

			RegisterKeyMapping("bills", "Show bills", "keyboard", Config.DefaultKeybind)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)

		if open then
			DisableAllControlActions(0)

			-- disable look
			DisableControlAction(0, 1, true)
			DisableControlAction(0, 2, true)
			DisableControlAction(0, 4, true)
			DisableControlAction(0, 6, true)

			-- disable pause menu
			DisableControlAction(0, 199, true)
			DisableControlAction(0, 200, true)
		end
	end
end)

RegisterNuiCallback('close', function(_, cb)
	open = false

	SetNuiFocus(false, false)
	TriggerScreenblurFadeOut(500)

	cb({ status = "OK" })
end)

RegisterNetEvent('vivum-billing:sendNotification', function(data)
	SendAppMessage({
		action = "MutateState",
		key = "NOTIFICATIONS",
		method = "add",
		values = { data }
	})
end)

RegisterNetEvent("vivum-billing:queriedSpecificInvoice", function(data)
	SendAppMessage({
		action = "UpdateInvoice",
		value = data
	})
end)

RegisterNetEvent("vivum-billing:queriedInvoices", function(data)
	SendAppMessage({
		action = "MutateState",
		key = "INVOICES",
		values = { data }
	})
end)

RegisterNUICallback("sendInvoice", function(data, cb)
	EmitCallback("vivum-billing:sendInvoice", cb, data)
end)

RegisterNuiCallback("queryInvoices", function(data, cb)
	TriggerServerEvent("vivum-billing:queryInvoices", data)

	cb({ status = "OK" })
end)

RegisterNuiCallback("payInvoice", function(data, cb)
	EmitCallback("vivum-billing:payInvoice", cb, data)
end)

RegisterNuiCallback("cancelInvoice", function(data, cb)
	EmitCallback("vivum-billing:cancelInvoice", cb, data)
end)

RegisterNuiCallback("querySenders", function(_, cb)
	EmitCallback("vivum-billing:querySenders", cb)
end)

RegisterNuiCallback("queryRecipients", function(query, cb)
	EmitCallback("vivum-billing:queryRecipients", cb, query)
end)

RegisterNuiCallback('queryLocale', function(data, cb)
	local locale = data.locale and
		json.decode(LoadResourceFile(GetCurrentResourceName(), "locales/" .. data.locale .. ".json")) or nil
	local default = json.decode(LoadResourceFile(GetCurrentResourceName(), "locales/" .. Config.Locale .. ".json"))

	cb({ locale = locale, default = default })
end)

RegisterNetEvent("lb-phone:settingsUpdated", function(settings)
	SendAppMessage({
		type = "settingsUpdated",
		settings = settings
	})
end)
