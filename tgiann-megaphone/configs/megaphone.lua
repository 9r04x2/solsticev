config.megaphone = {}
config.megaphone.dist = 30              -- Maximum distance at which the player's voice can be heard
config.megaphone.itemName = "megaphone" -- Item name
config.megaphone.disable3D = false      -- When true, the player's voice sounds like they are right next to you, but this time you can adjust the volume
config.megaphone.diable3DVolume = 10.0  -- Works when disable3D is true
config.megaphone.vehicle = {
    key = "B",                          -- https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    class = { 18, 19 },                 -- https://docs.fivem.net/natives/?_0x29439776AAA00A62
    model = { `taxi`, }                 -- Vehicle Model name
}

config.megaphone.anim = { -- Megaphone item animation
    animDict = "combat@aim_variations@1h@gang",
    animName = "aim_variation_d"
}

--If you don’t know what it is, don’t modify anything beyond this point.
config.megaphone.filterName = "tmegaphone"
config.megaphone.filters = {
    { name = `freq_low`,    value = 0.0 },
    { name = `freq_hi`,     value = 10000.0 },
    { name = `rm_mod_freq`, value = 50.0 },
    { name = `rm_mix`,      value = 0.15 },
    { name = `fudge`,       value = 0.0 },
    { name = `o_freq_lo`,   value = 150.0 },
    { name = `o_freq_hi`,   value = 5000.0 },
}
