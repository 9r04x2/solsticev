local businesses = {
	{title = 'Mission Row Police Department', colour = 29, id = 60, coords = vector3(429.37, -1005.85, 26.86)},
	{title = 'Paleto Bay Sheriff Departmant', colour = 5, id = 60, coords = vector3(-439.46, 6020.47, 31.49)},
	{title = 'Vinewoood Police Department', colour =  29, id = 60, coords = vector3(605.83, -1.21, 150.85)},
	-- {title = 'Vespucci PD', colour =  29, id = 60, coords = vector3(-1098.89, -837.31, 61.36)},
	-- {title = 'Davis Sheriff Department', colour = 5, id = 60, coords = vector3(391.15, -1612.16, 29.29)},
	{title = 'United States Department of Justice', colour = 5, id = 60, coords = vector3(-558.8384, -200.0198, 52.2030)},
	-- {title = 'San Andreas Highway Patrol', colour = 3, id = 60, coords = vector3(1537.2164306641,820.55029296875,78.12767791748)}, 
	{title = 'Blaine County Sheriff Departmant', colour = 5, id = 60, coords = vector3(1837.7, 3671.68, 34.09)},
	{title = 'San Andreas Park Ranger', colour = 25, id = 60, coords = vector3(383.46, 788.56, 187.6)},
	{title = 'Hastane', colour = 2, id = 153, coords = vector3(1146.2422, -1549.9906, 35.0330)}, 
	-- {title = 'Şehir Hizmetleri', colour = 2, id = 682, coords = vector3(-263.94, -966.48, 31.22)}, 
	-- {title = 'Polar Ice Cream', colour = 46, id = 781, coords = vector3(278.91, 143.3, 111.4)}, 
	-- {title = "Bahama Mamas", colour = 23, id = 78, coords = vector3(-1389.26, -585.12, 30.22)},
	{title = 'Crowex Gun Shop', colour = 24, id = 110, coords = vector3(18.36, -1113.82, 42.37)}, 
	{title = 'Gun Shop', colour = 24, id = 110, coords = vector3(248.0526, -49.0715, 69.9412)}, 
	-- {title = 'Kurye', colour = 15, id = 478, coords = vector3(716.20, -974.50, 24.91)}, 
}
  
local others = {
	-- {title = 'Mega Mall', colour = 5, id = 402, coords = vector3(46.52, -1749.55, 29.64)},
	-- {title = 'Tedarikçi', colour = 2, id = 402, coords = vector3(54.94, -1739.16, 29.59)},
	-- {title = 'Kuyumcu', colour = 46, id = 679, coords = vector3(-634.23, -236.87, 37.7121)},
	{title = "Club 77", colour = 23, id = 136, coords = vector3(196.0364074707,-3167.2241210938,6.0165357589722)}, 
	{title = "Unicorn", colour = 23, id = 121, coords = vector3(122.8068, -1293.7983, 35.0098)},  
	{title = 'Galeri', colour = 0, id = 326, coords = vector3(-39.08, -1110.26, 26.44)},
	{title = 'Toptancı', colour = 0, id = 605, coords = vector3(396.84228515625,-345.50064086914,45.98412322998)}, 
}




local markett = {
    {title = "Market", colour = 2, id = 52, coords = vector3(-1505.67, 1512.29, 5.59)}, --+
    {title = "Market", colour = 2, id = 52, coords = vector3(34.5, -1346.19, 29.5)}, --+
    {title = "Market", colour = 2, id = 52, coords = vector3(-3039.91, 584.26, 17.91)}, --+
    {title = "Market", colour = 2, id = 52, coords = vector3(-3243.27, 1000.1, 12.83)}, --+
    {title = "Market", colour = 2, id = 52, coords = vector3(1728.28, 6416.03, 35.04)}, --+
    {title = "Market", colour = 2, id = 52, coords = vector3(1697.96, 4923.04, 42.06)}, --+
    {title = "Market", colour = 2, id = 52, coords = vector3(1959.6, 3740.93, 32.34)}, --+
    {title = "Market", colour = 2, id = 52, coords = vector3(549.16, 2670.35, 42.16)}, --+
    {title = "Market", colour = 2, id = 52, coords = vector3(2556.19, 380.89, 108.62)}, --+
    {title = "Market", colour = 2, id = 52, coords = vector3(-47.42, -1758.67, 29.42)}, --+
    {title = "Market", colour = 2, id = 52, coords = vector3(-706.17, -914.64, 19.22)}, --+
    {title = "Market", colour = 2, id = 52, coords = vector3(-1819.53, 793.49, 138.09)}, --+
    {title = "Market", colour = 2, id = 52, coords = vector3(1164.82, -323.66, 69.21)}, --+
	{title = "Market", colour = 2, id = 52, coords = vector3(-1221.58, -908.06, 12.33)}, --+
}

