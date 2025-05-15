Config.UI = {}
Config.UI.UseMusic = true

Config.UI.UseConfiguration = true
Config.UI.UseInGameSettings = true
Config.UI.UseWelcomeScreen = true
Config.UI.UsePauseMenu = false
Config.UI.UseWeaponIndicator = true
Config.UI.StaticPerspective = false
Config.UI.UseAIOMenu = false
Config.UI.UseListenerForMumble = true
Config.UI.Use3DVoiceIndicator = true
Config.UI.DUI3D_CheckForIntersectWorld = true

Config.UI.UseLogoOnMinimapAnimation = true

Config.AutoStartMainMenu = true

Config.UI.DefaultColor = '#ee1c3e'

Config.UI.Preset = {}
Config.UI.Preset['hud'] = {
    selected = 'basic',
    options = {
        ['3d-mode'] = false,
        ['shadows'] = false,
        ['iconShadow'] = false,
        ['smoothEdges'] = false,
        ['under50'] = false,
    },
    refreshInterval = {
        max = 1000,
        min = 10,
        current = 500,
    },
    position = {
        minimap_on = {
            x = false, -- do not change those values since those are set in pixels.
            y = false, -- do not change those values since those are set in pixels.
        },
        minimap_off = {
            x = false, -- do not change those values since those are set in pixels.
            y = false, -- do not change those values since those are set in pixels.
        },
    }
}
Config.UI.Preset['carhud'] = {
    selected = 'basic',
    options = {
        ['shadows'] = false,
        ['strokeWidth'] = 90,
        ['animation'] = 'fade'
    },
    refreshInterval = {
        max = 350,
        min = 0,
        current = 125,
    },
    position = {
        x = false, -- do not change those values since those are set in pixels.
        y = false, -- do not change those values since those are set in pixels.
    }
}
Config.UI.Preset['notify'] = {
    selected = 'basic',
    options = {
        ['shadows'] = false,
        ['3d-mode'] = false,
        ['list'] = false,
        ['animation'] = 'from_right'
    },
    position = {
        x = false, -- do not change those values since those are set in pixels.
        y = false, -- do not change those values since those are set in pixels.
    }
}
Config.UI.Preset['helpNotify'] = {
    selected = 'basic',
    options = {
        ['shadows'] = false,
        ['smoothEdges'] = false,
        ['background'] = false,
        ['animation'] = 'fade'
    }
}

Config.UI.Preset['progressBar'] = {
    selected = 'basic',
    position = {
        x = false,
        y = false,
    },
    options = {
        ['shadows'] = false,
        ['animation'] = 'fade',
    }
}

Config.UI.Preset['music'] = {
    url = 'youtube.com/watch?v=9RriQbnddsw',
    volume = 30,
}

Config.UI.Preset['misc'] = {
    options = {
        ['use_minimap_overlay'] = false,
        ['minimap_outline'] = false,
        ['minimap_innershadow'] = false
    }
}

--[[
    This part is main handler for your interface.
    You can either choose which one to enable or disable using [use] variable.
    You can also change icons by changing [icon] variable, you can find the list here: https://fontawesome.com/v5/search
    And to change label you can change [label] variable
]]

Config.UI.Interfaces = {}
Config.UI.Interfaces['color'] = {
    name = 'color',
    label = 'Renk',
    icon = 'fas fa-fill',
    use = true,
}
Config.UI.Interfaces['hud'] = {
    name = 'hud',
    label = 'HUD',
    icon = 'fas fa-heart',
    use = true,
}
Config.UI.Interfaces['carhud'] = {
    name = 'carhud',
    label = 'Araç HUD',
    icon = 'fas fa-car',
    use = true,
}
Config.UI.Interfaces['notifications'] = {
    name = 'notifications',
    label = 'Bildirimler',
    icon = 'fas fa-envelope-open',
    use = false,
}

Config.UI.Interfaces['helpNotify'] = {
    name = 'helpNotify',
    label = 'Yardım Bildirimi',
    icon = 'fas fa-question',
    use = false,
}

Config.UI.Interfaces['progressBar'] = {
    name = 'progressBar',
    label = 'Ilerleme Çubuğu',
    icon = 'fas fa-circle-notch',
    use = false,
}

Config.UI.Interfaces['misc'] = {
    name = 'misc',
    label = 'Çeşitli',
    icon = 'fas fa-cogs',
    use = false,
}
Config.UI.Interfaces['positioning'] = {
    name = 'positioning',
    label = 'Pozisyon',
    icon = 'fas fa-arrows-alt',
    use = true,
}
