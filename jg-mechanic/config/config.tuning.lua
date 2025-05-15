-----------------------------------------------------------------------------------------------------------
-------------------------------------------- VEHICLE TUNING -----------------------------------------------
-----------------------------------------------------------------------------------------------------------
--
-- Here you can create, edit and remove various tuning parts. The changes they make to the handling is all
-- in here, so feel free to modify as you wish. PLEASE bear in mind that if 2 different tuning options
-- modify the same handling values, and are set to overwrite, they could overwrite each other unpredictably
-- Either set the values to NOT overwrite, or make sure that different tuning parts modify unique parts of
-- the handling to prevent undesired results. 
--
-- Here is a guide on what different options mean to help you customise your tuning parts.
--
-----------------------------------------------------------------------------------------------------------
--  name                      The name of the modification that will be shown in the tablet.
-----------------------------------------------------------------------------------------------------------
--  info                      Optional, but you can provide additional info that will show in the UI when
--                            clicking the info icon when they are selecting an upgrade. It could be used 
--                            to warn mechanics of vehicles an upgrade shouldn't be applied on, or results
--                            from your testing of handling values.
-----------------------------------------------------------------------------------------------------------
--  itemName                  For mechanics set up to use an item for upgrades, this is the name of the
--                            required item.
-----------------------------------------------------------------------------------------------------------
--  price                     For mechanics set up to purchase upgrades, this will be the cost to the
--                            mechanic to apply the upgrade.
-----------------------------------------------------------------------------------------------------------
--  audioNameHash             Any in-game vehicle name, or addon sound pack name (ENGINE SWAPS ONLY!)
-----------------------------------------------------------------------------------------------------------
--  handling                  Add/remove handling attributes & values.
--                            More help & info on handling values: https://gtamods.com/wiki/Handling.meta
-----------------------------------------------------------------------------------------------------------
--  handlingApplyOrder        The order in which this tuning option should be applied. This is useful when
--                            tuning options have overlapping handling values! Provide a priority number,
--                            and the lowest numbers will be applied first.
-----------------------------------------------------------------------------------------------------------
--  handlingOverwritesValues  Whether the handling values provided should overwrite the vehicle's existing
--                            values, or whether they should modify the vehicle's existing values. This
--                            also works for negative values too.
--                           
--                            For example: a vehicle's current fDriveInertia value is at 1.0
--                               true  = a value of 0.5 sets fDriveInertia to 0.5
--                               false = a value of 0.5 will mean [1.0 + 0.5] and set fDriveInertia to 1.5
-----------------------------------------------------------------------------------------------------------
-- restricted (optional)      Can either be false (unrestricted) "electric" or "combustion"
-----------------------------------------------------------------------------------------------------------
-- blacklist                  List of archetype names (spawn codes) that cannot use this modification
-----------------------------------------------------------------------------------------------------------
-- minGameBuild               Functionality restricted to a certain game build, such as manual gearboxes
-----------------------------------------------------------------------------------------------------------