local barberss = {
    {title = "Berber", colour = 1, id = 71, coords = vector3(-814.308, -183.823, 36.568)},
    {title = "Berber", colour = 1, id = 71, coords = vector3(136.826, -1708.373, 28.291)},
    {title = "Berber", colour = 1, id = 71, coords = vector3(-1282.604, -1116.757, 5.990)},
    {title = "Berber", colour = 1, id = 71, coords = vector3(1931.513, 3729.671, 31.844)},
    {title = "Berber", colour = 1, id = 71, coords = vector3(1212.840, -472.921, 65.208)},
    {title = "Berber", colour = 1, id = 71, coords = vector3(-32.885, -152.319, 56.076)},
    {title = "Berber", colour = 1, id = 71, coords = vector3(-278.077, 6228.463, 30.695)}
}



local garages = {
	{title = 'Araç Yıkama', colour = 37, id = 100, coords = vector3(174.81, -1736.77, 28.87)},
	{title = 'Araç Yıkama', colour = 37, id = 100, coords = vector3(25.2, -1391.98, 28.91)},
	{title = 'Araç Yıkama', colour = 37, id = 100, coords = vector3(-74.27, 6427.72, 31.02)},
	{title = 'Araç Yıkama', colour = 37, id = 100, coords = vector3(1362.69, 3591.81, 34.5)},
	{title = 'Araç Yıkama', colour = 37, id = 100, coords = vector3(-699.84, -932.68, 18.59)}
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(-53.74, -1116.91, 26.43)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(-584.75, -1153.39, 22.18)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(-1566.28, -1013.52, 13.02)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(-3038.14, 105.44, 11.58)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(-1673.34, 68.12, 63.74)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(-328.6, 291.32, 86.19)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(268.6, -325.13, 44.92)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(297.22, -606.65, 43.26)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(222.56, -793.24, 30.72)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(443.14, -1026.02, 28.7)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(152.01, -1307.39, 29.2)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(38.49, -1583.38, 29.33)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(29.4, -1738.67, 29.3)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(-230.01, -1482.22, 31.36)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(-321.15, -894.75, 31.07)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(-1526.85, -424.42, 35.44)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(-98.57, 91.94, 71.79)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(59.63, 19.14, 69.3)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(380.02, 292.86, 103.17)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(-565.01, 337.84, 84.42)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(1710.28, 3770.79, 34.39)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(129.77, 6589.36, 31.94)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(844.19, -1343.35, 26.06)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(616.04, 110.62, 92.87)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(774.72, -1258.21, 26.43)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(396.87, -1624.03, 29.29)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(1828.19, 3687.0, 33.97)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(-475.11, 6032.38, 31.34)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(378.64, 773.47, 184.48)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(-525.06, -267.01, 35.29)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(152.08, -1446.41, 29.14)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(-808.04, -1313.56, 5.0)},
	-- {title = 'Garaj', colour = 38, id = 357, coords = vector3(163.19, -3006.85, 5.94)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(-1566.98, -989.48, 13.02)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(-3052.61, 137.12, 11.58)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(-1667.59, 79.99, 63.67)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(-800.56, -1298.94, 5.0)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(-349.61, 283.69, 84.93)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(295.95, -340.46, 44.92)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(441.39, -1013.87, 28.65)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(59.56, -1546.31, 29.46)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(-323.77, -879.94, 31.07)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(373.27, 283.6, 103.21)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(-580.7, 315.15, 84.79)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(-580.7, 315.15, 84.79)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(828.46, -1343.15, 26.09)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(389.96, -1611.16, 29.29)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(1847.17, 3684.98, 33.97)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(-458.44, 6044.09, 31.34)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(406.24, 790.43, 188.6)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(107.45, -1079.87, 29.19)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(-496.18, -255.37, 35.61)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(170.26, -1462.04, 29.14)},
	-- {title = 'Çekilmişler', colour = 1, id = 50, coords = vector3(163.8, -2993.55, 5.92)},
	-- {title = 'Air Garajı', colour = 50, id = 64, coords = vector3(-977.8, -2992.82, 13.95)},
	-- {title = 'Air Garajı', colour = 50, id = 64, coords = vector3(-475.05, 5988.67, 31.34)},
	-- {title = 'Air Çekilmiş', colour = 1, id = 64, coords = vector3(-1273.17, -3383.16, 13.94)}
}
  
