if not lib then return end

for _, coords in ipairs(config.ped.locations) do
    Functions.createPed(coords, config.ped.model, {
        {
            label = locale('open_fisherman'),
            icon = 'fish',
            event = "dusa_fishing:OpenMenu",
        }
    })
    Functions.createBlip(coords, config.ped.blip)
end