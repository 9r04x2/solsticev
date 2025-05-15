Config = {
    splitTop = 0,
    disableKeybind = true,
    defaultKey = 'k',
    command = 'kiyafet',
    commandHelpText = 'Kıyafet Menüsü',

    useCamera = true,
    useBlur = true,
    allowInVehicle = false,
    showProps = true,
    hairCommand = false,
}

local linkedFemale = math.random(0,11)

clothingSettings = {
    pants = {
        command = 'pantolon',
        helpCommand = 'Pantolonu çıkar/tak',
        animation = {animDict = 'rcmextreme3', animName = 'idle', flag = 1, duration = 1000},
        models = {
            [`mp_m_freemode_01`] = {
                [4] = {drawableId = 61, textureId = math.random(0,13)},
            },
            [`mp_f_freemode_01`] = {
                [4] = {drawableId = 17, textureId = linkedFemale},
            },  
        }
    },
    shirt = {
        command = 'gomlek',
        helpCommand = 'Gömleği çıkar/tak',
        animation = {animDict = 'missmic4', animName = 'michael_tux_fidget', flag = 16, duration = 1000},
        models = {
            [`mp_m_freemode_01`] = {
                [3] = {drawableId = 15, textureId = 0},
                [8] = {drawableId = 15, textureId = 0},
            },
            [`mp_f_freemode_01`] = {
                [3] = {drawableId = 15, textureId = 0},
                [8] = {drawableId = 14, textureId = 0},
            },  
        }
    },
    jacket = {
        command = 'ceket',
        helpCommand = 'Ceketi çıkar/tak',
        animation = {animDict = 'missmic4', animName = 'michael_tux_fidget', flag = 16, duration = 1000},
        models = {
            [`mp_m_freemode_01`] = {
                [11] = {drawableId = 15, textureId = 0},
            },
            [`mp_f_freemode_01`] = {
                [11] = {drawableId = 18, textureId = linkedFemale},
            },  
        }
    },
    shoes = {
        command = 'ayakkabi',
        helpCommand = 'Ayakkabıyı çıkar/tak',
        animation = {animDict = 'random@domestic', animName = 'pickup_low', flag = 16, duration = 1000},
        models = {
            [`mp_m_freemode_01`] = {
                [6] = {drawableId = 34, textureId = 0},
            },
            [`mp_f_freemode_01`] = {
                [6] = {drawableId = 35, textureId = 0},
            },  
        }
    },
    bag = {
        command = 'canta',
        helpCommand = 'Çantayı çıkar/tak',
        animation = {animDict = 'missmic4', animName = 'michael_tux_fidget', flag = 16, duration = 1000},
        models = {
            [`mp_m_freemode_01`] = {
                [5] = {drawableId = 0, textureId = 0},
            },
            [`mp_f_freemode_01`] = {
                [5] = {drawableId = 0, textureId = 0},
            },  
        }
    },
    vest = {
        command = 'yelek',
        helpCommand = 'Yeleği çıkar/tak',
        animation = {animDict = 'missmic4', animName = 'michael_tux_fidget', flag = 16, duration = 1000},
        models = {
            [`mp_m_freemode_01`] = {
                [9] = {drawableId = 0, textureId = 0},
            },
            [`mp_f_freemode_01`] = {
                [9] = {drawableId = 0, textureId = 0},
            },  
        }
    },
    mask = {
        command = 'maske',
        helpCommand = 'Maskeyi çıkar/tak',
        animation = {animDict = 'missminuteman_1ig_2', animName = 'tasered_2', flag = 16, duration = 1000},
        models = {
            [`mp_m_freemode_01`] = {
                [1] = {drawableId = 0, textureId = 0},
            },
            [`mp_f_freemode_01`] = {
                [1] = {drawableId = 0, textureId = 0},
            },  
        }
    },
    necklace = {
        command = 'kolye',
        helpCommand = 'Kolyeyi çıkar/tak',
        animation = {animDict = 'clothingtie', animName = 'try_tie_positive_a', flag = 16, duration = 1000},
        models = {
            [`mp_m_freemode_01`] = {
                [7] = {drawableId = 0, textureId = 0},
            },
            [`mp_f_freemode_01`] = {
                [7] = {drawableId = 0, textureId = 0},
            },  
        }
    },
    hat = {
        command = 'sapka',
        helpCommand = 'Şapkayı çıkar/tak',
        animation = {animDict = 'missminuteman_1ig_2', animName = 'tasered_2', flag = 16, duration = 1000},
        propIndex = 0,
    },
    glasses = {
        command = 'gozluk',
        helpCommand = 'Gözlüğü çıkar/tak',
        animation = {animDict = 'missminuteman_1ig_2', animName = 'tasered_2', flag = 16, duration = 1000},
        propIndex = 1,
    },
    ear = {
        command = 'kupe',
        helpCommand = 'Küpeleri çıkar/tak',
        animation = {animDict = 'missminuteman_1ig_2', animName = 'tasered_2', flag = 16, duration = 1000},
        propIndex = 2,
    },
    watch = {
        command = 'saat',
        helpCommand = 'Saati çıkar/tak',
        animation = {animDict = 'missmic4', animName = 'michael_tux_fidget', flag = 16, duration = 750},
        propIndex = 6,
    },
    bracelet = {
        command = 'bileklik',
        helpCommand = 'Bilekliği çıkar/tak',
        animation = {animDict = 'missmic4', animName = 'michael_tux_fidget', flag = 16, duration = 750},
        propIndex = 7,
    },
    hair = {
        command = 'sac',
        helpCommand = 'Saç [id] ile saç stilini değiştir',
        animation = {animDict = 'missminuteman_1ig_2', animName = 'tasered_2', flag = 16, duration = 1000},
    },
}