local jobs = {
	 -- {title = 'Üzüm Toplama', colour = 7, id = 237, coords = vector3(-1842.41, 2128.03, 126.92)},
	 -- {title = 'Manav', colour = 7, id = 237, coords = vector3(-2507.18, 3613.51, 13.85)},
	 -- {title = 'Rehin Dükkanı', colour = 5, id = 266, coords = vector3(-1466.69, -1388.94, 4.14)},
}

local tattooShopss = {
    {title = "Dövmeci", colour = 1, id = 75, coords = vector3(1322.6, -1651.9, 51.2)},
    {title = "Dövmeci", colour = 1, id = 75, coords = vector3(-1153.6, -1425.6, 4.9)},
    {title = "Dövmeci", colour = 1, id = 75, coords = vector3(322.1, 180.4, 103.5)},
    {title = "Dövmeci", colour = 1, id = 75, coords = vector3(-3170.0, 1075.0, 20.8)},
    {title = "Dövmeci", colour = 1, id = 75, coords = vector3(1864.6, 3747.7, 33.0)},
    {title = "Dövmeci", colour = 1, id = 75, coords = vector3(-293.7, 6200.0, 31.4)}
}

local clothingStoress = {
    {title = "Kıyafet Mağazası", colour = 47, id = 73, coords = vector3(72.3, -1399.1, 28.4)},
    {title = "Kıyafet Mağazası", colour = 47, id = 73, coords = vector3(-703.8, -152.3, 36.4)},
    {title = "Kıyafet Mağazası", colour = 47, id = 73, coords = vector3(-167.9, -299.0, 38.7)},
    {title = "Kıyafet Mağazası", colour = 47, id = 73, coords = vector3(428.7, -800.1, 28.5)},
    {title = "Kıyafet Mağazası", colour = 47, id = 73, coords = vector3(-829.4, -1073.7, 10.3)},
    {title = "Kıyafet Mağazası", colour = 47, id = 73, coords = vector3(-1447.8, -242.5, 48.8)},
    {title = "Kıyafet Mağazası", colour = 47, id = 73, coords = vector3(11.6, 6514.2, 30.9)},
    {title = "Kıyafet Mağazası", colour = 47, id = 73, coords = vector3(123.6, -219.4, 53.6)},
    {title = "Kıyafet Mağazası", colour = 47, id = 73, coords = vector3(1696.3, 4829.3, 41.1)},
    {title = "Kıyafet Mağazası", colour = 47, id = 73, coords = vector3(618.1, 2759.6, 41.1)},
    {title = "Kıyafet Mağazası", colour = 47, id = 73, coords = vector3(1190.6, 2713.4, 37.2)},
    {title = "Kıyafet Mağazası", colour = 47, id = 73, coords = vector3(-1193.4, -772.3, 16.3)},
    {title = "Kıyafet Mağazası", colour = 47, id = 73, coords = vector3(-3172.5, 1048.1, 19.9)},
    {title = "Kıyafet Mağazası", colour = 47, id = 73, coords = vector3(-1108.4, 2708.9, 18.1)}
}

local bankss = {
    {title = "Banka", colour = 11, id = 108, coords = vector3(149.9, -1040.46, 29.37)},
    {title = "Banka", colour = 11, id = 108, coords = vector3(-1213.0, -330.39, 37.79)},
    {title = "Banka", colour = 11, id = 108, coords = vector3(-2962.71, 483.0, 15.7)},
    {title = "Banka", colour = 11, id = 108, coords = vector3(-113.22, 6470.03, 31.63)},
    {title = "Banka", colour = 11, id = 108, coords = vector3(314.23, -278.83, 54.17)},
    {title = "Banka", colour = 11, id = 108, coords = vector3(-350.8, -49.57, 49.04)},
    {title = "Banka", colour = 11, id = 108, coords = vector3(246.64, 223.20, 106.29)},
    {title = "Banka", colour = 11, id = 108, coords = vector3(1175.07, 2706.41, 38.09)}
}


