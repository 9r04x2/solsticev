config.microphone = {}
config.microphone.itemName = "microphone" -- Name of the microphone item
config.microphone.itemDist = 8            -- Maximum distance at which the player's voice can be heard (For Item)

if IsDuplicityVersion() then return end   -- if server return

config.microphone.disable3D = false       -- When true, the player's voice sounds like they are right next to you, but this time you can adjust the volume
config.microphone.diable3DVolume = 8.0    -- Works when disable3D is true
config.microphone.location = {
    {
        microphoneCoords = vec4(-551.8740, 284.2366, 82.9768, 90.6532), -- Microphone prop location (X, Y, Z, HEADING)
        pressDist = 2,                                                  -- Microphone on/off press distance
        voiceDetectLocation = PolyZone:Create({                         -- Zone where the sound will have effects
            vector2(-552.05828857422, 288.53967285156),
            vector2(-552.72467041016, 280.97360229492),
            vector2(-549.9306640625, 280.37149047852),
            vector2(-549.10266113281, 287.87759399414)
        }, {
            name = "mic1",
            minZ = 81.976676940918,
            maxZ = 83.98063659668
        }),
        voiceDist = 15, -- Maximum distance at which the player's voice can be heard
    },
    -- Example With microphone prop
    {
        microphoneCoords = vec4(683.0647, 568.5448, 130.4613, 343.7143), -- Microphone prop location (X, Y, Z, HEADING)
        model = `v_ilev_fos_mic`,                                        -- Microphone prop nodel (if this value is nil the prop will not spawn)
        pressDist = 2,                                                   -- Microphone on/off press distance
        voiceDetectLocation = PolyZone:Create({                          -- Zone where the sound will have effects
            vector2(682.44860839844, 567.98010253906),
            vector2(685.70739746094, 567.44165039062),
            vector2(688.75897216797, 569.16760253906),
            vector2(697.73889160156, 566.22259521484),
            vector2(697.66491699219, 576.57434082031),
            vector2(675.63049316406, 584.82623291016),
            vector2(671.69836425781, 576.21820068359),
            vector2(678.07025146484, 573.41131591797),
            vector2(679.79010009766, 570.21728515625)
        }, {
            name = "mic2",
            minZ = 129.46130371094,
            maxZ = 132.46153259277
        }),
        voiceDist = 40, -- Maximum distance at which the player's voice can be heard
    }
}

--If you don’t know what it is, don’t modify anything beyond this point.
config.microphone.filterName = "tmicrophone"
config.microphone.filters = {
    { name = `freq_low`,    value = 0.0 },
    { name = `freq_hi`,     value = 10000.0 },
    { name = `rm_mod_freq`, value = 10.0 },
    { name = `rm_mix`,      value = 0.05 },
    { name = `fudge`,       value = 0.0 },
    { name = `o_freq_lo`,   value = 150.0 },
    { name = `o_freq_hi`,   value = 5000.0 },
}
