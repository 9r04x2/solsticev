Config = {}
Config.Debug = false
Config.Server = {
    ['Logo'] = 'https://i.ibb.co/DDvrmrmr/arkaplanszlogo.png', 
    ['Name'] = 'Solstice V'
}

Config.DefaultMusic = 'https://www.youtube.com/watch?v=lh4JdZTJe7k&ab_channel=SoothingRelaxation'

Config.Metrics = 'kmh' -- Available are 'kmh' | 'mph'
Config.UseSeatbelt = true
Config.PersistentMinimap = false -- If value is set to false, then map will be only visible while inside vehicle.
Config.AwaitShutdownLoadingScreen = true -- If true, UI will wait for manual close of loading screen. Make sure that you close it by yourself, since it can be looped in loading screen!
Config.CustomInitialization = true

Config.HideComponents = {
    [1] = true,         --  WANTED_STARS
    [2] = true,         --  WEAPON_ICON
    [3] = true,         --  CASH
    [4] = true,         --  MP_CASH
    [5] = true,         --  MP_MESSAGE
    [6] = true,         --  VEHICLE_NAME
    [7] = true,         --  AREA_NAME
    [8] = true,         --  VEHICLE_CLASS
    [9] = true,         --  STREET_NAME
    [10] = false,        --  HELP_TEXT
    [11] = false,        --  FLOATING_HELP_TEXT_1
    [12] = false,        --  FLOATING_HELP_TEXT_2
    [13] = true,        --  CASH_CHANGE
    [14] = false,        --  RETICLE
    [15] = true,        --  SUBTITLE_TEXT
    [16] = true,        --  RADIO_STATIONS
    [17] = true,        --  SAVING_GAME
    [18] = true,        --  GAME_STREAM
    [19] = false,        --  WEAPON_WHEEL
    [20] = false,        --  WEAPON_WHEEL_STATS
    [21] = true,        --  HUD_COMPONENTS
    [22] = true,        --  HUD_WEAPONS
}

Config.RemoveFeedsAndDefaultNotifications = true -- Makes feed and default notifications invisible (for better user experience)
Config.HandleUIVisibilityOnBaseEvents = true -- That means it will show up the whole hud at the specific time when player is loaded / unloaded.

Config.KeyBinds = {
    ['menu'] = {
        description = 'UI Menu',
        key = '',
    }, ['cancel_progressbar'] = {
        description = 'Cancel Progressbar',
        key = 'X'
    }, ['aio_menu'] = {
        description = 'AIO Menu',
        key = ''
    }, ['seatbelt'] = {
        description = 'Seatbelt',
        key = 'K'
    }, ['cinematic_mode'] = {
        description = 'Open Cinematic Mode',
        key = ''
    }, ['cinematic_focus'] = {
        description = 'Click to focus on Cinematic Mode',
        key = ''
    }, ['3d_perspective'] = {
        description = 'Show 3D Perspective',
        key = 'TAB'
    }
}

Config.UsePerspective = true

Config.WeaponBlacklist = {
    ['weapon_bat'] = false, -- ADD MODEL BLACKLIST SO THE WEAPON INDICATOR WON'T SHOW UP WHILE USING FOR EXAMPLE BAT
}