local isletmee = { 
    {title = "Bean Machine", colour = 23, id = 106, coords = vector3(120.08730316162,-1033.7664794922,28.305025100708)},
	{title = "Burger Shot", colour = 23, id = 106, coords = vector3(-1176.17, -877.39, 14.03)},
	-- {title = "Horny`s Burger", colour = 23, id = 104, coords = vector3(1242.8958, -360.7559, 69.0822)},
	-- {title = "Koi", colour = 23, id = 835, coords = vector3(-1041.07, -1473.05, 5.2)},
	-- {title = "Sun Cafe", colour = 23, id = 766, coords = vector3(-1377.73, -937.64, 16.2)}, 
	--{title = "Coffe Cute", colour = 27, id = 621, coords = vector3(-285.3479309082,-63.197845458984,50.454132080078)},
	{title = "Uwu Cafe", colour = 23, id = 621, coords = vector3(-586.81, -1094.23, 22.18)},
	{title = "Tequi-la-la", colour = 23, id = 79, coords = vector3(-556.22, 274.1, 83.02)},
	{title = "Hotbox", colour = 23, id = 140, coords = vector3(-35.8579, -1663.3214, 29.4916)},
	{title = 'YellowJack', colour = 23, id = 621, coords = vector3(1986.0827636719,3044.3256835938,47.141574859619)},
	-- {title = 'Cranberry', colour = 46, id = 93, coords = vector3(-1083.12, -315.56, 37.82)},
	{title = "Irish Pub", colour = 23, id = 305, coords = vector3(834.04, -112.95, 79.77)},

	
}

local mekanikk = {
    {title = "Pitstop Mechanic", colour = 46, id = 446, coords = vector3(944.61, -1560.08, 32.71)},
    {title = "LS Custom Mechanic", colour = 46, id = 446, coords = vector3(-337.01513671875,-136.04777526855,38.009643554688)},
    {title = "Mechanic", colour = 46, id = 446, coords = vector3(-202.5626373291,-1313.0032958984,38.963439941406)},
    {title = "Captival Mechanic", colour = 46, id = 446, coords = vector3(143.1221, -3032.2388, 7.0799)},
    {title = "Sugar Mechanic", colour = 46, id = 446, coords = vector3(-566.4815, -931.9654, 23.8866)},
    {title = "Afterlife Mechanic", colour = 46, id = 446, coords = vector3(904.5936, -2524.2480, 28.3226)},
    -- {title = "Ottos Mechanic", colour = 46, id = 446, coords = vector3(831.84, -819.89, 26.33)},
}

  
local all = false
local garage = false
local other = false
local entertainment = false
local job = false
local market = false
local barbers = false
local tattooShops = false
local clothingStores = false
local banks = false
local isletme = false
local mekanik = false



RegisterNetEvent('qb-radialmenu:blips:jobs')
AddEventHandler('qb-radialmenu:blips:jobs', function()
	job = not job
	for _, info in pairs(jobs) do
		if job then
			info.blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
			SetBlipSprite(info.blip, info.id)
			SetBlipDisplay(info.blip, 4)
			SetBlipScale(info.blip, 0.5)
			SetBlipColour(info.blip, info.colour)
			SetBlipAsShortRange(info.blip, true)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(info.title)
			EndTextCommandSetBlipName(info.blip)
		else
			RemoveBlip(info.blip)
		end
	end
	if job then
		QBCore.Functions.Notify('Meslek blipleri aktif edildi.', 'success')
	else
		QBCore.Functions.Notify('Meslek blipleri deaktif edildi.', 'success')
	end
end)

RegisterNetEvent('qb-radialmenu:blips:toggleAll')
AddEventHandler('qb-radialmenu:blips:toggleAll', function()
	all = not all

	local categories = {jobs, bankss, mekanikk, clothingStoress, tattooShopss, barberss, businesses, others, garages, isletmee, markett}

	for _, category in ipairs(categories) do
		for _, info in pairs(category) do
			if all then
				info.blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
				SetBlipSprite(info.blip, info.id)
				SetBlipDisplay(info.blip, 4)
				SetBlipScale(info.blip, 0.5)
				SetBlipColour(info.blip, info.colour)
				SetBlipAsShortRange(info.blip, true)
				BeginTextCommandSetBlipName('STRING')
				AddTextComponentString(info.title)
				EndTextCommandSetBlipName(info.blip)
			else
				RemoveBlip(info.blip)
			end
		end
	end
	
	if all then
		QBCore.Functions.Notify('Tüm blipler aktif edildi.', 'success')
	else
		QBCore.Functions.Notify('Tüm blipler deaktif edildi.', 'success')
	end
end)


