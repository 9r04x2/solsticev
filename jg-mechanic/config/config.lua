Config = {}

-- Integrations (recommended to leave as "auto")
Config.Framework = "QBCore" -- or "QBCore", "Qbox", "ESX"
Config.Inventory = "ox_inventory" -- or "ox_inventory", "qb-inventory", "esx_inventory", "codem-inventory", "qs-inventory"
Config.Notifications = "ox_lib" -- or "default", "ox_lib", "ps-ui", "okokNotify", "nox_notify"
Config.ProgressBar = "ox-circle" -- or "ox-circle", "ox-bar", "qb"
Config.SkillCheck = "ox" -- or "ox", "qb"
Config.DrawText = "qb" -- or "jg-textui", "ox_lib", "okokTextUI", "ps-ui", "qb"
Config.SocietyBanking = "qb-management" -- or "okokBanking", "fd_banking", "Renewed-Banking", "tgg-banking", "qb-banking", "qb-management", "esx_addonaccount"

-- Localisation
Config.Locale = "en"
Config.NumberAndDateFormat = "en-US"
Config.Currency = "USD"

-- Set to false to use built-in job system
Config.UseFrameworkJobs = true

-- Mechanic Tablet
Config.UseTabletCommand = "tablet" -- set to false to disable command
Config.TabletConnectionMaxDistance = 4.0

-- Shops
Config.Target = "ox_target" -- (shops/stashes only) "qb-target" or "ox_target"
Config.UseSocietyFund = true -- set to false to use player balance
Config.PlayerBalance = "bank" -- or "bank" or "cash"

-- Skill Bars
Config.UseSkillbars = false -- set to false to use progress bars instead of skill bars for installations
Config.ProgressBarDuration = 5000 -- if not using skill bars, this is the progress bar duration in ms (10000 = 10 seconds)
Config.MaximumSkillCheckAttempts = 3 -- How many times the player can attempt a skill check before the skill check fails
Config.SkillCheckDifficulty = { "easy", "easy", "easy", "easy", "easy" } -- for ox only
Config.SkillCheckInputs = { "w", "a", "s", "d" } -- for ox only

-- Servicing
Config.EnableVehicleServicing = false
Config.ServiceRequiredThreshold = 20 -- [%] if any of the servicable parts hit this %, it will flag that the vehicle needs servicing 
Config.ServicingBlacklist = {
  "police", "police2" -- Vehicles that are excluded from servicing damage
}

-- Nitrous
Config.NitrousScreenEffects = true
Config.NitrousRearLightTrails = false -- Only really visible at night
Config.NitrousPowerIncreaseMult = 1.2
Config.NitrousDefaultKeyMapping = "RMENU"
Config.NitrousMaxBottlesPerVehicle = 2 -- The UI can't really handle more than 7, more than that would be unrealistic anyway
Config.NitrousBottleDuration = 15 -- [in seconds] How long a nitrous tank lasts
Config.NitrousBottleCooldown = 30 -- [in seconds] How long until player can start using the next bottle
Config.NitrousPurgeDrainRate = 0.1 -- purging drains bottle only 10% as fast as actually boosting - set to 1 to drain at the same rate 

-- Stancing
Config.StanceMinSuspensionHeight = -0.3
Config.StanceMaxSuspensionHeight = 0.3
Config.StanceMinCamber = 0.0
Config.StanceMaxCamber = 0.5
Config.StanceMinTrackWidth = 0.5
Config.StanceMaxTrackWidth = 1.25
Config.StanceNearbyVehiclesFreqMs = 500

-- Repairs
Config.AllowFixingAtOwnedMechanicsIfNoOneOnDuty = false
Config.DuctTapeMinimumEngineHealth = 100.0
Config.DuctTapeEngineHealthIncrease = 150.0

-- Tuning
Config.TuningGiveInstalledItemBackOnRemoval = false

-- Locations
Config.UseCarLiftPrompt = "[E] Lifti Kullan"
Config.UseCarLiftKey = 38
Config.CustomiseVehiclePrompt = "[E] Mekanik"
Config.CustomiseVehicleKey = 38

-- Update vehicle props whenever they are changed [probably should not touch]
-- You can set to false to leave saving any usual props vehicle changes such as
-- GTA performance, cosmetic, colours, wheels, etc to the garage or other scripts
-- that persist the props data to the database. Additional data from this script,
-- such as engine swaps, servicing etc is not affected as it's saved differently
Config.UpdatePropsOnChange = true

