-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config = {}

Config.checkForUpdates = true -- Check for Updates?

Config.Elevators = {
    PillboxElevatorNorth = { -- Elevator name(Doesn't show it's just to name table)
        [1] = {
            coords = vec3(332.37, -595.56, 43.28), -- Coords, if you're new; last number is heading
            heading = 70.65, -- Heading of how will spawn on floor
            title = 'Loby', -- Title 
            description = 'Giriş Kat', -- Description
            target = { -- Target length/width
                width = 5,
                length = 4
            },
            groups = {-- Job locks
                'police',
                'ambulance'
            },
        },
        [2] = {
            coords = vec3(344.31, -586.12, 28.79), -- Coords, if you're new; last number is heading
            heading = 252.84,
            title = 'Zemin Kat',
            description = 'Garaj Kısmı',
            target = {
            width = 5,
            length = 4
            } -- Example without group
        },
        [3] = {
            coords = vec3(338.4690, -583.9200, 74.1617), -- Coords, if you're new; last number is heading
            heading = 66.8454,
            title = 'Çatı Katı',
            description = 'Air',
            target = {
            width = 5,
            length = 4
            } -- Example without group
        },
    },
}