RegisterNetEvent('qb-radialmenu:blips:banks')
AddEventHandler('qb-radialmenu:blips:banks', function()
	banks = not banks
	for _, info in pairs(bankss) do
		if banks then
			info.blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
			SetBlipSprite(info.blip, info.id)
			SetBlipDisplay(info.blip, 4)
			SetBlipScale(info.blip, 0.5)
			SetBlipColour(info.blip, info.colour)
			SetBlipAsShortRange(info.blip, true)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(info.title)
			EndTextCommandSetBlipName(info.blip)
		else
			RemoveBlip(info.blip) 
		end
	end
	if banks then
		QBCore.Functions.Notify('Banka blipleri aktif edildi.', 'success')
	else
		QBCore.Functions.Notify('Banka blipleri deaktif edildi.', 'success')
	end
end)


RegisterNetEvent('qb-radialmenu:blips:mekanik')
AddEventHandler('qb-radialmenu:blips:mekanik', function()
	mekanik = not mekanik
	for _, info in pairs(mekanikk) do
		if mekanik then
			info.blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
			SetBlipSprite(info.blip, info.id)
			SetBlipDisplay(info.blip, 4)
			SetBlipScale(info.blip, 0.5)
			SetBlipColour(info.blip, info.colour)
			SetBlipAsShortRange(info.blip, true)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(info.title)
			EndTextCommandSetBlipName(info.blip)
		else
			RemoveBlip(info.blip) 
		end
	end
	if mekanik then
		QBCore.Functions.Notify('Mekanik blipleri aktif edildi.', 'success')
	else
		QBCore.Functions.Notify('Mekanik blipleri deaktif edildi.', 'success')
	end
end)

RegisterNetEvent('qb-radialmenu:blips:kiyafet')
AddEventHandler('qb-radialmenu:blips:kiyafet', function()
	clothingStores = not clothingStores
	for _, info in pairs(clothingStoress) do
		if clothingStores then
			info.blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
			SetBlipSprite(info.blip, info.id)
			SetBlipDisplay(info.blip, 4)
			SetBlipScale(info.blip, 0.5)
			SetBlipColour(info.blip, info.colour)
			SetBlipAsShortRange(info.blip, true)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(info.title)
			EndTextCommandSetBlipName(info.blip)
		else
			RemoveBlip(info.blip) 
		end
	end
	if clothingStores then
		QBCore.Functions.Notify('Meslek blipleri aktif edildi.', 'success')
	else
		QBCore.Functions.Notify('Meslek blipleri deaktif edildi.', 'success')
	end
end)

RegisterNetEvent('qb-radialmenu:blips:tatto')
AddEventHandler('qb-radialmenu:blips:tatto', function()
	tattooShops = not tattooShops
	for _, info in pairs(tattooShopss) do
		if tattooShops then
			info.blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
			SetBlipSprite(info.blip, info.id)
			SetBlipDisplay(info.blip, 4)
			SetBlipScale(info.blip, 0.5)
			SetBlipColour(info.blip, info.colour)
			SetBlipAsShortRange(info.blip, true)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(info.title)
			EndTextCommandSetBlipName(info.blip)
		else
			RemoveBlip(info.blip)
		end
	end
	if tattooShops then
		QBCore.Functions.Notify('Dövmeci blipleri aktif edildi.', 'success')
	else
		QBCore.Functions.Notify('Dövmeci blipleri deaktif edildi.', 'success')
	end
end)

RegisterNetEvent('qb-radialmenu:blips:barbers')
AddEventHandler('qb-radialmenu:blips:barbers', function()
	barbers = not barbers
	for _, info in pairs(barberss) do
		if barbers then
			info.blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
			SetBlipSprite(info.blip, info.id)
			SetBlipDisplay(info.blip, 4)
			SetBlipScale(info.blip, 0.5)
			SetBlipColour(info.blip, info.colour)
			SetBlipAsShortRange(info.blip, true)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(info.title)
			EndTextCommandSetBlipName(info.blip)
		else
			RemoveBlip(info.blip)
		end
	end
	if barbers then
		QBCore.Functions.Notify('Berber blipleri aktif edildi.', 'success')
	else
		QBCore.Functions.Notify('Berber blipleri deaktif edildi.', 'success')
	end
end)