-- Stops vehicles from immediately going to redline, for a slightly more realistic feel and
-- reduced liklihood of wheelspin. Can make vehicle launch (slightly) slower.
-- No effect on electric vehicles!
-- May not work immediately for all vehicles; see: https://docs.jgscripts.com/mechanic/manual-transmissions-and-smooth-first-gear#smooth-first-gear
Config.SmoothFirstGear = false

-- If using a manual gearbox, show a notification with key binds when high RPMs 
-- have been detected for too long
Config.ManualHighRPMNotifications = false

-- Misc
Config.UniqueBlips = true
Config.ModsPricesAsPercentageOfVehicleValue = true -- Enable pricing tuning items as % of vehicle value - it tries jg-dealerships, then QBShared, then the vehicles meta file automagically for pricing data
Config.AdminsHaveEmployeePermissions = false -- admins can use tablet & interact with mechanics like an owner
Config.MechanicEmployeesCanSelfServiceMods = false -- set to true to allow mechanic employees to bypass the "place order" system at their own mechanic
Config.FullRepairAdminCommand = "vfix"
Config.MechanicAdminCommand = "mechanicadmin"
Config.ChangePlateDuringPreview = false
Config.RequireManagementForOrderDeletion = false 
Config.UseCustomNamesInTuningMenu = true

