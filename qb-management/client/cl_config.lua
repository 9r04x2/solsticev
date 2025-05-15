-- Zones for Menues
Config = Config or {}

Config.UseTarget = true -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    ['police'] = {
        vector3(461.79, -986.13, 29.72),
    },
    ['bcsd'] = {
        vector3(1877.76, 3706.22, 34.24),
    },
    ['pbsd'] = { 
        vector3(-432.93, 6005.15, 37.01),
    },
    ['lssp'] = { 
        vector3(1539.4443359375, 815.72265625, 82.130561828613),
    },
    ['lspr'] = {
        vector3(387.63, 797.75, 189.59),
    },
    ['dsd'] = {
        vector3(358.86, -1590.77, 31.05),
    },
    ['ambulance'] = {
        vector3(335.6398, -594.5151, 43.2841),
    },
    ['wedshop'] = {
        vector3(183.28, -251.01, 53.15),
    },
    ['motor'] = {
        vector3(961.05, -1571.00, 29.80),
    },
    ['uwucafe'] = {
        vector3(-577.62, -1067.13, 26.52),
    },
    ['pitstop'] = {
        vector3(961.3870, -1571.1565, 30.7377),
    },
    ['pondcafe'] = {
        vector3(1114.43, -635.11, 56.23),
    },
    ['beanmachine'] = {
        vector3(120.85, -1040.18, 28.98),
    },
    ['cardealer'] = {
        vector3(-30.12, -1106.3, 24.23),
    },
    ['usedcar'] = {
        vector3(-806.34, -204.28, 40.80),
    },
    ['blacklotus'] = {
        vector3(-197.82653808594,-1339.7581787109,34.95023727417),
    },
    ['mechanic_lscustom'] = { 
        vector3(-347.30, -130.87, 41.08),
    },
    ['mechanic_lscustom2'] = {
        vector3(960.98, -1037.39, 46.24),
    },
    ['mechanic_airport'] = {
        vector3(258.37, -1813.88, 30.71),
    },
    ['mechanic_oldhayes'] = {
        vector3(474.76, -1308.1, 28.12),
    },
    ['mechanic_illegal'] = {   
        vector3(125.94, -3007.81, 7.04),
    },
    ['mechanic_hayes'] = { 
        vector3(-1427.62, -458.41, 35.91),
    },
    ['mechanic_ottos'] = { 
        vector3(835.13, -827.24, 24.34),
    },
    ['doj'] = {  
        vector3(-537.91, -195.84, 38.23),
    },
    ['cryptoexchange'] = { 
        vector3(-1372.98, -464.32, 72.04),
    },
    ['bahama'] = {
        vector3(-1370.25, -624.94, 30.15),
    },
    ['unicorn'] = {
        vector3(93.43, -1290.59, 30.25),
    },
    ['irishpub'] = {
        vector3(830.99029541016,-117.1330947876,80.236358642578),
    },  
    ['club77'] = {
        vector3(388.9, 273.24, 93.81),
    }, 
    ['burgershot'] = {
        vector3(-1198.05, -897.96, 13.80),
    },  
    ['gunshop_one'] = {
        vector3(246.43, -52.03, 69.94),
    },  
    ['iskelebar'] = {
        vector3(-1130.64, -1716.59, 5.34),
    },  
    ['realestate'] = {
        vector3(-1375.07, -486.27, 72.05),
    },  
    ['mechanic_japanese'] = {
        vector3(564.32, -179.49, 58.30),
    },  
    ['gunshop_thre'] = {    
        vector3(-658.33, -939.96, 21.83),
    },  
    ['gunshop_two'] = {    
        vector3(246.43, -52.03, 69.94),
    },
    ['tequila'] = {    
        vector3(-568.58, 291.03, 79.18),
    },  
    ['koi'] = {    
        vector3(-1053.77, -1441.58, -2.38),
    },  
    ['vibecafe'] = {    
        vector3(177.38, -234.63, 52.90),
    }, 
    ['taco'] = {    
        vector3(14.45, -1601.03, 28.70),
    }, 
    ['ammunation'] = {    
        vector3(19.3, -1106.81, 29.8),
    },
      
}