RegisterNetEvent('qb-radialmenu:blips:businesses')
AddEventHandler('qb-radialmenu:blips:businesses', function()
	bussines = not bussines
	for _, info in pairs(businesses) do
		if bussines then
			info.blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
			SetBlipSprite(info.blip, info.id)
			SetBlipDisplay(info.blip, 4)
			SetBlipScale(info.blip, 0.5)
			SetBlipColour(info.blip, info.colour)
			SetBlipAsShortRange(info.blip, true)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(info.title)
			EndTextCommandSetBlipName(info.blip)
		else
			RemoveBlip(info.blip)
		end
	end
	if bussines then
		QBCore.Functions.Notify('İşletme blipleri aktif edildi.', 'success')
	else
		QBCore.Functions.Notify('İşletme blipleri deaktif edildi.', 'success')
	end
end)

RegisterNetEvent('qb-radialmenu:blips:others')
AddEventHandler('qb-radialmenu:blips:others', function()
	other = not other
	for _, info in pairs(others) do
		if other then
			info.blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
			SetBlipSprite(info.blip, info.id)
			SetBlipDisplay(info.blip, 4)
			SetBlipScale(info.blip, 0.5)
			SetBlipColour(info.blip, info.colour)
			SetBlipAsShortRange(info.blip, true)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(info.title)
			EndTextCommandSetBlipName(info.blip)
		else
			RemoveBlip(info.blip)
		end
	end
	if other then
		QBCore.Functions.Notify('Diğer farklı blipler aktif edildi.', 'success')
	else
		QBCore.Functions.Notify('Diğer farklı blipler deaktif edildi.', 'success')
	end
end)
 

RegisterNetEvent('qb-radialmenu:blips:garages')
AddEventHandler('qb-radialmenu:blips:garages', function()
	garage = not garage
	for _, info in pairs(garages) do
		if garage then
			info.blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
			SetBlipSprite(info.blip, info.id)
			SetBlipDisplay(info.blip, 4)
			SetBlipScale(info.blip, 0.5)
			SetBlipColour(info.blip, info.colour)
			SetBlipAsShortRange(info.blip, true)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(info.title)
			EndTextCommandSetBlipName(info.blip)
		else
			RemoveBlip(info.blip)
		end
	end
	if garage then
		QBCore.Functions.Notify('Garaj blipleri aktif edildi.', 'success')
	else
		QBCore.Functions.Notify('Garaj blipleri deaktif edildi.', 'success')
	end
end)


RegisterNetEvent('qb-radialmenu:blips:isletme')
AddEventHandler('qb-radialmenu:blips:isletme', function()
	isletme = not isletme
	for _, info in pairs(isletmee) do
		if isletme then
			info.blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
			SetBlipSprite(info.blip, info.id)
			SetBlipDisplay(info.blip, 4)
			SetBlipScale(info.blip, 0.5)
			SetBlipColour(info.blip, info.colour)
			SetBlipAsShortRange(info.blip, true)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(info.title)
			EndTextCommandSetBlipName(info.blip)
		else
			RemoveBlip(info.blip)
		end
	end
	if isletme then
		QBCore.Functions.Notify('İşletme blipleri aktif edildi.', 'success')
	else
		QBCore.Functions.Notify('İşletme blipleri deaktif edildi.', 'success')
	end
end)
    

RegisterNetEvent('qb-radialmenu:blips:market')
AddEventHandler('qb-radialmenu:blips:market', function()
	market = not market
	for _, info in pairs(markett) do
		if market then
			info.blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
			SetBlipSprite(info.blip, info.id)
			SetBlipDisplay(info.blip, 4)
			SetBlipScale(info.blip, 0.5)
			SetBlipColour(info.blip, info.colour)
			SetBlipAsShortRange(info.blip, true)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(info.title)
			EndTextCommandSetBlipName(info.blip)
		else
			RemoveBlip(info.blip)
		end
	end
	if market then
		QBCore.Functions.Notify('Market blipleri aktif edildi.', 'success')
	else
		QBCore.Functions.Notify('Market blipleri deaktif edildi.', 'success')
	end
end)
    
