Config = {}
Config.Enable = {}
Config.Timer = {}

Config.IhbarDistance = 2500.0
---------------------------------------------------------------
Config.Locale = 'en'
Config.CheckVersion = false
Config.CheckVersionDelay = 60 -- Minutes

-- use phone_number instead of player name for 911 calls
Config.PhoneNumber = true

-- use mdt notifications for 911 calls instead of WF_Alerts
Config.Default911 = false

-- enable alerts when cops break the law and print to console
Config.Debug = false

-- sets report chance to 100%
Config.DebugChance = false

-- enable default alerts
Config.Enable.Speeding = false
Config.Enable.Shooting = true
Config.Enable.Autotheft = true
Config.Enable.Melee = false
Config.Enable.PlayerDowned = true
---------------------------------------------------------------

Citizen.CreateThread(function()
    if notLoaded then
        for k, v in pairs(Config.Enable) do
            if Config.Enable[k] ~= false then
                Config[k] = {}
                Config.Timer[k] = 0 -- Default to 0 seconds
                Config[k].Success = 300 -- Default to 30 seconds
                Config[k].Fail = 20 -- Default to 2 seconds
            end
        end
        -- If you want to set specific timers, do it here
        if Config.Shooting then
            Config.Shooting.Success = 100 -- 10 seconds
            Config.Shooting.Fail = 0 -- 0 seconds
        end
            
        notLoaded = nil
    end

    Config.WeaponBlacklist = {
        'WEAPON_GRENADE',
        'WEAPON_BZGAS',
        'WEAPON_PAINTBALL',
        'WEAPON_MOLOTOV',
        'WEAPON_STICKYBOMB',
        'WEAPON_PROXMINE',
        'WEAPON_SNOWBALL',
        'WEAPON_PIPEBOMB',
        'WEAPON_BALL',
        'WEAPON_SMOKEGRENADE',
        'WEAPON_FLARE',
        'WEAPON_PETROLCAN',
        'WEAPON_FIREEXTINGUISHER',
        'WEAPON_HAZARDCAN',
        'WEAPON_ACIDPACKAGE',
        'WEAPON_RAYCARBINE',
        'WEAPON_P226',
        'WEAPON_STUNGUN'
    }

    Config.Colours = {
        ['0'] = "Metalik Siyah",
        ['1'] = "Metalik Grafit Siyah",
        ['2'] = "Metalik Siyah Çelik",
        ['3'] = "Metalik Koyu Gümüş",
        ['4'] = "Metalik Gümüş",
        ['5'] = "Metalik Mavi Gümüş",
        ['6'] = "Metalik Çelik Gri",
        ['7'] = "Metalik Gölge Gümüş",
        ['8'] = "Metalik Taş Gümüş",
        ['9'] = "Metalik Geceyarısı Gümüş",
        ['10'] = "Metalik Siyah Metal",
        ['11'] = "Metalik Antrasit Gri",
        ['12'] = "Mat Siyah",
        ['13'] = "Mat Gri",
        ['14'] = "Mat Açık Gri",
        ['15'] = "Siyah",
        ['16'] = "Siyah Poli",
        ['17'] = "Koyu Gümüş",
        ['18'] = "Gümüş",
        ['19'] = "Siyah Metal",
        ['20'] = "Gölge Gümüş",
        ['21'] = "Eskimiş Siyah",
        ['22'] = "Eskimiş Grafit",
        ['23'] = "Eskimiş Gümüş Gri",
        ['24'] = "Eskimiş Gümüş",
        ['25'] = "Eskimiş Mavi Gümüş",
        ['26'] = "Eskimiş Gölge Gümüş",
        ['27'] = "Metalik Kırmızı",
        ['28'] = "Metalik Torino Kırmızı",
        ['29'] = "Metalik Formula Kırmızı",
        ['30'] = "Metalik Ateş Kırmızı",
        ['31'] = "Metalik Zarif Kırmızı",
        ['32'] = "Metalik Grena Kırmızı",
        ['33'] = "Metalik Çöl Kırmızı",
        ['34'] = "Metalik Cabernet Kırmızı",
        ['35'] = "Metalik Şeker Kırmızı",
        ['36'] = "Metalik Gündoğumu Turuncu",
        ['37'] = "Metalik Klasik Altın",
        ['38'] = "Metalik Turuncu",
        ['39'] = "Mat Kırmızı",
        ['40'] = "Mat Koyu Kırmızı",
        ['41'] = "Mat Turuncu",
        ['42'] = "Mat Sarı",
        ['43'] = "Kırmızı",
        ['44'] = "Parlak Kırmızı",
        ['45'] = "Garnet Kırmızı",
        ['46'] = "Eskimiş Kırmızı",
        ['47'] = "Eskimiş Altın Kırmızı",
        ['48'] = "Eskimiş Koyu Kırmızı",
        ['49'] = "Metalik Koyu Yeşil",
        ['50'] = "Metalik Yarış Yeşil",
        ['51'] = "Metalik Deniz Yeşil",
        ['52'] = "Metalik Zeytin Yeşil",
        ['53'] = "Metalik Yeşil",
        ['54'] = "Metalik Benzin Yeşil",
        ['55'] = "Mat Limon Yeşil",
        ['56'] = "Koyu Yeşil",
        ['57'] = "Yeşil",
        ['58'] = "Eskimiş Koyu Yeşil",
        ['59'] = "Eskimiş Yeşil",
        ['60'] = "Eskimiş Deniz Mavi",
        ['61'] = "Metalik Geceyarısı Mavi",
        ['62'] = "Metalik Koyu Mavi",
        ['63'] = "Metalik Saxon Mavi",
        ['64'] = "Metalik Mavi",
        ['65'] = "Metalik Marine Mavi",
        ['66'] = "Metalik Liman Mavi",
        ['67'] = "Metalik Elmas Mavi",
        ['68'] = "Metalik Dalga Mavi",
        ['69'] = "Metalik Deniz Mavi",
        ['70'] = "Metalik Parlak Mavi",
        ['71'] = "Metalik Mor Mavi",
        ['72'] = "Metalik Fırıldak Mavi",
        ['73'] = "Metalik Ultra Mavi",
        ['74'] = "Metalik Parlak Mavi",
        ['75'] = "Koyu Mavi",
        ['76'] = "Geceyarısı Mavi",
        ['77'] = "Mavi",
        ['78'] = "Deniz Köpüğü Mavi",
        ['79'] = "Yıldırım Mavi",
        ['80'] = "Maun Mavi Poli",
        ['81'] = "Parlak Mavi",
        ['82'] = "Mat Koyu Mavi",
        ['83'] = "Mat Mavi",
        ['84'] = "Mat Geceyarısı Mavi",
        ['85'] = "Eskimiş Koyu Mavi",
        ['86'] = "Eskimiş Mavi",
        ['87'] = "Eskimiş Açık Mavi",
        ['88'] = "Metalik Taksi Sarı",
        ['89'] = "Metalik Yarış Sarı",
        ['90'] = "Metalik Bronz",
        ['91'] = "Metalik Sarı Kuş",
        ['92'] = "Metalik Limon",
        ['93'] = "Metalik Şampanya",
        ['94'] = "Metalik Pueblo Bej",
        ['95'] = "Metalik Koyu Fildişi",
        ['96'] = "Metalik Çikolata Kahverengi",
        ['97'] = "Metalik Altın Kahverengi",
        ['98'] = "Metalik Açık Kahverengi",
        ['99'] = "Metalik Hasır Bej",
        ['100'] = "Metalik Bataklık Kahverengi",
        ['101'] = "Metalik Biston Kahverengi",
        ['102'] = "Metalik Kayın Ağacı",
        ['103'] = "Metalik Koyu Kayın Ağacı",
        ['104'] = "Metalik Çikolata Turuncu",
        ['105'] = "Metalik Sahil Kumu",
        ['106'] = "Metalik Güneşte Ağartılmış Kum",
        ['107'] = "Metalik Krem",
        ['108'] = "Kahverengi",
        ['109'] = "Medium Kahverengi",
        ['110'] = "Açık Kahverengi",
        ['111'] = "Metalik Beyaz",
        ['112'] = "Metalik Buz Beyaz",
        ['113'] = "Eskimiş Bal Bej",
        ['114'] = "Eskimiş Kahverengi",
        ['115'] = "Eskimiş Koyu Kahverengi",
        ['116'] = "Eskimiş Saman Bej",
        ['117'] = "Fırçalanmış Çelik",
        ['118'] = "Fırçalanmış Siyah Çelik",
        ['119'] = "Fırçalanmış Alüminyum",
        ['120'] = "Krom",
        ['121'] = "Eskimiş Kirli Beyaz",
        ['122'] = "Kirli Beyaz",
        ['123'] = "Eskimiş Turuncu",
        ['124'] = "Eskimiş Açık Turuncu",
        ['125'] = "Metalik Securicor Yeşil",
        ['126'] = "Eskimiş Taksi Sarı",
        ['127'] = "Polis Mavi",
        ['128'] = "Mat Yeşil",
        ['129'] = "Mat Kahverengi",
        ['130'] = "Eskimiş Turuncu",
        ['131'] = "Mat Beyaz",
        ['132'] = "Eskimiş Beyaz",
        ['133'] = "Eskimiş Ordu Yeşil",
        ['134'] = "Saf Beyaz",
        ['135'] = "Sıcak Pembe",
        ['136'] = "Somon Pembesi",
        ['137'] = "Metalik Vermilyon Pembe",
        ['138'] = "Turuncu",
        ['139'] = "Yeşil",
        ['140'] = "Mavi",
        ['141'] = "Metalik Siyah Mavi",
        ['142'] = "Metalik Siyah Mor",
        ['143'] = "Metalik Siyah Kırmızı",
        ['144'] = "Avcı Yeşil",
        ['145'] = "Metalik Mor",
        ['146'] = "Metalik Koyu Mavi",
        ['147'] = "Siyah",
        ['148'] = "Mat Mor",
        ['149'] = "Mat Koyu Mor",
        ['150'] = "Metalik Lava Kırmızı",
        ['151'] = "Mat Orman Yeşil",
        ['152'] = "Mat Haki",
        ['153'] = "Mat Çöl Kahverengi",
        ['154'] = "Mat Çöl Bronzu",
        ['155'] = "Mat Yaprak Yeşil",
        ['156'] = "Varsayılan Alaşım Rengi",
        ['157'] = "Epsilon Mavi",
        ['158'] = "Saf Altın",
        ['159'] = "Fırçalanmış Altın",
        ['160'] = "MP100"
    }

end)
