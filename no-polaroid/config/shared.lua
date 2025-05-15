-- https://none-fivem.gitbook.io/nonem/resources/no-polaroid/configuration

Config = {
    Webhook = "https://discord.com/api/webhooks/1371300742950031370/8btP9WdAg_HMj892Onq5l7khY0UFmTiLyce0q_MCEzj7NDMCkPsAtstXjqam46Q35d02", -- Discord Webhook | Leave it blank if you want to use https://imgbox.com/ as image storage
    DateLocale = "en-US",
    Items = {
        Camera = "polaroid_camera",
        Photo = "polaroid_photo"
    },
    Keys = { -- Default keys for mapping.
        FOCUS = "H",
        CLOSE = "BACK",
        NEXT_FILTER = "RIGHT",
        PREV_FILTER = "LEFT",
        INCREASE_STRENGTH = "UP",
        DECREASE_STRENGTH = "DOWN"
    },
    Filters = { -- Timecycle modifiers https://wiki.rage.mp/index.php?title=Timecycle_Modifiers
        {filter = "NG_filmnoir_BW01", label = "Film Noir"},
        {filter = "NG_filmnoir_BW02", label = "Film Noir 2"},
        {filter = "NG_filmic01", label = "Filmic 1"},
        {filter = "NG_filmic02", label = "Filmic 2"},
        {filter = "NG_filmic03", label = "Filmic 3"},
        {filter = "NG_filmic04", label = "Filmic 4"},
        {filter = "NG_filmic05", label = "Filmic 5"},
        {filter = "NG_filmic06", label = "Filmic 6"},
        {filter = "NG_filmic07", label = "Filmic 7"},
        {filter = "NG_filmic08", label = "Filmic 8"},
        {filter = "NG_filmic09", label = "Filmic 9"},
        {filter = "NG_filmic11", label = "Filmic 11"},
        {filter = "NG_filmic13", label = "Filmic 13"},
        {filter = "NG_filmic14", label = "Filmic 14"},
        {filter = "NG_filmic15", label = "Filmic 15"},
        {filter = "NG_filmic16", label = "Filmic 16"},
        {filter = "NG_filmic17", label = "Filmic 17"},
        {filter = "NG_filmic19", label = "Filmic 19"},
        {filter = "NG_filmic20", label = "Filmic 20"},
        {filter = "NG_filmic23", label = "Filmic 23"},
        {filter = "NG_filmic24", label = "Filmic 24"},
        {filter = "NG_filmic25", label = "Filmic 25"}
    }
}