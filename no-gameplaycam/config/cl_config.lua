-- https://none-fivem.gitbook.io/nonem/resources/no-gameplaycam/configuration

Config = {
    EnableHelpKeyPrompt = false, -- Enable help key prompt
    UseHiDof = true, -- Removes blur from zoom
    EaseDuration = 1000, -- Cam swap duration in ms
    InteriorControl = true, -- Controls is cam in the same interior with ped
    PedControl = false, -- Controls is player visible on the screen
    MaxDistance = 10.0, -- Maximum distance between player ped and camera
    MaxWarning = 5, -- Maximum warning count(Every sec)
    TransitionSpeed = {.025, .1}, -- Minimum - maximum transition speed
    RotateSpeed = {.25, 1.0}, -- Minimum - maximum rotation speed
    ZoomSpeed = {2.5, 10.0}, -- Minimum - maximum zoom speed
    MaxRotateAngle = 45.0, -- Maximum U/D rotation angle (0.0 - 90.0)
    WarningSound = { -- https://gist.github.com/Sainan/021bd2f48f1c68d3eb002caab635b5a4
        Name = "NO",
        Ref = "HUD_FRONTEND_DEFAULT_SOUNDSET"
    },
    Keys = { -- Default keys for mapping. https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
        HELP_PROMPT = "H"
    },
    Controls = { -- https://docs.fivem.net/docs/game-references/controls/
        FORWARD = {index = 32, label = "W"},
        BACKWARD = {index = 33, label = "S"},
        LEFT = {index = 34, label = "A"},
        RIGHT = {index = 35, label = "D"},
        UP = {index = 140, label = "R"},
        DOWN = {index = 23, label = "F"},
        ROTATE_LEFT = {index = 38, label = "E"},
        ROTATE_RIGHT = {index = 44, label = "Q"},
        ROTATE_RESET = {index = 22, label = "SPACE"},
        SPEED_UP = {index = 21, label = "SHIFT"},
        ZOOM_IN = {index = 17, label = "SCROLL UP"},
        ZOOM_OUT = {index = 16, label = "SCROLL DOWN"}
    }
}
