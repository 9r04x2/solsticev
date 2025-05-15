Config.PauseMenu = {}
Config.PauseMenu.Use = false
Config.PauseMenu.Style = 'default' -- WIP!
Config.PauseMenu.NavbarElements = {
    ['youtube'] = {
        label = 'YouTube',
        icon = 'fab fa-youtube',
        url = 'https://www.youtube.com/@solsticevroleplay',
        use = true,
    },
    ['store'] = {
        label = 'Store',
        icon = 'fas fa-globe',
        url = 'https://solsticev.net',
        use = true,
    },
    ['discord'] = {
        label = 'Discord',
        icon = 'fab fa-discord',
        url = 'https://discord.gg/solsticev',
        use = true,
    },
}

Config.PauseMenu.UserData = {
    ['mugshot'] = {
        use = true,
    },
    ['user_firstname_and_lastname'] = {
        use = true,
    },
    ['job_list'] = {
        use = true,
    },
    ['wallets_list'] = {
        use = true,
    },
}

Config.PauseMenu.Buttons = {
    ['ui'] = {
        name = 'ui',
        path = {
            type = 'UISettings',
        },
        icon = 'UI',
    },
    ['settings'] = {
        name = 'settings',
        path = {
            type = 'game',
            value = 'settings',
        },
        icon = 'fas fa-cog',
    },
    ['map'] = {
        name = 'map',
        path = {
            type = 'game',
            value = 'map',
        },
        icon = 'fas fa-map',
    },
    -- ['logout'] = {
    --     name = 'logout',
    --     path = {
    --         type = 'custom_payload',
    --         export = {
    --             resource = 'ZSX_Multicharacter',
    --             exportFunction = 'Logout',
    --             params = {}
    --         },
    --     },
    --     icon = 'fas fa-times',
    -- },
}