Config.Tuning = {
  --
  -- ENGINE SWAPS
  -- You can customise, or add new engine swap options here.
  --
  engineSwaps = {
    [1] = {
      name = "2JZ GTE Supra",
      icon = "engine.svg",
      info = false,
      itemName = "engine",
      price = 1000000,
      audioNameHash = "aq2jzgterace",
      handlingOverwritesValues = false,
      handlingApplyOrder = 1,
      handling = {
        fInitialDriveForce = 0.02,
        fInitialDriveMaxFlatVel = 14.0
      },
      restricted = "combustion",
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [2] = {
      name = "RB28DETT R34",
      icon = "engine.svg",
      info = false,
      itemName = "engine",
      price = 1000000,
      audioNameHash = "rb28dett",
      handlingOverwritesValues = false,
      handlingApplyOrder = 1,
      handling = {
        fInitialDriveForce = 0.02,
        fInitialDriveMaxFlatVel = 14.0
      },
      restricted = "combustion",
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [3] = {
      name = "69' Mustang V8",
      icon = "engine.svg",
      info = false,
      itemName = "engine",
      price = 1000000,
      audioNameHash = "ta008mustang69",
      handlingOverwritesValues = false,
      handlingApplyOrder = 1,
      handling = {
        fInitialDriveForce = 0.02,
        fInitialDriveMaxFlatVel = 14.0
      },
      restricted = "combustion",
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [4] = {
      name = "13B Rotary RX7",
      icon = "engine.svg",
      info = false,
      itemName = "engine",
      price = 1000000,
      audioNameHash = "rotary7",
      handlingOverwritesValues = false,
      handlingApplyOrder = 1,
      handling = {
        fInitialDriveForce = 0.02,
        fInitialDriveMaxFlatVel = 14.0
      },
      restricted = "combustion",
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [5] = {
      name = "CA18 200sx",
      icon = "engine.svg",
      info = false,
      itemName = "engine",
      price = 1000000,
      audioNameHash = "a80ffeng",
      handlingOverwritesValues = false,
      handlingApplyOrder = 1,
      handling = {
        fInitialDriveForce = 0.02,
        fInitialDriveMaxFlatVel = 14.0
      },
      restricted = "combustion",
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [6] = {
      name = "VR38DETT R35",
      icon = "engine.svg",
      info = false,
      itemName = "engine",
      price = 1000000,
      audioNameHash = "aq10nisvr38dett",
      handlingOverwritesValues = false,
      handlingApplyOrder = 1,
      handling = {
        fInitialDriveForce = 0.02,
        fInitialDriveMaxFlatVel = 14.0
      },
      restricted = "combustion",
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [7] = {
      name = "D170 Supercharged",
      icon = "engine.svg",
      info = false,
      itemName = "engine",
      price = 1000000,
      audioNameHash = "lg81hcredeye",
      handlingOverwritesValues = false,
      handlingApplyOrder = 1,
      handling = {
        fInitialDriveForce = 0.02,
        fInitialDriveMaxFlatVel = 14.0
      },
      restricted = "combustion",
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [8] = {
      name = "P60B40 M3 GTR",
      icon = "engine.svg",
      info = false,
      itemName = "engine",
      price = 1000000,
      audioNameHash = "kc31m3gtr",
      handlingOverwritesValues = false,
      handlingApplyOrder = 1,
      handling = {
        fInitialDriveForce = 0.02,
        fInitialDriveMaxFlatVel = 14.0
      },
      restricted = "combustion",
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [9] = {
      name = "S55B30 M4 GTS",
      icon = "engine.svg",
      info = false,
      itemName = "engine",
      price = 1000000,
      audioNameHash = "ta122s58",
      handlingOverwritesValues = false,
      handlingApplyOrder = 1,
      handling = {
        fInitialDriveForce = 0.02,
        fInitialDriveMaxFlatVel = 14.0
      },
      restricted = "combustion",
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [10] = {
      name = "Audi RS6",
      icon = "engine.svg",
      info = false,
      itemName = "engine",
      price = 1000000,
      audioNameHash = "ea825",
      handlingOverwritesValues = false,
      handlingApplyOrder = 1,
      handling = {
        fInitialDriveForce = 0.02,
        fInitialDriveMaxFlatVel = 14.0
      },
      restricted = "combustion",
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [11] = {
      name = "VQ35DE 350z",
      icon = "engine.svg",
      info = false,
      itemName = "engine",
      price = 1000000,
      audioNameHash = "ta013vq35",
      handlingOverwritesValues = false,
      handlingApplyOrder = 1,
      handling = {
        fInitialDriveForce = 0.02,
        fInitialDriveMaxFlatVel = 14.0
      },
      restricted = "combustion",
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [12] = {
      name = "LP 670 Lamborghini",
      icon = "engine.svg",
      info = false,
      itemName = "engine",
      price = 1000000,
      audioNameHash = "lg123murcisp",
      handlingOverwritesValues = false,
      handlingApplyOrder = 1,
      handling = {
        fInitialDriveForce = 0.02,
        fInitialDriveMaxFlatVel = 14.0
      },
      restricted = "combustion",
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [13] = {
      name = "4G63 EVO 9",
      icon = "engine.svg",
      info = false,
      itemName = "engine",
      price = 1000000,
      audioNameHash = "aq57mit4g63t",
      handlingOverwritesValues = false,
      handlingApplyOrder = 1,
      handling = {
        fInitialDriveForce = 0.02,
        fInitialDriveMaxFlatVel = 14.0
      },
      restricted = "combustion",
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [14] = {
      name = "4B11T Evo X",
      icon = "engine.svg",
      info = false,
      itemName = "engine",
      price = 1000000,
      audioNameHash = "evorllyeng",
      handlingOverwritesValues = false,
      handlingApplyOrder = 1,
      handling = {
        fInitialDriveForce = 0.02,
        fInitialDriveMaxFlatVel = 14.0
      },
      restricted = "combustion",
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [15] = {
      name = "RB26DETT R33-R34",
      icon = "engine.svg",
      info = false,
      itemName = "engine",
      price = 1000000,
      audioNameHash = "ELEGYZ2",
      handlingOverwritesValues = false,
      handlingApplyOrder = 1,
      handling = {
        fInitialDriveForce = 0.02,
        fInitialDriveMaxFlatVel = 14.0
      },
      restricted = "combustion",
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    }
  },

  --
  -- TYRES
  -- You can customise, or add new tyre options here.
  --
  tyres = {
    [1] = {
      name = "Slicks",
      icon = "wheels/offroad.svg",
      info = false,
      itemName = "slick_tyres",
      price = 500000,
      handlingOverwritesValues = true,
      handlingApplyOrder = 2,
      handling = {
        fTractionCurveMin = 3.0,
        fTractionCurveMax = 3.2,
        fSteeringLock = 39.0
      },
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [2] = {
      name = "Semi-slicks",
      icon = "wheels/offroad.svg",
      info = false,
      itemName = "semi_slick_tyres",
      price = 300000,
      handlingOverwritesValues = true,
      handlingApplyOrder = 2,
      handling = {
        fTractionCurveMin = 2.4,
        fTractionCurveMax = 2.6
      },
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [3] = {
      name = "Offroad",
      icon = "wheels/offroad.svg",
      info = false,
      itemName = "offroad_tyres",
      price = 300000,
      handlingOverwritesValues = true,
      handlingApplyOrder = 2,
      handling = {
        fTractionLossMult = 0.0
      },
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    }
  },

  --
  -- BRAKES
  -- You can customise, or add new tyre options here.
  --
  brakes = {
    [1] = {
      name = "Ceramic",
      icon = "brakes.svg",
      info = false,
      itemName = "ceramic_brakes",
      price = 500000,
      handlingOverwritesValues = true,
      handlingApplyOrder = 3,
      handling = {
        fBrakeForce = 1.5
      },
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    }
  },

  --
  -- DRIVETRAINS
  -- You can customise, or add new drivetain options here.
  --
  drivetrains = {
    [1] = {
      name = "AWD",
      icon = "drivetrain.svg",
      info = false,
      itemName = "awd_drivetrain",
      price = 750000,
      handlingOverwritesValues = true,
      handlingApplyOrder = 4,
      handling = {
        fDriveBiasFront = 0.5
      },
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [2] = {
      name = "RWD",
      icon = "drivetrain.svg",
      info = false,
      itemName = "rwd_drivetrain",
      price = 200000,
      handlingOverwritesValues = true,
      handlingApplyOrder = 4,
      handling = {
        fDriveBiasFront = 0.0
      },
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    },
    [3] = {
      name = "FWD",
      icon = "drivetrain.svg",
      info = false,
      itemName = "fwd_drivetrain",
      price = 500000,
      handlingOverwritesValues = true,
      handlingApplyOrder = 4,
      handling = {
        fDriveBiasFront = 1.0
      },
      blacklist = {"npolvic", "npoltaurus", "npoltahoe", "centurionfib", "npoldurango", "lapd_motor", "npolblazer", "npolcoach", "npolmm", "PD23Suburban", "tolptan", "npoltransport", "flcharger", "emsexp", "flspeedo", "npolexp", "npolchar", "npolchal", "npolraptor", "npolstang", "ap2", "amgh", "cls63s", "golf8", "599", "fl812", "rmodr8c", "dk350z", "16m3f80", "23touring", "bmwg07", "charger21", "evo9", "e60", "fl918s", "flclass", "cle63s", "flevo", "fltrx", "gt86", "hurevos", "m3g80", "mercedessl63", "mustang19", "pista", "rmodamggt", "rmodmi8lb", "rmodpanamera2", "rmods63", "rs615", "sf90", "skyline", "tacoma24", "thebugpfl" ,"x5bmw", "22m5", "675ltsp", "911brabusr", "c63spd", "f8spider", "f82", "fle46", "flram", "flrs7", "gt3hycade", "gtr", "m4comp", "m5g60", "nissantitan17", "rmod911gt3", "rmodg63", "rmodg900", "rmodgt63", "rmodm4gts", "rmodx61", "senna", "toysupmk4", "urus", "bmw8mm", "bmwm8pd", "fl488", "fllambo", "flm3", "gcbx5", "m3bxane", "mi8", "rmodm8c", "adrom4", "flbentley", "flgtz35", "rs6abtp", "gtrsillb", "gtz34", "mkcr33", "protoz", "rmodz350pandem", "rrx7hycade", "topfoil"} -- Example of the blacklist feature - feel free to remove this (it couldn't fit a v12 though man, come on)    }
    }
  },

  --
  -- TURBOCHARGING
  -- Note: This category is unique as it just enables/disables mod 18 (the standard GTA turbocharging option)
  -- You can't add additional turbocharging options, you can only adjust/remove the existing one.
  -- You can't add any handling changes. Make new items/other categories for that.
  --
   turbocharging = {
    [1] = {
      name = "Turbocharging",
      icon = "turbo.svg",
      info = false,
      itemName = "turbocharger",
      price = 300000,
      restricted = "combustion",
    }
  },

  --
  -- DRIFT TUNING
  -- You can't add additional drift tuning options, you can only adjust/remove the existing one.
  --
  driftTuning = {
    [1] = {
      name = "Drift Tuning",
      icon = "wheels/tuner.svg",
      info = false,
      itemName = "drift_tuning_kit",
      price = 3000000,
      handlingOverwritesValues = true,
      handlingApplyOrder = 5,
      handling = {
        fInitialDragCoeff = 12.22,
        fInitialDriveForce = 2.0,
        fInitialDriveMaxFlatVel = 145.0,
        fSteeringLock = 58.0,
        fTractionCurveMax = 0.6,
        fTractionCurveMin = 1.3,
        fTractionCurveLateral = 21.0,
        fLowSpeedTractionLossMult = 0.5,
       fTractionBiasFront = 0.49
      },
    }
  },

  -- 
  -- GEARBOX (b3095 or newer)
  -- This is a unique category that updates flags, via the boolean 'manualGearbox' option.
  -- This allows you to toggle manual gearing, where the player must change gears themselves.
  -- Learn more: https://docs.jgscripts.com/mechanic/manual-transmissions-and-smooth-first-gear
  -- 
  gearboxes = {
    [1] = {
      name = "Manual Gearbox",
      icon = "transmission.svg",
      info = false,
      itemName = "manual_gearbox",
      price = 10000,
      manualGearbox = true,
      restricted = "combustion",
      minGameBuild = 3095
    }
  }

  --
  -- EXAMPLE CUSTOM NEW CATEGORY
  -- 
  -- ["Transmissions"] = {
  --   [1] = {
  --     name = "8 speed transmission",
  --     icon = "transmission.svg",
  --     info = "Testing making a new category",
  --     itemName = "transmission",
  --     price = 1000,
  --     handlingOverwritesValues = true,
  --     handling = {
  --       nInitialDriveGears = 8
  --     },
  --     restricted = false,
  --   }
  -- }
  --
  -- -- IMPORTANT NOTE --
  -- inside of the config.lua, inside of a mechanic location's "tuning" section, you will need to add an
  -- additional line in order for it to show & be enabled in the tablet 
  --
  -- ["Transmissions"] = { enabled = true, requiresItem = false },
}