Config = Config or {}

Config.Locations = {
    ['AmbulanceMechanic'] = {
        settings = {
            label = 'Ambulance Mechanic',
            welcomeLabel = "Ambulance Mechanic'e Hoşgeldiniz!",
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = false,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
        restrictions = { 
            job = {'police', 'lspd', 'vespuccipd', 'bcsd', 'pbsd', 'lssp', 'lspr', 'dsd', 'doj', 'ambulance'},
            deniedClasses = {20} 
        }, 
        zones = {           
            {coords = vector3(318.3847, -574.1201, 28.3745), length = 6.0, width = 4.0, heading = 250.5602, minZ = 26.3745, maxZ = 30.3745},
            {coords = vector3(594.6722, 3.2471, 70.2037), length = 6.0, width = 4.0, heading = 172.5518, minZ = 68.2037, maxZ = 72.2037},
            {coords = vector3(1195.9807, -1568.7380, 38.9777), length = 6.0, width = 4.0, heading = 325.9062, minZ = 36.9777, maxZ = 40.9777},
        }
    },
    ['PoliceMechanic'] = {
        settings = {
            label = 'Police Mechanic',
            welcomeLabel = "Police Mechanic'e Hoşgeldiniz!",
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = false,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
        restrictions = { 
            job = {'police', 'lspd', 'vespuccipd', 'bcsd', 'pbsd', 'lssp', 'lspr', 'dsd', 'doj', 'ambulance'},
            deniedClasses = {20} 
        },
        zones = {
            {coords = vector3(450.32, -975.60, 25.70), length = 6.0, width = 4.0, heading = 91.67, minZ = 22.0, maxZ = 26.28}, 
            {coords = vector3(436.05, -975.81, 25.70), length = 6.0, width = 4.0, heading = 89.82, minZ = 22.0, maxZ = 26.28}, 
            {coords = vector3(1544.9415283203, 791.45269775391, 77.074760437012), length = 6.0, width = 4.0, heading = 58.733318328857, minZ = 75.074760437012, maxZ = 79.074760437012}, 
        }
    },
    ['DSDMechanic'] = {
        settings = {
            label = 'Davis Mechanic',
            welcomeLabel = "Davis Mechanic'e Hoşgeldiniz!",
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = false,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
        restrictions = { 
            job = {'police', 'lspd', 'vespuccipd', 'bcsd', 'pbsd', 'lssp', 'lspr', 'dsd', 'doj', 'ambulance'},
            deniedClasses = {20} 
        },
        zones = {
            {coords = vector3(387.16, -1636.47, 28.9), length = 6.0, width = 4.0, heading = 320.58, minZ = 26.9, maxZ = 30.9},
        }
    },
    ['SheriffMechanic'] = {
        settings = {
            label = 'Sheriff Mechanic',
            welcomeLabel = "Sheriff Mechanic'e Hoşgeldiniz!",
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = false,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
        restrictions = { 
            job = {'police', 'lspd', 'vespuccipd', 'bcsd', 'pbsd', 'lssp', 'lspr', 'dsd', 'doj', 'ambulance'},
            deniedClasses = {20} 
        },
        zones = {
            {coords = vector3(-487.14, 5993.89, 31.33), length = 6.0, width = 4.0, heading = 310.45, minZ = 26.87, maxZ = 30.87},
        }
    },
    ['BlaineCountyMechanic'] = {
        settings = {
            label = 'Blaine County Mechanic',
            welcomeLabel = "Blaine County Mechanic'e Hoşgeldiniz!",
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = false,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
        restrictions = { 
            job = {'police', 'lspd', 'vespuccipd', 'bcsd', 'pbsd', 'lssp', 'lspr', 'dsd', 'doj', 'ambulance'},
            deniedClasses = {20} 
        },
        zones = {
            {coords = vector3(1817.41, 3686.34, 33.97), length = 6.0, width = 4.0, heading = 298.23, minZ = 30.40, maxZ = 34.40},
        }
    },
    ['PaletoBayMechanic'] = {
        settings = {
            label = 'Paleto Bay Mechanic',
            welcomeLabel = "Paleto Bay Mechanic'e Hoşgeldiniz!",
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = false,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
        restrictions = { 
            job = {'police', 'lspd', 'vespuccipd', 'bcsd', 'pbsd', 'lssp', 'lspr', 'dsd', 'doj', 'ambulance'},
            deniedClasses = {20} 
        },
        zones = {
            {coords = vector3(-456.95, 5982.46, 30.88), length = 6.0, width = 4.0, heading = 135.86, minZ = 28.88, maxZ = 32.88},
        }
    },
    ['StatePoliceMechanic'] = {
        settings = {
            label = 'State Police Mechanic',
            welcomeLabel = "State Police Mechanic'e Hoşgeldiniz!",
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = false,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
        restrictions = { 
            job = {'police', 'lspd', 'vespuccipd', 'bcsd', 'pbsd', 'lssp', 'lspr', 'dsd', 'doj', 'ambulance'},
            deniedClasses = {20} 
        },
        zones = {
            {coords = vector3(869.97, -1350.43, 25.88), length = 6.0, width = 4.0, heading = 270.4, minZ = 23.88, maxZ = 27.88},
        }
    },
    ['ParkRangerMechanic'] = {
        settings = {
            label = 'Park Ranger Mechanic',
            welcomeLabel = "Park Ranger Mechanic'e Hoşgeldiniz!",
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = false,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
        restrictions = { 
            job = {'police', 'lspd', 'vespuccipd', 'bcsd', 'pbsd', 'lssp', 'lspr', 'dsd', 'doj', 'ambulance'},
            deniedClasses = {20} 
        },
        zones = {
            {coords = vector3(374.28, 794.9, 186.95), length = 6.0, width = 4.0, heading = 177.86, minZ = 184.95, maxZ = 188.95},
        }
    },
    ['DOJMechanic'] = {
        settings = {
            label = 'Doj Mechanic',
            welcomeLabel = "Doj Mechanic'e Hoşgeldiniz!",
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = false,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
        restrictions = { 
            job = {'police', 'lspd', 'vespuccipd', 'bcsd', 'pbsd', 'lssp', 'lspr', 'dsd', 'doj', 'ambulance'},
            deniedClasses = {20} 
        },
        zones = {    
            {coords = vector3(-514.2693, -228.7308, 35.7326), length = 6.0, width = 4.0, heading = 212.1482, minZ = 32.7326, maxZ = 37.7326},
        }
    },
    ['PBSOMechanic'] = {
        settings = {
            label = 'PBSO Mechanic',
            welcomeLabel = "PBSO Mechanic'e Hoşgeldiniz!",
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = false,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
        restrictions = { 
            job = {'police', 'lspd', 'vespuccipd', 'bcsd', 'pbsd', 'lssp', 'lspr', 'dsd', 'doj', 'ambulance'},
            deniedClasses = {20} 
        },      
        zones = {    
            {coords = vector3(-458.07, 6044.14, 30.92), length = 6.0, width = 4.0, heading = 137.12, minZ = 28.92, maxZ = 32.92},
        }
    },
    ['HelicopterMechanic2'] = {
        settings = {
            label = 'Mechanic',
            welcomeLabel = "Helicopter Mechanic'e Hoşgeldiniz!",
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = false,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
        restrictions = { 
            job = {'police', 'lspd', 'vespuccipd', 'bcsd', 'pbsd', 'lssp', 'lspr', 'dsd', 'doj', 'ambulance'},
            deniedClasses = {20} 
        },
        zones = {      
            {coords = vector3(482.2, -982.26, 41.39), length = 6.0, width = 4.0, heading = 1.72, minZ = 39.39, maxZ = 43.39},
        }
    },
    ['HelicopterMechanic'] = {
        settings = {
            label = 'Mechanic',
            welcomeLabel = "Helicopter Mechanic'e Hoşgeldiniz!",
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = false,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
        restrictions = { 
            job = {'police', 'lspd', 'vespuccipd', 'bcsd', 'pbsd', 'lssp', 'lspr', 'dsd', 'doj', 'ambulance'},
            deniedClasses = {20} 
        },
        zones = {      
            {coords = vector3(857.49, -1380.8, 26.52), length = 6.0, width = 4.0, heading = 350.18, minZ = 24.52, maxZ = 28.52},
        }
    },
    ['HelicopterMechanic3'] = {
        settings = {
            label = 'Mechanic',
            welcomeLabel = "Helicopter Mechanic'e Hoşgeldiniz!",
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = false,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
        restrictions = { 
            job = {'police', 'lspd', 'vespuccipd', 'bcsd', 'pbsd', 'lssp', 'lspr', 'dsd', 'doj', 'ambulance'},
            deniedClasses = {20} 
        },
        zones = {      
            {coords = vector3(326.99, -1566.61, 40.18), length = 6.0, width = 4.0, heading = 43.55, minZ = 38.18, maxZ = 42.18},
        }
    },
    ['HelicopterMechanic3'] = {
        settings = {
            label = 'Mechanic',
            welcomeLabel = "Helicopter Mechanic'e Hoşgeldiniz!",
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = false,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
        restrictions = { 
            job = {'police', 'lspd', 'vespuccipd', 'bcsd', 'pbsd', 'lssp', 'lspr', 'dsd', 'doj', 'vespuccipd'},
            deniedClasses = {20} 
        },
        zones = {       
            {coords = vector3(631.4706, 1.8344, 99.8095), length = 6.0, width = 4.0, heading = 250.8186, minZ = 97.8095, maxZ = 101.8095},
        }
    },
    ['HelicopterMechanic4'] = {
        settings = {
            label = 'Mechanic',
            welcomeLabel = "Helicopter Mechanic'e Hoşgeldiniz!",
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = false,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
        restrictions = { 
            job = {'police', 'lspd', 'vespuccipd', 'bcsd', 'pbsd', 'lssp', 'lspr', 'dsd', 'doj', 'ambulance'},
            deniedClasses = {20} 
        },
        zones = {      
            {coords = vector3(1851.99, 3703.27, 34.36), length = 6.0, width = 4.0, heading = 210.62, minZ = 32.36, maxZ = 36.36},
        }
    },
    ['HelicopterMechanic5'] = {
        settings = {
            label = 'Mechanic',
            welcomeLabel = "Helicopter Mechanic'e Hoşgeldiniz!",
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
        restrictions = { 
            job = {'police', 'lspd', 'vespuccipd', 'bcsd', 'pbsd', 'lssp', 'lspr', 'dsd', 'doj', 'ambulance'},
            deniedClasses = {20} 
        },
        zones = {      
            {coords = vector3(-474.35, 5989.4, 31.72), length = 6.0, width = 4.0, heading = 175.43, minZ = 29.72, maxZ = 33.72},
        }
    },
}