-- Mechanic Locations
Config.MechanicLocations = {
  lscustoms = {
    type               = "owned",
    job                = "mechanic_lscustom",
    jobManagementRanks = {4},
    logo               = "ls_customs.png",
    commission         = 0,
    locations = {
      { coords = vector3(-333.67, -132.61, 39.34), size = 10.0, showBlip = false },
      { coords = vector3(-347.58, -157.76, 39.01), size = 10.0, showBlip = false },
      { coords = vector3(-339.3, -160.03, 39.01),  size = 10.0, showBlip = false },
      { coords = vector3(-321.59, -156.73, 39.34), size = 10.0, showBlip = false },
      { coords = vector3(-317.53, -144.67, 39.34), size = 10.0, showBlip = false },
      { coords = vector3(-313.62, -133.98, 39.34), size = 10.0, showBlip = false },
    },
    blip = { id = 446, color = 47, scale = 0.7 },
    mods = {
      repair           = { enabled = true, price = 250, percentVehVal = 0.00 },
      performance      = { enabled = true, price = 1000, percentVehVal = 0.03, priceMult = 0.2 },
      cosmetics        = { enabled = true, price = 500, percentVehVal = 0.02, priceMult = 0.1 },
      stance           = { disabled = false, price = 0, percentVehVal = 0.01 },
      respray          = { enabled = true, price = 1000, percentVehVal = 0.01 },
      wheels           = { enabled = true, price = 0, percentVehVal = 0.01 },
      neonLights       = { enabled = true, price = 0, percentVehVal = 0.01 },
      headlights       = { enabled = true, price = 0, percentVehVal = 0.01 },
      tyreSmoke        = { enabled = true, price = 0, percentVehVal = 0.01 },
      bulletproofTyres = { enabled = false, price = 0, percentVehVal = 0.02 },
      extras           = { enabled = true, price = 0, percentVehVal = 0.02 }
    },
    tuning = {
      engineSwaps   = { disabled = false, requiresItem = true },
      drivetrains   = { disabled = false, requiresItem = true },
      turbocharging = { disabled = false, requiresItem = true },
      tyres         = { disabled = false, requiresItem = true },
      brakes        = { disabled = false, requiresItem = true },
      driftTuning   = { disabled = false, requiresItem = true },
      gearboxes     = { disabled = false, requiresItem = true },
    },
    shops = {
      {
        name   = "Mekanik Malzemeleri",
        coords = vector3(-329.17, -163.16, 39.01),
        size   = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x=0.3, y=0.3, z=0.3 }, color = { r=255, g=255, b=255, a=120 }, bobUpAndDown=0, faceCamera=0, rotate=1, drawOnEnts=0 },
        items = {
          { name = "mechanic_tablet", label = "Mekanik Tablet", price = 1 },
          { name = "performance_part", label = "Performans Parçası", price = 1 },
          { name = "repair_kit", label = "Tamir Kiti", price = 1 },
          { name = "cleaning_kit", label = "Temizlik Kiti", price = 1 },
          { name = "extras_kit", label = "Ekstra Kiti", price = 1 },
          { name = "vehicle_wheels", label = "Araç Tekerlekleri", price = 1 },
          { name = "respray_kit", label = "Boya Kiti", price = 1 },
          { name = "cosmetic_part", label = "Kozmetik Parça", price = 1 },
          { name = "lighting_controller", label = "Aydınlatma Kontrolcüsü", price = 1 },
          { name = "tyre_smoke_kit", label = "Lastik Dumanı Kiti", price = 1 },
        },
      },
    },
    stashes = {
      {
        name   = "Mekanik Depo",
        coords = vector3(-349.52, -128.61, 39.12),
        size   = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x=0.3, y=0.3, z=0.3 }, color = { r=255, g=255, b=255, a=120 }, bobUpAndDown=0, faceCamera=0, rotate=1, drawOnEnts=0 },
        slots  = 70,
        weight = 700000,
      },
    },
  },
  bennys = {
    type               = "owned",
    job                = "mechanic_bennys",
    jobManagementRanks = {4},
    logo               = "bennys.png",
    commission         = 0,
    locations = {
      { coords = vector3(-214.33, -1334.18, 31.03), size = 10.0, showBlip = false },
      { coords = vector3(-208.81, -1335.51, 31.03), size = 10.0, showBlip = false },
      { coords = vector3(-221.93, -1335.65, 31.03), size = 10.0, showBlip = false },
      { coords = vector3(-201.87, -1319.14, 31.16), size = 10.0, showBlip = false },
      { coords = vector3(-220.98, -1319.06, 31.16), size = 10.0, showBlip = false },
    },
    blip = { id = 446, color = 47, scale = 0.7 },
    mods = {
      repair           = { enabled = true, price = 250, percentVehVal = 0.00 },
      performance      = { enabled = true, price = 1000, percentVehVal = 0.03, priceMult = 0.2 },
      cosmetics        = { enabled = true, price = 500, percentVehVal = 0.02, priceMult = 0.1 },
      stance           = { disabled = false, price = 0, percentVehVal = 0.01 },
      respray          = { enabled = true, price = 1000, percentVehVal = 0.01 },
      wheels           = { enabled = true, price = 0, percentVehVal = 0.01 },
      neonLights       = { enabled = true, price = 0, percentVehVal = 0.01 },
      headlights       = { enabled = true, price = 0, percentVehVal = 0.01 },
      tyreSmoke        = { enabled = true, price = 0, percentVehVal = 0.01 },
      bulletproofTyres = { enabled = false, price = 0, percentVehVal = 0.02 },
      extras           = { enabled = true, price = 0, percentVehVal = 0.02 }
    },
    tuning = {
      engineSwaps   = { disabled = false, requiresItem = true },
      drivetrains   = { disabled = false, requiresItem = true },
      turbocharging = { disabled = false, requiresItem = true },
      tyres         = { disabled = false, requiresItem = true },
      brakes        = { disabled = false, requiresItem = true },
      driftTuning   = { disabled = false, requiresItem = true },
      gearboxes     = { disabled = false, requiresItem = true },
    },
    shops = {
      {
        name   = "Mekanik Malzemeleri",
        coords = vector3(-206.57, -1335.69, 31.19),
        size   = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x=0.3, y=0.3, z=0.3 }, color = { r=255, g=255, b=255, a=120 }, bobUpAndDown=0, faceCamera=0, rotate=1, drawOnEnts=0 },
        items = {
          { name = "mechanic_tablet", label = "Mekanik Tablet", price = 1 },
          { name = "performance_part", label = "Performans Parçası", price = 1 },
          { name = "repair_kit", label = "Tamir Kiti", price = 1 },
          { name = "cleaning_kit", label = "Temizlik Kiti", price = 1 },
          { name = "extras_kit", label = "Ekstra Kiti", price = 1 },
          { name = "vehicle_wheels", label = "Araç Tekerlekleri", price = 1 },
          { name = "respray_kit", label = "Boya Kiti", price = 1 },
          { name = "cosmetic_part", label = "Kozmetik Parça", price = 1 },
          { name = "lighting_controller", label = "Aydınlatma Kontrolcüsü", price = 1 },
          { name = "tyre_smoke_kit", label = "Lastik Dumanı Kiti", price = 1 },
        },
      },
    },
    stashes = {
      {
        name   = "Mekanik Depo",
        coords = vector3(-228.56, -1319.83, 31.2),
        size   = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x=0.3, y=0.3, z=0.3 }, color = { r=255, g=255, b=255, a=120 }, bobUpAndDown=0, faceCamera=0, rotate=1, drawOnEnts=0 },
        slots  = 70,
        weight = 700000,
      },
    },
  },
  afterlife = {
    type               = "owned",
    job                = "afterlife",
    jobManagementRanks = {4},
    logo               = "bennys.png",
    commission         = 0,
    locations = {
      { coords = vector3(930.4052, -2510.4077, 27.9730), size = 10.0, showBlip = false },
      { coords = vector3(922.7907, -2509.5176, 27.9720), size = 10.0, showBlip = false },
      { coords = vector3(915.2522, -2508.9746, 27.9723), size = 10.0, showBlip = false },
      { coords = vector3(894.2559, -2516.0586, 27.9731), size = 10.0, showBlip = false },
    },
    blip = { id = 446, color = 47, scale = 0.7 },
    mods = {
      repair           = { enabled = true, price = 250, percentVehVal = 0.00 },
      performance      = { enabled = true, price = 1000, percentVehVal = 0.03, priceMult = 0.2 },
      cosmetics        = { enabled = true, price = 500, percentVehVal = 0.02, priceMult = 0.1 },
      stance           = { disabled = false, price = 0, percentVehVal = 0.01 },
      respray          = { enabled = true, price = 1000, percentVehVal = 0.01 },
      wheels           = { enabled = true, price = 0, percentVehVal = 0.01 },
      neonLights       = { enabled = true, price = 0, percentVehVal = 0.01 },
      headlights       = { enabled = true, price = 0, percentVehVal = 0.01 },
      tyreSmoke        = { enabled = true, price = 0, percentVehVal = 0.01 },
      bulletproofTyres = { enabled = false, price = 0, percentVehVal = 0.02 },
      extras           = { enabled = true, price = 0, percentVehVal = 0.02 }
    },
    tuning = {
      engineSwaps   = { disabled = false, requiresItem = true },
      drivetrains   = { disabled = false, requiresItem = true },
      turbocharging = { disabled = false, requiresItem = true },
      tyres         = { disabled = false, requiresItem = true },
      brakes        = { disabled = false, requiresItem = true },
      driftTuning   = { disabled = false, requiresItem = true },
      gearboxes     = { disabled = false, requiresItem = true },
    },
    shops = {
      {
        name   = "Mekanik Malzemeleri",
        coords = vector3(890.9013, -2515.8259, 28.3227),
        size   = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x=0.3, y=0.3, z=0.3 }, color = { r=255, g=255, b=255, a=120 }, bobUpAndDown=0, faceCamera=0, rotate=1, drawOnEnts=0 },
        items = {
          { name = "mechanic_tablet", label = "Mekanik Tablet", price = 1 },
          { name = "performance_part", label = "Performans Parçası", price = 1 },
          { name = "repair_kit", label = "Tamir Kiti", price = 1 },
          { name = "cleaning_kit", label = "Temizlik Kiti", price = 1 },
          { name = "extras_kit", label = "Ekstra Kiti", price = 1 },
          { name = "vehicle_wheels", label = "Araç Tekerlekleri", price = 1 },
          { name = "respray_kit", label = "Boya Kiti", price = 1 },
          { name = "cosmetic_part", label = "Kozmetik Parça", price = 1 },
          { name = "lighting_controller", label = "Aydınlatma Kontrolcüsü", price = 1 },
          { name = "tyre_smoke_kit", label = "Lastik Dumanı Kiti", price = 1 },
        },
      },
    },
    stashes = {
      {
        name   = "Mekanik Depo",
        coords = vector3(916.5743, -2531.0554, 28.3226),
        size   = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x=0.3, y=0.3, z=0.3 }, color = { r=255, g=255, b=255, a=120 }, bobUpAndDown=0, faceCamera=0, rotate=1, drawOnEnts=0 },
        slots  = 70,
        weight = 700000,
      },
    },
  },
  mechanic_illegal = {
    type               = "owned",
    job                = "mechanic_illegal",
    jobManagementRanks = {1},
    logo               = "bennys.png",
    commission         = 0,
    locations = {
      { coords = vector3(135.95, -3030.16, 6.44), size = 10.0, showBlip = false },
      { coords = vector3(144.9,  -3031.07, 6.44), size = 10.0, showBlip = false },
    },
    blip = { id = 446, color = 47, scale = 0.7 },
    mods = {
      repair           = { enabled = true, price = 250, percentVehVal = 0.00 },
      performance      = { enabled = true, price = 1000, percentVehVal = 0.03, priceMult = 0.2 },
      cosmetics        = { enabled = true, price = 500, percentVehVal = 0.02, priceMult = 0.1 },
      stance           = { disabled = false, price = 0, percentVehVal = 0.01 },
      respray          = { enabled = true, price = 1000, percentVehVal = 0.01 },
      wheels           = { enabled = true, price = 0, percentVehVal = 0.01 },
      neonLights       = { enabled = true, price = 0, percentVehVal = 0.01 },
      headlights       = { enabled = true, price = 0, percentVehVal = 0.01 },
      tyreSmoke        = { enabled = true, price = 0, percentVehVal = 0.01 },
      bulletproofTyres = { enabled = false, price = 0, percentVehVal = 0.02 },
      extras           = { enabled = true, price = 0, percentVehVal = 0.02 }
    },
    tuning = {
      engineSwaps   = { disabled = false, requiresItem = true },
      drivetrains   = { disabled = false, requiresItem = true },
      turbocharging = { disabled = false, requiresItem = true },
      tyres         = { disabled = false, requiresItem = true },
      brakes        = { disabled = false, requiresItem = true },
      driftTuning   = { disabled = false, requiresItem = true },
      gearboxes     = { disabled = false, requiresItem = true },
    },
    shops = {
      {
        name   = "Mekanik Malzemeleri",
        coords = vector3(125.8230, -3030.2004, 7.0571),
        size   = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x=0.3, y=0.3, z=0.3 }, color = { r=255, g=255, b=255, a=120 }, bobUpAndDown=0, faceCamera=0, rotate=1, drawOnEnts=0 },
        items = {
          { name = "mechanic_tablet", label = "Mekanik Tablet", price = 1 },
          { name = "performance_part", label = "Performans Parçası", price = 1 },
          { name = "repair_kit", label = "Tamir Kiti", price = 1 },
          { name = "cleaning_kit", label = "Temizlik Kiti", price = 1 },
          { name = "extras_kit", label = "Ekstra Kiti", price = 1 },
          { name = "vehicle_wheels", label = "Araç Tekerlekleri", price = 1 },
          { name = "respray_kit", label = "Boya Kiti", price = 1 },
          { name = "cosmetic_part", label = "Kozmetik Parça", price = 1 },
          { name = "lighting_controller", label = "Aydınlatma Kontrolcüsü", price = 1 },
          { name = "tyre_smoke_kit", label = "Lastik Dumanı Kiti", price = 1 },
        },
      },
      {
        name   = "Advanced Upgrades",
        coords = vector3(130.3488, -3013.4702, 10.7034),
        size   = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x=0.3, y=0.3, z=0.3 }, color = { r=255, g=255, b=255, a=120 }, bobUpAndDown=0, faceCamera=0, rotate=1, drawOnEnts=0 },
        items = {
          { name = "turbocharger", label = "Turbo Charger", price = 25000 },
          { name = "ceramic_brakes", label = "Ceramic Brakes", price = 15000 },
          { name = "nitrous_install_kit", label = "Nitro Kurulum Kiti", price = 15000 },
          { name = "nitrous_bottle", label = "Nitro Şişesi", price = 15000 },
          { name = "stancing_kit", label = "Kamber", price = 15000 },
        },
      }
    },
    stashes = {
      {
        name   = "Mekanik Depo",
        coords = vector3(128.38, -3009.5, 7.04),
        size   = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x=0.3, y=0.3, z=0.3 }, color = { r=255, g=255, b=255, a=120 }, bobUpAndDown=0, faceCamera=0, rotate=1, drawOnEnts=0 },
        slots  = 70,
        weight = 700000,
      },
    },
  },
  redline = {
    type = "owned",
    job = "redline",
    jobManagementRanks = {1},
    logo = "sugar.png",
    commission = 60, -- %, 10 = 10%
    locations = {
      {
        coords = vector3(-583.17, -931.94, 23.45),
        size = 5.0,
        showBlip = false,
       
      },
      {
        coords = vector3(-583.13, -924.61, 23.45),
        size = 5.0,
        showBlip = false,
       
      },
      {
        coords = vector3(-583.07, -917.54, 23.46),
        size = 5.0,
        showBlip = false,
       
      },
      {
        coords = vector3(-572.96, -936.83, 23.53),
        size = 5.0,
        showBlip = false,
       
      },
      {
        coords = vector3(-574.01, -914.37, 23.46),
        size = 5.0,
        showBlip = false,
       
      },
      {
        coords = vector3(-567.7, -936.72, 23.89),
        size = 5.0,
        showBlip = false,
       
      },
      {
        coords = vector3(-559.91, -914.55, 23.89),
        size = 5.0,
        showBlip = false,
       
      },
      {      
        coords = vector3(-578.0, -936.75, 23.89),
        size = 5.0,
        showBlip = false,
       
      }
    },
    blip = {
      id = 446,
      color = 47,
      scale = 0.7
    },
    mods = {
      repair           = { enabled = true, price = 250, percentVehVal = 0.00 },
      performance      = { enabled = true, price = 1000, percentVehVal = 0.03, priceMult = 0.2 },
      cosmetics        = { enabled = true, price = 500, percentVehVal = 0.02, priceMult = 0.1 },
      stance           = { disabled = false, price = 0, percentVehVal = 0.01 },
      respray          = { enabled = true, price = 1000, percentVehVal = 0.01 },
      wheels           = { enabled = true, price = 0, percentVehVal = 0.01 },
      neonLights       = { enabled = true, price = 0, percentVehVal = 0.01 },
      headlights       = { enabled = true, price = 0, percentVehVal = 0.01 },
      tyreSmoke        = { enabled = true, price = 0, percentVehVal = 0.01 },
      bulletproofTyres = { enabled = false, price = 0, percentVehVal = 0.02 },
      extras           = { enabled = true, price = 0, percentVehVal = 0.02 }
    },
    tuning = {
      engineSwaps      = { disabled = true, requiresItem = true },
      drivetrains      = { disabled = true, requiresItem = true },
      turbocharging    = { disabled = true, requiresItem = true },
      tyres            = { disabled = true, requiresItem = true },
      brakes           = { disabled = true, requiresItem = true },
      driftTuning      = { disabled = false, requiresItem = true },
      gearboxes        = { disabled = true, requiresItem = true },
    },
    shops = {
      {
        name = "Mekanik Malzemeleri",
        coords = vector3(-584.12, -938.73, 23.89),
        size = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
        items = {
            { name = "mechanic_tablet", label = "Mekanik Tablet", price = 1 },
            { name = "performance_part", label = "Performans Parçası", price = 1 },
            { name = "repair_kit", label = "Tamir Kiti", price = 1 },
            { name = "cleaning_kit", label = "Temizlik Kiti", price = 1 },
            { name = "extras_kit", label = "Ekstra Kiti", price = 1 },
            { name = "vehicle_wheels", label = "Araç Tekerlekleri", price = 1 },
            { name = "respray_kit", label = "Boya Kiti", price = 1 },
            { name = "cosmetic_part", label = "Kozmetik Parça", price = 1 },
            { name = "lighting_controller", label = "Aydınlatma Kontrolcüsü", price = 1 },
            { name = "tyre_smoke_kit", label = "Lastik Dumanı Kiti", price = 1 },

        },
      },
    },
    stashes = {
      {
        name = "Mekanik Depo",
        coords = vector3(-593.94, -934.71, 28.14),
        size = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
        slots = 70,
        weight = 700000,
      },
    }
  },
  pitstop = {
    type               = "owned",
    job                = "pitstop",
    jobManagementRanks = {1},
    logo               = "bennys.png",
    commission         = 0,
    locations = {
      { coords = vector3(934.31, -1553.68, 30.31), size = 10.0, showBlip = false },
      { coords = vector3(933.92, -1567.65, 30.57), size = 10.0, showBlip = false },
      { coords = vector3(941.92, -1554.07, 30.31), size = 10.0, showBlip = false },
      { coords = vector3(959.4,  -1560.46, 30.31), size = 10.0, showBlip = false },
      { coords = vector3(953.57, -1567.6,  30.57), size = 10.0, showBlip = false },
    },
    blip = { id = 446, color = 47, scale = 0.7 },
    mods = {
      repair           = { enabled = true, price = 250, percentVehVal = 0.00 },
      performance      = { enabled = true, price = 1000, percentVehVal = 0.03, priceMult = 0.2 },
      cosmetics        = { enabled = true, price = 500, percentVehVal = 0.02, priceMult = 0.1 },
      stance           = { disabled = false, price = 0, percentVehVal = 0.01 },
      respray          = { enabled = true, price = 1000, percentVehVal = 0.01 },
      wheels           = { enabled = true, price = 0, percentVehVal = 0.01 },
      neonLights       = { enabled = true, price = 0, percentVehVal = 0.01 },
      headlights       = { enabled = true, price = 0, percentVehVal = 0.01 },
      tyreSmoke        = { enabled = true, price = 0, percentVehVal = 0.01 },
      bulletproofTyres = { enabled = false, price = 0, percentVehVal = 0.02 },
      extras           = { enabled = true, price = 0, percentVehVal = 0.02 }
    },
    tuning = {
      engineSwaps   = { disabled = false, requiresItem = true },
      drivetrains   = { disabled = false, requiresItem = true },
      turbocharging = { disabled = false, requiresItem = true },
      tyres         = { disabled = false, requiresItem = true },
      brakes        = { disabled = false, requiresItem = true },
      driftTuning   = { disabled = false, requiresItem = true },
      gearboxes     = { disabled = false, requiresItem = true },  
    },
    shops = {
      {
        name   = "Mekanik Malzemeleri",
        coords = vector3(944.7954, -1566.5084, 30.7377),
        size   = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x=0.3, y=0.3, z=0.3 }, color = { r=255, g=255, b=255, a=120 }, bobUpAndDown=0, faceCamera=0, rotate=1, drawOnEnts=0 },
        items = {
          { name = "mechanic_tablet", label = "Mekanik Tablet", price = 1 },
          { name = "performance_part", label = "Performans Parçası", price = 1 },
          { name = "repair_kit", label = "Tamir Kiti", price = 1 },
          { name = "cleaning_kit", label = "Temizlik Kiti", price = 1 },
          { name = "extras_kit", label = "Ekstra Kiti", price = 1 },
          { name = "vehicle_wheels", label = "Araç Tekerlekleri", price = 1 },
          { name = "respray_kit", label = "Boya Kiti", price = 1 },
          { name = "cosmetic_part", label = "Kozmetik Parça", price = 1 },
          { name = "lighting_controller", label = "Aydınlatma Kontrolcüsü", price = 1 },
          { name = "tyre_smoke_kit", label = "Lastik Dumanı Kiti", price = 1 },
        },
      },
      {
        name   = "Advanced Upgrades",
        coords = vector3(945.7169, -1541.1094, 30.7378),
        size   = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x=0.3, y=0.3, z=0.3 }, color = { r=255, g=255, b=255, a=120 }, bobUpAndDown=0, faceCamera=0, rotate=1, drawOnEnts=0 },
        items = {
          { name = "turbocharger", label = "Turbo Charger", price = 25000 },
          { name = "ceramic_brakes", label = "Ceramic Brakes", price = 15000 },
          { name = "nitrous_install_kit", label = "Nitro Kurulum Kiti", price = 15000 },
          { name = "nitrous_bottle", label = "Nitro Şişesi", price = 15000 },
          { name = "stancing_kit", label = "Kamber", price = 15000 },
        },
      }
    },
    stashes = {
      {
        name   = "Mekanik Depo",
        coords = vector3(959.55, -1568.08, 30.74),
        size   = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x=0.3, y=0.3, z=0.3 }, color = { r=255, g=255, b=255, a=120 }, bobUpAndDown=0, faceCamera=0, rotate=1, drawOnEnts=0 },
        slots  = 70,
        weight = 700000,
      },
    },
  },
}  -- end of Config.MechanicLocations
-- Add electric vehicles to disable combustion engine features
-----------------------------------------------------------------------
-- PLEASE NOTE: In b3258 (Bottom Dollar Bounties) and newer, electric
-- vehicles are detected automatically, so this list is not used! 
Config.ElectricVehicles = {
  "Airtug",     "buffalo5",   "caddy",
  "Caddy2",     "caddy3",     "coureur",
  "cyclone",    "cyclone2",   "imorgon",
  "inductor",   "iwagen",     "khamelion",
  "metrotrain", "minitank",   "neon",
  "omnisegt",   "powersurge", "raiden",
  "rcbandito",  "surge",      "tezeract",
  "virtue",     "vivanite",   "voltic",
  "voltic2",
}

-- Nerd options
Config.DisableSound = false
Config.AutoRunSQL = true
Config.Debug = false