Config = {}

--[[
    Supported frameworks:
        * esx: es_extended, https://github.com/esx-framework/esx-legacy
        * qb: qb-core, https://github.com/qbcore-framework/qb-core
        * standalone: no framework, some functions will not be supported without any additional tuning
]]
Config.Framework = "qb"

-- The locale the notifications are in and the fallback locale in case user specifies an unsupported locale.
Config.Locale = "en"

-- If you want to override the app name, regardless of locales,
Config.OverrideAppName = "Fatura" -- "Billing"

-- If the app should be downloaded by default.
Config.DefaultApp = true

-- Disable standalone UI
Config.DisableStandaloneUI = false

-- The default keybind you yse to show the billing app if standalone (not lb-phnoe)
Config.DefaultKeybind = "f7"

-- The requireed grade to send/pay company invoices. Default is "boss"
--  ** If you want to disable a certain grade from paying or cancelling invoices, specify a table with `false` as a second value as so: { "my_grade", false }
Config.Grades = {
	cardealer = { "all" },
	police = { "all" },
	usmarshal = { "all" },
	vespuccipd = { "all" },
	bcsd = { "all" },
	pbsd = { "all" },
	lssp = { "all" },
	lspr = { "all" },
	dsd = { "all" },
	doj = { "all" },
	ambulance = { "all" },
	blacklotus = { "all" },
	blacklotus2 = { "all" },
	mechanic_bennys = { "all" },
	mechanic_lscustom = { "all" },
	mechanic_lscustom2 = { "all" },
	mechanic_airport = { "all" },
	mechanic_oldhayes = { "all" },
	mechanic_hayes = { "all" },
	mechanic_japanese = { "all" },
	mechanic_illegal = { "all" },
	sons = { "all" },
	mechanic_ottos = { "all" },
	mprestaurant = { "all" },
	uwucafe = { "all" },
	wedshop = { "all" },
	pondcafe = { "all" },
	grancafe = { "all" },
	nightclub = { "all" },
	club77 = { "all" },
	mai10 = { "all" },
	beanmachine = { "all" },
	popeyes = { "all" },
	koi = { "all" },
	plaza = { "all" },
	pizza = { "all" },
	coolcafe = { "all" },
	susi = { "all" },
	unicorn = { "all" },
	burgershot = { "all" },
	taco = { "all" },
	bahama = { "all" },
	ballas = { "all" },
	atom = { "all" },
	icecream = { "all" },
	jons = { "all" },
	iskelebar = { "all" },
	motor = { "all" },
	yellowjack = { "all" },
	tequila = { "all" },
	irishpub = { "all" },
	club77 = { "all" },
	ammunation = { "all" },
	gunshop_one = { "all" },
	gunshop_two = { "all" },
	gunshop_thre = { "all" },
	redline = { "all" },
	usedcar = { "all" },
	cardealer = { "all" },
	cryptoexchange = { "all" },
	realestate = { "all" },
	vibecafe = { "all" },
	tacir = { "all" },
	taxi = { "all" },
}

-- You can specify societies which should be blacklisted from the billing funcitonality.
Config.Blacklisted = {
    tailor = { send = false, receive = false },
    fueler = { send = false, receive = false },
    slaughterer = { send = false, receive = false },
    lumberjack = { send = false, receive = false }
}

-- You can add commission rates for each grade for every invoice they send, especially handy for car dealerships and similar professions.
Config.Commission = {
    cardealer = {
        recruit = 0.05,
        novice = 0.15,
        experienced = 0.3,
        boss = 0.0
    }
}

Config.Functions = {
    SentInvoice = function(source, invoice)
    end,
    CancelledInvoice = function(source, invoice)
    end,
    PaidInvoice = function(source, invoice)
    end,
}
