-----------------------------------------------------------------------------------
-- WAIT! Before editing this file manually, try our new easy configuration tool! --
--            https://configurator.jgscripts.com/advanced-garages                --
-----------------------------------------------------------------------------------
Config = {}

-- Localisation
Config.Locale = "en"
Config.NumberAndDateFormat = "en-US"
Config.Currency = "USD"

-- Framework & Integrations
Config.Framework = "QBCore" -- or "QBCore", "Qbox", "ESX"
Config.FuelSystem = "cdn-fuel" -- or "LegacyFuel", "ps-fuel", "lj-fuel", "ox_fuel", "cdn-fuel", "hyon_gas_station", "okokGasStation", "nd_fuel", "myFuel", "ti_fuel", "none"
Config.VehicleKeys = "qb-vehiclekeys" -- or "qb-vehiclekeys", "MrNewbVehicleKeys", "jaksam-vehicles-keys", "qs-vehiclekeys", "mk_vehiclekeys", "wasabi_carlock", "cd_garage", "okokGarage", "t1ger_keys", "Renewed", "none"
Config.Notifications = "ox_lib" -- or "default", "okokNotify", "ox_lib", "ps-ui"

-- Draw text UI prompts (key binding control IDs here: https://docs.fivem.net/docs/game-references/controls/)
Config.DrawText = "qb-DrawText" -- or "jg-textui", "qb-DrawText", "okokTextUI", "ox_lib", "ps-ui"
Config.OpenGarageKeyBind = 38
Config.OpenGaragePrompt = "Garajı AÇ"
Config.OpenImpoundKeyBind = 38
Config.OpenImpoundPrompt = "Çekilmişi AÇ"
Config.InsertVehicleKeyBind = 38
Config.InsertVehiclePrompt = "Aracı Koy"
Config.ExitInteriorKeyBind = 38
Config.ExitInteriorPrompt = "Garajdan Çık"

-- Target
Config.UseTarget = false
Config.Target = "ox_target" -- or "qb-target"
Config.TargetPed = "s_m_y_valet_01"

-- Radial
Config.UseRadialMenu = false
Config.RadialMenu = "ox_lib"


-- Little vehicle preview images in the garage UI - learn more/add custom images: https://docs.jgscripts.com/advanced-garages/vehicle-images
Config.ShowVehicleImages = true

-- Vehicle Spawning
Config.DoNotSpawnInsideVehicle = false
Config.SaveVehicleDamage = true -- Save and apply body and engine damage when taking the vehicle out a garage
Config.AdvancedVehicleDamage = true -- use Kiminaze's VehicleDeformation
Config.SaveVehiclePropsOnInsert = true

-- If you don't know what this means, don't touch this
-- If you know what this means, I do recommend enabling it but be aware you may experience reliability issues on more populated servers
-- Having significant issues? I beg you to just set it back to false before opening a ticket with us
-- HIGHLY recommended that you set Config.DoNotSpawnInsideVehicle = false if you decide to enable this
-- Want to read my rant about server spawned vehicles? https://docs.jgscripts.com/advanced-garages/misc/why-are-you-not-using-createvehicleserversetter-by-default
Config.SpawnVehiclesWithServerSetter = false

-- Vehicle Transfers
Config.GarageVehicleTransferCost = 100 -- Cost to transfer between garages
Config.TransferHidePlayerNames = true
Config.EnableTransfers = {
  betweenGarages = true,
  betweenPlayers = true
}
Config.DisableTransfersToUnregisteredGarages = false -- Potential hacking protection for vigilant servers - unregistered garages are ones created via events in third-party script integrations, such as housing scripts, and therefore could be prone to script kiddie attacks.

-- Prevent vehicle duplication
-- Learn more: https://docs.jgscripts.com/advanced-garages/vehicle-duplication-prevention
Config.AllowInfiniteVehicleSpawns = false -- Public & private garages
Config.JobGaragesAllowInfiniteVehicleSpawns = false -- Job garages
Config.GangGaragesAllowInfiniteVehicleSpawns = false -- Gang garages
Config.GarageVehicleReturnCost = 100 -- "towing" tax if not placed back in garage after server restart; or if destroyed or underwater while left out
Config.GarageVehicleReturnCostSocietyFund = false -- Job name of society fund to pay return fees into (optional)

-- Public Garages
Config.GarageShowBlips = true
Config.GarageUniqueBlips = false
Config.GarageUniqueLocations = true
Config.GarageEnableInteriors = true
Config.GarageLocations = { -- IMPORTANT - Every garage name must be unique
["Legion Square"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(215.09, -805.17, 30.81),
spawn = {vector4(216.84, -802.02, 30.78, 69.82), vector4(218.09, -799.42, 30.76, 66.17), vector4(219.29, -797.23, 30.75, 65.4), vector4(219.59, -794.44, 30.75, 69.35), vector4(220.63, -792.03, 30.75, 63.76), vector4(206.81, -798.35, 30.99, 248.53)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = false,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["East C Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(851.33, -2102.12, 30.51),
spawn = {vector4(866.4, -2105.87, 30.38, 357.12)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["İskele Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(-1317.54, -923.94, 11.2),
spawn = {vector4(-1306.39, -920.51, 11.27, 287.56)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = false,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Sugar Mekanik"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(-540.1290, -909.6964, 23.8618),
spawn = {vector4(-542.7427, -900.0421, 23.4838, 151.0250)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Weed Shop"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(181.46, -258.25, 49.53),
spawn = {vector4(175.73, -254.73, 49.11, 249.75)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["evgaraj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(1377.46, 1092.14, 114.16),
spawn = {vector4(1388.85, 1098.52, 113.88, 91.00)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Rockford PD"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(-569.2, -123.33, 33.65),
spawn = {vector4(-574.02, -101.62, 33.65, 203.57), vector4(-576.46, -103.1, 33.65, 199.53), vector4(-579.0, -104.39, 33.65, 200.74)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Mirror Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(1153.5, -468.35, 66.55),
spawn = {vector4(1149.88, -480.56, 66.1, 146.98)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = false,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["LostMC Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(970.14, -139.95, 74.42),
spawn = {vector4(970.12, -139.92, 74.42, 51.67)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Köprü Altı Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(708.51, -1079.14, 22.40),
spawn = {vector4(708.51, -1079.14, 22.40, 4.22)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Hapishane"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(1860.2954, 2578.0310, 45.6727),
spawn = {vector4(1869.2571, 2574.0908, 45.2496, 271.3598)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = false,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Motell Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(-811.2742, -1281.8628, 5.0004),
spawn = {vector4(-803.5658, -1282.9402, 5.0004, 247.0046)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = false,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Kilise"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(-1667.5005, -233.4249, 54.8136),
spawn = {vector4(-1669.9352, -233.9437, 54.3713, 251.4241)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = false,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Motel Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(-3000.44, 93.94, 11.61),
spawn = {vector4(-2993.48, 91.30, 11.17, 138.86)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = false,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Mekanik Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(-1084.62, -2058.09, 13.29),
spawn = {vector4(-1088.05, -2057.06, 13.29, 313.27)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = false,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Maden Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(2483.4387207031, 1525.1256103516, 38.932796478271),
spawn = {vector4(2483.4387207031, 1525.1256103516, 38.932796478271, 359.14642333984)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = false,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Park Ranger Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(398.08, 787.72, 187.81),
spawn = {vector4(398.28, 781.84, 186.68, 122.91),vector4(405.81, 789.27, 188.01, 141.84)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["MRPD Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(431.39, -986.71, 25.70),
spawn = {vector4(431.39, -986.71, 25.70, 178.76)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["San Andreas Higway Patrol"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(1523.1009521484, 782.40423583984, 77.440742492676), 
spawn = {vector4(1524.6644287109, 776.140625, 76.998260498047, 32.432792663574)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Hastane Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(-818.3412, -1201.2871, 6.9341),
spawn = {vector4(-824.3000, -1195.2426, 6.2999, 139.4441)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Vinewoood PD"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(576.2616, -2.9299, 70.6281),
spawn = {vector4(567.2682, -7.0986, 70.2039, 350.6368)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Hastane Garaj2"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(293.71, -606.94, 43.23),
spawn = {vector4(293.71, -606.94, 43.23, 72.76)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["DAVIS Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(383.3, -1618.85, 29.29),
spawn = {vector4(389.04, -1613.11, 28.9, 230.03)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["LSSP Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(843.81, -1342.69, 26.06),
spawn = {vector4(843.81, -1346.59, 25.68, 267.94)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["VPD Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(627.46, 24.03, 87.75),
spawn = {vector4(615.9, 33.58, 89.34, 247.99)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["BCSO Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(1823.84, 3690.35, 33.97),
spawn = {vector4(1823.84, 3690.35, 33.97, 296.21)}, --  you can add multiple spawn locations into a table
distance = 10,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["PBSD Garaj"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
coords = vector3(-475.86, 6031.55, 31.34),
spawn = {vector4(-479.43, 6028.36, 30.95, 227.54),vector4(-482.99, 6024.92, 30.95, 225.12)}, --  you can add multiple spawn locations into a table
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Pincage Motel Altı"] = {
coords = vector3(273.0, -343.85, 44.91),
spawn = vector4(270.75, -340.51, 44.92, 342.03),
distance = 15,
type = "car",
hideBlip = false,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Irish Garaj"] = {
  coords = vector3(883.3627, -80.2158, 78.7640),
  spawn = vector4(884.1827, -86.8069, 78.3502, 158.7158),
  distance = 20,
  type = "car",
  hideBlip = false,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = false,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Yellowjack Garaj"] = {
    coords = vector3(1991.1095, 3075.1067, 47.0296),
    spawn = vector4(2015.1482, 3071.5432, 46.6453, 147.4140),
    distance = 20,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    },
["Bennys Garaj"] = {
coords = vector3(-183.11534118652, -1291.1354980469, 31.295970916748),
spawn = vector4(-183.11534118652, -1291.1354980469, 31.295970916748, 177.62469482422),
distance = 15,
type = "car",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Hug Garaj"] = {
  coords = vector3(-1526.42, 88.17, 56.56),
  spawn = vector4(-1524.12, 82.91, 56.12, 276.08),
  distance = 15,
  type = "car",
  hideBlip = false,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = false,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
["aodfix"] = {
coords = vector3(-2254.4665527344, 4296.4521484375, 47.093807220459),
spawn = vector4(-2254.4665527344, 4296.4521484375, 47.093807220459, 233.1265411377),
distance = 15,
type = "car",
hideBlip = false,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["burgershot"] = {
  coords = vector3(-1167.97, -891.52, 14.02),
  spawn = vector4(-1167.97, -891.52, 14.02, 38.07),
  distance = 15,
  type = "car",
  hideBlip = true,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = false,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
["momo"] = {
    coords = vector3(-1165.91, -1743.68, 4.02),
    spawn = vector4(-1165.91, -1743.68, 4.02, 116.92),
    distance = 15,
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    },

["Little Seoul Garaj 1"] = {
  coords = vector3(-695.75, -979.70, 20.39),
  spawn = vector4(-695.75, -979.70, 20.39, 358.55),
  distance = 15,
  type = "car",
  hideBlip = true,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = false,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Liman Garaj"] = {
    coords = vector3(1247.57421875,-3100.0490722656,4.8525071144104),
    spawn = vector4(1247.1893310547, -3100.5795898438, 5.862738609314, 2.5682849884033),
    distance = 15,
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    },
["BCSO Helikopter Garaj"] = {
coords = vector3(1853.19, 3706.43, 33.97),
spawn = vector4(1853.19, 3706.43, 33.97, 212.45),
distance = 6,
type = "air",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = true,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Helikopterr Garaj"] = {
  coords = vector3(-744.4661, -1467.4873, 5.0005),
  spawn = vector4(-744.4661, -1467.4873, 5.0005, 135.3679),
  distance = 6,
  type = "air",
  hideBlip = true,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = true,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
["EMS Helikopter Garaj"] = {
  coords = vector3(351.4923, -589.4979, 74.1670),
  spawn = vector4(351.4923, -589.4979, 74.1670, 159.0000),
  distance = 6,
  type = "air",
  hideBlip = true,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = true,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
["MRPD Helikopter Garaj"] = {
coords = vector3(449.25, -981.23, 43.69),
spawn = vector4(449.32, -981.28, 43.69, 90.44),
distance = 25,
type = "air",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["DAVIS Helikopter Garaj"] = {
coords = vector3(402.47, -1645.07, 29.29),
spawn = vector4(402.47, -1645.07, 29.29, 276.97),
distance = 20,
type = "air",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Park Ranger Helikopter Garaj"] = {
coords = vector3(358.51, 785.79, 186.4),
spawn = vector4(358.51, 785.79, 186.4, 240.91),
distance = 15,
type = "air",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["LSSP Helikopter Garaj"] = {
coords = vector3(857.86, -1384.68, 26.15),
spawn = vector4(857.86, -1384.68, 26.15, 349.85),
distance = 15,
type = "air",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["VPD Helikopter Garaj"] = {
coords = vector3(571.40142822266, 6.9055128097534, 103.23003387451),
spawn = vector4(579.85406494141, 12.547671318054, 103.23314666748, 179.78472900391),
distance = 15,
type = "air",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["PBSO Helikopter Garaj"] = {
coords = vector3(-475.87, 5988.85, 31.34),
spawn = vector4(-475.87, 5988.85, 31.34, 312.45),
distance = 15,
type = "air",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Mirror Park"] = {
coords = vector3(1032.84, -765.1, 58.18),
spawn = vector4(1023.2, -764.27, 57.96, 319.66),
distance = 15,
type = "car",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Casino"] = {
  coords = vector3(874.54, -20.40, 78.76),
  spawn = vector4(875.94, -28.04, 78.34, 57.53),
  distance = 15,
  type = "car",
  hideBlip = true,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = false,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
["Ev Garaj"] = {
  coords = vector3(-126.92, 1002.55, 235.73),
  spawn = vector4(-126.92, 1002.55, 235.73, 222.53),
  distance = 15,
  type = "car",
  hideBlip = true,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = false,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Jons Cafe"] = {
    coords = vector3(-841.00, -701.92, 27.30),
    spawn = vector4(-844.13, -697.10, 26.99, 92.01),
    distance = 15,
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    },
    ["Mahir"] = {
      coords = vector3(-2968.41, 2161.28, 41.90),
      spawn = vector4(-2973.74, 2170.44, 41.90, 343.70),
      distance = 15,
      type = "car",
      hideBlip = true,
      blip = {
        id = 357,
        color = 0,
        scale = 0.7
      },
      hideMarkers = false,
      markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
      },
    ["2.El Garaj"] = {
      coords = vector3(-772.77, -231.88, 37.00),
      spawn = vector4(-772.77, -231.88, 37.00, 30.11),
      distance = 15,
      type = "car",
      hideBlip = true,
      blip = {
        id = 357,
        color = 0,
        scale = 0.7
      },
      hideMarkers = false,
      markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
      },
      ["Club 77"] = {
        coords = vector3(186.7152, -3187.2969, 5.7885),
        spawn = vector4(191.2241, -3183.0103, 5.3633, 93.2410),
        distance = 15,
        type = "car",
        hideBlip = true,
        blip = {
          id = 357,
          color = 0,
          scale = 0.7
        },
        hideMarkers = false,
        markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
        },
    ["Oto Galeri"] = {
      coords = vector3(-805.11, -201.19, 37.16),
      spawn = vector4(-805.80, -200.83, 37.16, 208.35),
      distance = 15,
      type = "car",
      hideBlip = true,
      blip = {
        id = 357,
        color = 0,
        scale = 0.7
      },
      hideMarkers = false,
      markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
      },
["Beach"] = {
coords = vector3(-1248.69, -1425.71, 4.32),
spawn = vector4(-1244.27, -1422.08, 4.32, 37.12),
distance = 15,
type = "car",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Beanmachine"] = {
  coords = vector3(114.6033, -1055.0255, 29.1976),
  spawn = vector4(108.5214, -1056.1445, 28.7922, 246.5830),
  distance = 7,
  type = "car",
  hideBlip = true,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = false,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
["Lojisitk"] = {
coords = vector3(-336.67, -2775.36, 5.0),
spawn = vector4(-361.25, -2760.87, 6.05, 325.57),
distance = 15,
type = "car",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Vagos"] = {
  coords = vector3(329.73, -2036.98, 20.94),
  spawn = vector4(326.43, -2041.19, 20.72, 321.35),
  distance = 15,
  type = "car",
  hideBlip = true,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = false,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["homeles"] = {
    coords = vector3(-39.0309, -1262.4561, 29.2852),
    spawn = vector4(-39.0309, -1262.4561, 29.2852, 265.9905),
    distance = 15,
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    },
  ["Lomboo"] = {
    coords = vector3(-1921.4276, 2045.7051, 140.7734),
    spawn = vector4(-1914.8060, 2037.4586, 140.3807, 254.7435),
    distance = 15,
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    },
["UWU Cafe"] = {
coords = vector3(-590.8682, -1128.3019, 22.1789),
spawn = vector4(-595.19848632812, -1134.0616455078, 21.727722167969, 269.30801391602),
distance = 15,
type = "car",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Plazza Cafe"] = {
  coords = vector3(466.03, 5391.97, 671.57),
  spawn = vector4(467.20, 5389.70, 671.15, 359.29),
  distance = 15,
  type = "car",
  hideBlip = true,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = false,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
["Great Ocean Highway"] = {
coords = vector3(-2961.58, 375.93, 15.02),
spawn = vector4(-2964.96, 372.07, 14.78, 86.07),
distance = 15,
type = "car",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["LS Mekanik"] = {
coords = vector3(-374.5, -106.18, 38.68),
spawn = vector4(-375.56, -120.14, 38.7, 190.84),
distance = 15,
type = "car",
hideBlip = false,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Sandy South"] = {
coords = vector3(217.33, 2605.65, 46.04),
spawn = vector4(216.94, 2608.44, 46.33, 14.07),
distance = 15,
type = "car",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Sandy North"] = {
coords = vector3(1878.44, 3760.1, 32.94),
spawn = vector4(1880.14, 3757.73, 32.93, 215.54),
distance = 15,
type = "car",
hideBlip = false,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Eastern Garage"] = {
coords = vector3(1161.49, -1648.58, 36.92),
spawn = vector4(1156.78, -1661.73, 36.62, 207.82),
distance = 15,
type = "car",
hideBlip = false,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Mekanik Garage"] = {
coords = vector3(976.13, -1037.86, 40.89),
spawn = vector4(976.13, -1037.86, 40.89, 7.34),
distance = 15,
type = "car",
hideBlip = false,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["North Vinewood Blvd"] = {
coords = vector3(365.21, 295.65, 103.46),
spawn = vector4(364.84, 289.73, 103.42, 164.23),
distance = 15,
type = "car",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.3
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Grapeseed"] = {
coords = vector3(1713.06, 4745.32, 41.96),
spawn = vector4(1710.64, 4746.94, 41.95, 90.11),
distance = 15,
type = "car",
hideBlip = false,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Paleto Bay"] = {
coords = vector3(107.32, 6611.77, 31.98),
spawn = vector4(110.84, 6607.82, 31.86, 265.28),
distance = 15,
type = "car",
hideBlip = false,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["East Joshua Yolu"] = {
coords = vector3(2489.59, 4116.73, 38.08),
spawn = vector4(2484.13, 4112.86, 38.06, 333.2),
distance = 15,
type = "car",
hideBlip = false,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},  
["Liman"] = {  
coords = vector3(163.95, -3047.21, 5.92),
spawn = vector4(161.64, -3052.69, 5.97, 266.63),
distance = 15,
type = "car",
hideBlip = true,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Hastane"] = {   
coords = vector3(1184.3234, -1541.8987, 34.6927), 
spawn = vector4(1184.2384033203,-1545.5856933594,33.692737579346,0.53458666801453), 
distance = 15,
type = "car",
hideBlip = false,
blip = {
  id = 357,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},  
["Bahama Önü"] = {   
coords = vector3(-1386.48, -475.47, 31.59),
spawn = vector4(-1386.48, -475.47, 31.59, 93.29),
distance = 15,
type = "car",
hideBlip = false,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Evv2"] = {   
  coords = vector3(-105.79, 827.17, 235.72),
  spawn = vector4(-105.79, 827.17, 235.72, 9.76),
  distance = 15,
  type = "car",
  hideBlip = true,
  blip = {
  id = 357,
  color = 0,
  scale = 0.7
  },
  hideMarkers = false,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Evv2"] = {   
    coords = vector3(-1791.5354, 460.2198, 128.3081),
    spawn = vector4(-1782.3379, 464.0983, 127.8844, 107.5540),
    distance = 15,
    type = "car",
    hideBlip = true,
    blip = {
    id = 357,
    color = 0,
    scale = 0.7
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    },
    ["Özel EV"] = {   
      coords = vector3(852.3453, -184.5825, 72.7240),
      spawn = vector4(852.8188, -183.9206, 72.2998, 148.2005),
      distance = 15,
      type = "car",
      hideBlip = true,
      blip = {
      id = 357,
      color = 0,
      scale = 0.7
      },
      hideMarkers = false,
      markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
      },
      ["Özel EV2"] = {   
        coords = vector3(-104.8465, 826.2495, 235.7249),
        spawn = vector4(-104.8465, 826.2495, 235.7249, 17.3035),
        distance = 15,
        type = "car",
        hideBlip = true,
        blip = {
        id = 357,
        color = 0,
        scale = 0.7
        },
        hideMarkers = false,
        markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
        },
["Ballas"] = {   
  coords = vector3(111.23, -1946.29, 20.75),
  spawn = vector4(111.23, -1946.29, 20.75, 44.73),
  distance = 15,
  type = "car",
  hideBlip = false,
  blip = {
  id = 357,
  color = 0,
  scale = 0.7
  },
  hideMarkers = false,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
["Liman 2 Mekanik"] = {   
coords = vector3(976.71, -2548.49, 28.3),
spawn = vector4(976.71, -2548.49, 28.3, 350.97),
distance = 15,
type = "car",
hideBlip = false,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},   
["Galeri"] = {   
coords = vector3(-12.63, -1096.00, 26.67),
spawn = vector4(-13.53, -1108.01, 26.25, 103.31),
distance = 15,
type = "car",
hideBlip = false,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Tequilala Arkası"] = {   
coords = vector3(-561.53, 327.43, 84.41),
spawn = vector4(-561.53, 327.43, 84.41, 82.74),
distance = 15,
type = "car",
hideBlip = false,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},

["Pitstop"] = {   
coords = vector3(923.89, -1539.98, 30.79),
spawn = vector4(923.89, -1539.98, 30.79, 85.6),
distance = 15,
type = "car",
hideBlip = false,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},

["Doj"] = {   
coords = vector3(-516.9656, -264.3481, 34.9967),
spawn = vector4(-516.9656, -264.3481, 34.9967, 112.3406),
distance = 15,  
type = "car",
hideBlip = false,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["vespuccipd"] = {   
coords = vector3(-1076.4724121094, -804.75445556641, 7.9308280944824),
spawn = vector4(608.82, -8.09, 70.63, 74.47),
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["mrpd-ss"] = {   
coords = vector3(426.37631225586, -998.20947265625, 21.336084365845),
spawn = vector4(426.37631225586, -998.20947265625, 21.336084365845, 87.643821716309),
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["unicorn"] = {   
coords = vector3(145.35, -1329.32, 29.20),
spawn = vector4(145.35, -1329.32, 29.20, 70.21),
distance = 15,
type = "car",
hideBlip = true,
blip = {
id = 357,
color = 0,
scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Boats"] = {
coords = vector3(-795.15, -1510.79, 1.6),
spawn = vector4(-798.66, -1507.73, -0.47, 102.23),
distance = 20,
type = "sea",
hideBlip = true,
blip = {
  id = 356,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Hangar"] = {
coords = vector3(-1243.49, -3391.88, 13.94),
spawn = vector4(-1258.4, -3394.56, 13.94, 328.23),
distance = 20,
type = "air",
hideBlip = true,
blip = {
  id = 359,
  color = 0,
  scale = 0.7
},
hideMarkers = false,
markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
}
}

-- Private Garages
Config.PrivGarageCreateCommand = "privategarages"
Config.PrivGarageCreateJobRestriction = {"realestate"}
Config.PrivGarageEnableInteriors = true
Config.PrivGarageHideBlips = false
Config.PrivGarageBlip = {
  id = 357,
  color = 0,
  scale = 0.7
}

-- Job Garages
Config.JobGarageShowBlips = true
Config.JobGarageSetVehicleCommand = "setjobvehicle" -- admin only
Config.JobGarageRemoveVehicleCommand = "removejobvehicle" -- admin only
Config.JobGarageUniqueBlips = false
Config.JobGarageUniqueLocations = true
Config.JobGarageEnableInteriors = true
Config.JobGarageLocations = { -- IMPORTANT - Every garage name must be unique

}

-- Gang Garages (QBCore/Qbox only by default)
Config.GangEnableCustomESXIntegration = false -- Set to true if you've added a custom system to cl/sv-functions.lua
Config.GangGarageShowBlips = true
Config.GangGarageSetVehicleCommand = "setgangvehicle" -- admin only
Config.GangGarageRemoveVehicleCommand = "removegangvehicle" -- admin only
Config.GangGarageUniqueBlips = false
Config.GangGarageUniqueLocations = true
Config.GangGarageEnableInteriors = true
Config.GangGarageLocations = { -- IMPORTANT - Every garage name must be unique
  ["The Lost MC"] = {
    coords = vector3(439.18, -1518.48, 29.28),
    spawn = vector4(439.18, -1518.48, 29.28, 139.06),
    distance = 15,
    gang = {"lostmc"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use personal vehicles
  }
}

-- Impound
Config.ImpoundCommand = "iv"
Config.ImpoundFeesSocietyFund = "police", "dsd", "bcsd", "pbsd", "lssp", "lspr", "doj", "vespuccipd" -- Job name of society fund to pay impound fees into (optional)
Config.ImpoundShowBlips = true
Config.ImpoundUniqueBlips = false
Config.ImpoundTimeOptions = {0, 1, 4, 12, 24, 72, 168} -- in hours
Config.ImpoundLocations = { -- IMPORTANT - Every impound name must be unique
["Impound A"] = {
  coords = vector3(410.8, -1626.26, 29.29),
  spawn = vector4(408.44, -1630.88, 29.29, 136.88),
  distance = 15,
  type = "car", 
  job = {"police", "dsd", "bcsd", "pbsd", "lssp", "lspr", "paletopd", "state"},
  hideBlip = false,
  blip = {
    id = 68,
    color = 0,
    scale = 0.7
  },
  hideMarkers = false,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Impound B"] = {
  coords = vector3(119.36, -1069.95, 29.19),
  spawn = vector4(-470.12158203125, -619.07427978516, 31.174428939819, 87.953498840332),
  distance = 15,
  type = "car",
  job = {"police", "dsd", "bcsd", "pbsd", "lssp", "lspr", "paletopd", "state"},
  hideBlip = false,
  blip = {
    id = 68,
    color = 0,
    scale = 0.7
  },
  hideMarkers = false,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Impound C"] = {
  coords = vector3(-479.02554321289, -619.02795410156, 31.174446105957),
  spawn = vector4(-482.19171142578, -607.67492675781, 31.174425125122, 180.38366699219),
  distance = 15,
  type = "car",
  job = {"police", "dsd", "bcsd", "pbsd", "lssp", "lspr", "paletopd", "state"},
  hideBlip = false,
  blip = {
    id = 68,
    color = 0,
    scale = 0.7
  },
  hideMarkers = false,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
},
["Impound D"] = {
  coords = vector3(-455.63241577148, -959.37396240234, 23.555057525635),
  spawn = vector4(-466.87149047852, -959.37939453125, 23.555047988892, 90.286399841309),
  distance = 15,
  type = "car",
  job = {"police", "dsd", "bcsd", "pbsd", "lssp", "lspr", "paletopd", "state"},
  hideBlip = false,
  blip = {
    id = 68,
    color = 0,
    scale = 0.7
  },
  hideMarkers = false,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
}
}

-- Garage Interior
Config.GarageInteriorEntrance = vector4(227.96, -1003.06, -99.0, 0.0)
Config.GarageInteriorCameraCutscene = {
  vector4(227.96, -977.81, -98.99, 0.0), -- from
  vector4(227.96, -1006.96, -98.99, 0.0), -- to (this should be the entrance, or slightly further back from the entrance coords for a better final player transition)
}
Config.GarageInteriorVehiclePositions = {
  vector4(233.000000, -984.000000, -99.410004, 118.000000),
  vector4(233.000000, -988.500000, -99.410004, 118.000000),
  vector4(233.000000, -993.000000, -99.410004, 118.000000),
  vector4(233.000000, -997.500000, -99.410004, 118.000000),
  vector4(233.000000, -1002.000000, -99.410004, 118.000000),
  vector4(223.600006, -979.000000, -99.410004, 235.199997),
  vector4(223.600006, -983.599976, -99.410004, 235.199997),
  vector4(223.600006, -988.200012, -99.410004, 235.199997),
  vector4(223.600006, -992.799988, -99.410004, 235.199997),
  vector4(223.600006, -997.400024, -99.410004, 235.199997),
  vector4(223.600006, -1002.000000, -99.410004, 235.199997),
}

-- Staff Commands
Config.ChangeVehiclePlate = "plakadegis" -- admin only
Config.DeleteVehicleFromDB = "aracsil" -- admin only
Config.ReturnVehicleToGarage = "aracgerigetir" -- admin only

-- Add your import vehicle's spawn name and desired label here for pretty vehicle names in the garage
-- This is mainly designed for ESX - if you are using QB, do this in shared!
Config.VehicleLabels = {
  ["spawnName"] = "Pretty Vehicle Label"
}

-- Block certain vehicles from being transferred to other players
Config.PlayerTransferBlacklist = {
  "599",
  "amgh",
  "ap2",
  "cls63s",
  "FL812",
  "golf8",
  "p1gtr",
  "rmodr8c",
  "16m3f80",
  "23touring",
  "bmwg07",
  "charger21",
  "e60",
  "evo9",
  "FL918s",
  "FLclass",
  "FLe63s",
  "FLevo",
  "FLtrx",
  "gt86",
  "hurevos",
  "m3g80",
  "mercedessl63",
  "mustang19",
  "pista",
  "rmodamggt",
  "rmodmi8lb",
  "rmodpanamera2",
  "rmods63",
  "rs615",
  "sf90",
  "skyline",
  "tacoma24",
  "thebugpfl",
  "wraithb",
  "x5bmw",
  "gtrsllb",
  "gtz34",
  "mkcr33",
  "protoz",
  "rmodz350pandem",
  "rmx7hycade",
  "topfoil",
  "FLcharger",
  "FLemsf",
  "FLemsh",
  "FLspeedo",
  "FLtau",
  "adrom4",
  "DBdc_s500mansory",
  "FL812ss",
  "FLb7",
  "FLbentley",
  "FLc8",
  "FLetrongt",
  "FLm3",
  "FLrev",
  "FLrs7",
  "gcbx5",
  "mi8",
  "miniclw",
  "rs6abtp",
  "deluxo6str",
  "domgtcoupe",
  "elegyrh6",
  "elegyrh7",
  "elegy2",
  "eurosx32wb",
  "infernuswb",
  "jestgpr",
  "jugularrest",
  "schwarzer2",
  "sentinel6str2",
  "sheavas",
  "sultanrsv82",
  "sunrise1",
  "tfremus",
  "yosemite6str",
  "zr390",
  "zr3806str",
  "zrgpr",
  "africat",
  "flhxs_streetglide_sp",
  "jax2",
  "lpbagger2",
  "mt09",
  "nh2r",
  "panigale",
  "r1",
  "r6",
  "s1000rr",
  "SnBladec",
  "softail1",
  "vrodft",
  "zx10r",
  "buffalosxumk",
  "cat",
  "fattorrence",
  "hazard2",
  "ucbailer",
  "ucwashington",
  "ussssuv",
  "lapdmotor",
  "pbike",
  "centurion",
  "pdtekne",
  "22m5",
  "675ltsp",
  "911brabus",
  "c63spd",
  "f8spider",
  "f82",
  "FL488",
  "Fldemon",
  "FLe46",
  "FLram",
  "gt3hycade",
  "gtr",
  "m4comp",
  "m5g60",
  "nissantitan17",
  "rmod911gt3",
  "rmodg63",
  "rmodg900",
  "rmodgt63",
  "rmodm4gts",
  "rmodx61",
  "senna",
  "toysupmk4",
  "urus",
  "bimx",
  "FLcatcar",
  "FLraid",
  "jogger",
  "m31",
  "newsmav",
  "newsvan",
  "newsvan2",
  "sbus2",
  "sfg50fly",
  "taco2",
  "bmw8mm",
  "bmw8pd",
  "FLlambo",
  "M3BXANF",
  "rmodm8c",
  "soulcarrier",
  "polnspeedo",
  "e15082",
  "reaper1",
  "rumpo",
  "cat_car",
  "calchop",
  "cvo",
  "newsheli",
  "newsvan",
  "newsvan2",
}

Config.AutoRunSQL = true
Config.ReturnToPreviousRoutingBucket = false
Config.HideWatermark = false
Config.__v3Config = true