Config = {}

Config.DrugImmunity = 100 -- how much the player can withstand the drug acting at the same time (drugStrength)

Config.UsableDrugs = {
    ["joint"] = {
        label = "Marijuana",
        animation = 'smoke', -- (smoke/syringe/sniff/pill)
        drugStrength = 30, -- this amount is being removed from immunity of player for effect duration time
        healthEffects = {
             armour = 25,
             health = 10
        },
        addiction = {
            chance = 100, -- 0-100%
            time = 75 -- time until drug wears out and you need other dose (in minutes)
        },
        effect = {
            duration = 80, -- in seconds
            screenFX = "DefaultFlash",
            speedMultiplier = 0.5, -- from 1.0 to 1.49
            walkingStyle = "MOVE_M@DRUNK@SLIGHTLYDRUNK",
            cameraShakeIntensity = 0.5,
        }
    },
    ["packed_meth"] = {
        label = "Meth",
        animation = 'syringe', -- (smoke/syringe/sniff/pill)
        drugStrength = 30, -- this amount is being removed from immunity of player for effect duration time
        healthEffects = {
             armour = 25,
             health = 10
        },
        addiction = {
            chance = 100, -- 0-100%
            time = 75 -- time until drug wears out and you need other dose (in minutes)
        },
        effect = {
            duration = 80, -- in seconds
            screenFX = "DefaultFlash",
            speedMultiplier = 0.5, -- from 1.0 to 1.49
            walkingStyle = "MOVE_M@DRUNK@SLIGHTLYDRUNK",
            cameraShakeIntensity = 0.5,
        }
    },

    ["packed_weed"] = {
        label = "Weed",
        animation = 'smoke', -- (smoke/syringe/sniff/pill)
        drugStrength = 30, -- this amount is being removed from immunity of player for effect duration time
        healthEffects = {
             armour = 25,
             health = 10
        },
        addiction = {
            chance = 100, -- 0-100%
            time = 75 -- time until drug wears out and you need other dose (in minutes)
        },
        effect = {
            duration = 80, -- in seconds
            screenFX = "DefaultFlash",
            speedMultiplier = 0.5, -- from 1.0 to 1.49
            walkingStyle = "MOVE_M@DRUNK@SLIGHTLYDRUNK",
            cameraShakeIntensity = 0.5,
        }
    },
 
    ["packed_coke"] = {
        label = "Koko",
        animation = 'syringe', -- (smoke/syringe/sniff/pill)
        drugStrength = 30, -- this amount is being removed from immunity of player for effect duration time
        healthEffects = {
             armour = 25,
             health = 10
        },
        addiction = {
            chance = 100, -- 0-100%
            time = 75 -- time until drug wears out and you need other dose (in minutes)
        },
        effect = {
            duration = 80, -- in seconds
            screenFX = "DefaultFlash",
            speedMultiplier = 0.5, -- from 1.0 to 1.49
            walkingStyle = "MOVE_M@DRUNK@SLIGHTLYDRUNK",
            cameraShakeIntensity = 0.5,
        }
    },
}

Config.Medication = {
    -- ["marijuana_cure"] = {'marijuana'},
    ["universal_cure"] = {'joint','packed_coke','packed_weed','packed_meth'},
}

Config.Translations = {
    notification_header = "Dikkat",
    overdose_text = "Şu anda",
    overdose_highlighted_text = "Aşırı Dozda",
    overdose_description = "Vücudunuz aldığınız ilaç miktarıyla başa çıkamadı...",
    addiction_text = "Şu anda",
    addiction_description = "İlacın vücuttaki miktarı azaldıkça, kendinizi kötü hissedeceksiniz; bağımlılıktan kurtulmak için doğru türde bir tedavi almanız gerekiyor.",    
}