Config.BossMenuZones = {
    ['police'] = {
        {coords = vector3(461.79, -986.13, 29.72), length = 0.4, width = 0.4, heading = 196.64, minZ = 27.72, maxZ = 31.72},
    },
    ['bcsd'] = {
        {coords = vector3(1877.27, 3706.28, 31.97), length = 0.4, width = 0.4, heading = 120.33, minZ = 29.97, maxZ = 33.97},
    },
    ['pbsd'] = { 
        {coords = vector3(-432.88, 6005.18, 34.96), length = 0.4, width = 0.4, heading = 134.35, minZ = 32.96, maxZ = 36.96},
    },
    ['lssp'] = {
        {coords = vector3(1540.4443359375, 815.72265625, 80.13), length = 0.4, width = 0.4, heading = 312.84747314453, minZ = 78.13, maxZ = 82.13},
    },
    ['lspr'] = {
        {coords = vector3(387.63, 797.75, 189.59), length = 0.4, width = 0.4, heading = 177.21, minZ = 187.59, maxZ = 191.59},
    },
    ['dsd'] = {
        {coords = vector3(359.62, -1590.83, 28.69), length = 0.4, width = 0.4, heading = 233.76, minZ = 26.69, maxZ = 30.69},
    },
    ['ambulance'] = {
        {coords = vector3(335.6398, -594.5151, 43.2841), length = 1.2, width = 0.6, heading = 248.5198, minZ = 41.2841, maxZ = 45.2841},
    },
    ['wedshop'] = {
        {coords = vector3(183.11, -251.18, 52.58), length = 1.2, width = 0.6, heading = 338.81, minZ = 50.28, maxZ = 54.58},
    },
    ['uwucafe'] = {
        {coords = vector3(-577.62, -1067.13, 24.52), length = 1.2, width = 0.6, heading = 41.21, minZ = 22.52, maxZ = 26.52},
    },
    ['pondcafe'] = {
        {coords = vector3(1114.45, -635.1, 56.22), length = 1.2, width = 0.6, heading = 41.21, minZ = 24.52, maxZ = 28.52},
    },
    ['beanmachine'] = {
        {coords = vector3(118.52, -1046.32, 28.31), length = 1.2, width = 0.6, heading = 41.21, minZ = 27.98, maxZ = 30.98},
    },
    ['motor'] = {
        {coords = vector3(961.05, -1571.00, 29.80), length = 1.2, width = 0.6, heading = 179.55, minZ = 27.80, maxZ = 31.80},
    },
    ['cardealer'] = {
        {coords = vector3(-30.12, -1106.3, 24.23), length = 1.2, width = 0.6, heading = 253.56, minZ = 23.42, maxZ = 27.42},
    },
    ['usedcar'] = {
        {coords = vector3(-806.34, -204.28, 40.80), length = 1.2, width = 0.6, heading = 298.95, minZ = 38.80, maxZ = 42.80},
    },
    ['blacklotus'] = { 
        {coords = vector3(-197.82653808594,-1339.7581787109,34.95023727417), length = 1.2, width = 2.6, heading = 2.8688766956329, minZ = 32.95023727417, maxZ = 36.95023727417},
    },
    ['mechanic_lscustom'] = { 
        {coords = vector3(-347.30, -130.87, 41.08), length = 1.2, width = 2.6, heading = 41.08, minZ = 38.08, maxZ = 43.08},
    },
    ['mechanic_lscustom2'] = {
        {coords = vector3(959.76, -1036.31, 45.64), length = 1.2, width = 2.6, heading = 73.92, minZ = 43.24, maxZ = 47.24},
    },
    ['mechanic_airport'] = {
        {coords = vector3(258.37, -1813.88, 30.71), length = 1.2, width = 2.6, heading = 319.21, minZ = 28.71, maxZ = 32.71},
    },
    ['unicorn'] = {
        {coords = vector3(95.34, -1293.3, 27.27), length = 1.2, width = 2.6, heading = 302.98, minZ = 25.27, maxZ = 29.27},
    },
    ['mechanic_oldhayes'] = {
        {coords = vector3(474.76, -1308.1, 28.12), length = 1.2, width = 2.6, heading = 171.3, minZ = 28.21, maxZ = 31.21},
    },
    ['mechanic_illegal'] = {   
        {coords = vector3(125.94, -3007.81, 7.04), length = 1.2, width = 2.6, heading = 8.75, minZ = 05.04, maxZ = 09.04},
    },
    ['mechanic_hayes'] = { 
        {coords = vector3(-1426.9, -458.36, 34.71), length = 1.2, width = 2.6, heading = 291.2, minZ = 34.91, maxZ = 37.91},
    },
    ['mechanic_ottos'] = { 
        {coords = vector3(835.29, -827.34, 24.16), length = 1.2, width = 2.6, heading = 294.01, minZ = 28.33, maxZ = 25.33},
    },
    ['doj'] = {  
        {coords = vector3(-537.97, -194.76, 39.16), length = 1.2, width = 1.6, heading = 17.16, minZ = 40.84, maxZ = 44.84},
    },
    ['cryptoexchange'] = { 
        {coords = vector3(-1372.98, -464.32, 72.04), length = 1.2, width = 2.6, heading = 197.97, minZ = 70.04, maxZ = 74.04},
    },
    ['bahama'] = {
        {coords = vector3(-1370.25, -624.94, 28.15), length = 1.2, width = 2.6, heading = 9.4, minZ = 26.15, maxZ = 30.15},
    },
    ['pitstop'] = {
        {coords = vector3(961.3870, -1571.1565, 30.7377), length = 1.2, width = 2.6, heading = 302, minZ = 28.7377, maxZ = 32.7377},
    },
    ['irishpub'] = {
        {coords = vector3(830.99029541016,-117.1330947876,80.236358642578), length = 1.2, width = 2.6, heading = 0.9020, minZ = 78.43, maxZ = 82.43},
    }, 
    ['club77'] = {
        {coords = vector3(388.9, 273.24, 94.81), length = 1.2, width = 2.6, heading = 40.2, minZ = 93.99, maxZ = 96.99},
    }, 
    ['koi'] = {
        {coords =  vector3(-1053.77, -1441.58, -2.38), length = 1.2, width = 2.6, heading = 270.16, minZ = -4.38, maxZ = -0.38},
    },  
    ['vibecafe'] = {
        {coords =  vector3(177.38, -234.63, 52.90), length = 1.2, width = 2.6, heading = 340.04, minZ = 50.90, maxZ = 54.90},
    },  
    ['taco'] = {
        {coords =  vector3(14.45, -1601.03, 28.70), length = 1.2, width = 2.6, heading = 153.93, minZ = 26.70, maxZ = 30.70},
    },  
    ['burgershot'] = {
        {coords = vector3(-1198.05, -897.96, 13.80), length = 1.2, width = 2.6, heading = 13, minZ = 11.80, maxZ = 15.80},
    },  
    ['gunshop_one'] = {
        {coords = vector3(246.57, -51.90, 69.94), length = 1.2, width = 2.6, heading = 79.38, minZ = 67.94, maxZ = 71.94},
    },  
    ['iskelebar'] = {
        {coords = vector3(-1130.64, -1716.59, 5.34), length = 1.2, width = 2.6, heading = 235.38, minZ = 3.34, maxZ = 7.34},
    },  
    ['realestate'] = {
        {coords = vector3(-1375.07, -486.27, 72.05), length = 1.2, width = 2.6, heading = 268.8, minZ = 70.05, maxZ = 74.05},
    },  
    ['mechanic_japanese'] = {
        {coords = vector3(564.32, -179.49, 58.30), length = 1.2, width = 2.6, heading = 92.19, minZ = 56.30, maxZ = 60.30},
    },  
    ['gunshop_thre'] = {    
        {coords = vector3(-658.33, -939.96, 21.83), length = 1.2, width = 2.6, heading = 335.85, minZ = 67.94, maxZ = 71.94},
    },  
    ['tequila'] = {    
        {coords = vector3(-568.58, 291.03, 79.18), length = 1.2, width = 2.6, heading = 169.54, minZ = 77.18, maxZ = 81.18},
    },  
    ['ammunation'] = {    
        {coords = vector3(19.3, -1106.81, 29.8), length = 1.2, width = 2.6, heading = 255.21, minZ = 27.8, maxZ = 31.8}, 
    },
    ['gunshop_two'] = {    
        {coords = vector3(246.57, -51.90, 69.94), length = 1.2, width = 2.6, heading = 79.38, minZ = 67.94, maxZ = 71.94},
    },
    ['mai10'] = {    
        {coords = vector3(-391.08, 201.32, 80.8), length = 1.2, width = 2.6, heading = 89.62, minZ = 80.19, maxZ = 85.19}, 
    },
}   
Config.GangMenus = {
    ['lostmc'] = {
        vector3(0, 0, 0),
    },
    ['ballas'] = {
        vector3(0, 0, 0),
    },
    ['vagos'] = {
        vector3(0, 0, 0),
    },
    ['cartel'] = {
        vector3(0, 0, 0),
    },
    ['families'] = {
        vector3(0, 0, 0),
    },
}

Config.GangMenuZones = {
    --[[
    ['gangname'] = {
        { coords = vector3(0.0, 0.0, 0.0), length = 0.0, width = 0.0, heading = 0.0, minZ = 0.0, maxZ = 0.0 },
    },
    ]]
}
