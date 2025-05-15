Config = {}

Config.TimeFormat = 0 -- 0 = ZULU (UTC), 1 = Oyun İçi Zaman, 2 = OS Zamanı (Yerel Zaman)
Config.DateFormat = 1 -- 0 = AA/GG/YY, 1 = GG/AA/YY, 2 = YY/AA/GG, 3 = GG-Ay-YYYY

Config.PlaySounds = true
Config.PlayCameraMovementSounds = true   -- Eğer true ise, helikopter kamerasını hareket ettirdiğinizde sesler çalınır
Config.DisablePoliceScanner = true -- Eğer true ise, polis radyo/tarayıcı/çağrı sesleri devre dışı bırakılır.
Config.DisableFlightMusic = true -- Eğer true ise, uçuş sırasında çalan müzik devre dışı bırakılır.

Config.CameraTransition = true -- Eğer true ise, kameraya girerken/çıkarken kamera yavaşça hareket eder
Config.CameraTransitionTime = 1000 -- Geçiş süresi (milisaniye cinsinden)

Config.CameraTimecycle = false -- false veya "string" ("Broken_camera_fuzz", "CAMERA_BW", "CAMERA_secuirity", "secret_camera" veya geçerli bir timecycle: https://wiki.rage.mp/index.php?title=Timecycle_Modifiers)
Config.CameraTimecycleStrength = 0.5 -- 0.0'dan 1.0'a kadar, kamera timecycle gücü, sadece Config.CameraTimecycle bir string olarak ayarlanmışsa kullanılır.

Config.ShowLatitudeLongitude = false -- Eğer true olarak ayarlanırsa, enlem/boylam gösterilir, aksi takdirde sokak ve bölge gösterilir
Config.TargetMaxReach = 424.0 -- Bir varlığı hedefleyebileceğimiz maksimum mesafe (424, bir oyuncunun düzenli olarak görünebileceği maksimum mesafedir, pratik olarak bu kadar uzağa ulaşmanız mümkün olmayacaktır)

Config.ForceCameraLabel = false -- false veya "Etiket"
Config.CanUseAnyHelicopter = true -- Eğer true ise, herhangi bir helikopter kullanılabilir, eğer false ise sadece Config.Helicopters tablosunda belirtilen helikopterler kullanılabilir.

Config.AllowCameraLock = true -- Eğer true ise, kamera yere/hedeflere kilitlenebilir
Config.InstantCameraLock = false -- Eğer true ise, kamera hedefe hemen kilitlenir, aksi takdirde bir bekleme süresi gerektirir
Config.AllowCameraLockOnGround = true -- Eğer true ise, kamera yere/binalara vb. kilitlenebilir.
Config.CameraLockBreakTicks = 3 -- Kamera, noktayı/kişiyi/aracı kaybetmeden önce görselin kaç karelik bir kayba uğrayabileceği maksimum değer.
-- Eğer true ise, bir varlığa kilitlendiğinde merkeze kilitlenir, eğer false ise, kamera kilitlenmeden hemen önce hedef aldığınız varlık kısmına kilitlenir.
Config.LockOntoCenter = {
    Peds = true, -- Bu false olduğunda mükemmel çalışmama eğilimindedir.
    Vehicles = true
}

Config.ShowLicensePlate = true -- (Plaka)
Config.CheckLicensePlateAngle = true -- Eğer true ise, helikopter kamerası ile plaka arasındaki açıyı kontrol eder. Bu, plaka net bir şekilde görülmediğinde oyuncunun plakayı okuyamamasına neden olur.
Config.OnlyShowPlateIfLocked = false -- Eğer true ise, plaka sadece araç kilitlendiğinde gösterilir.

Config.WhitelistedJobs = false -- Eğer false ise, script iş kontrolü yapmaz. Eğer iş kontrolü yapmak istiyorsanız, iş anahtarının iş olduğu ve değerinin iş seviyesi olduğu bir tablo ekleyin, örneğin: Config.WhitelistedJobs = { ['police'] = 2, ['ambulance'] = 5 }
Config.ShowMessageIfWrongJob = true -- Eğer true ise, doğru işe sahip olmadan kameraya girmeye çalışırsanız bir hata mesajı görüntülenir, eğer false ise hiçbir mesaj gösterilmez, sadece kameraya girmenize izin verilmez.

-- false = Herkes kamerayı kullanabilir (pilot dahil), 1 = Herhangi bir yolcu (pilot hariç) kamerayı kullanabilir, 2 = Sadece arka yolcular kamerayı kullanabilir
Config.PassengerOnly = true

Config.ShowPostalCodes = false -- Kameradayken posta kodlarını gösterir (Bu biraz kaynak yoğun olabilir)
Config.PostalResource = "nearest-postal" -- Posta dosyasının bulunduğu kaynak (kaynak, helicam'den önce yüklenmelidir ve dosyalar nearest-postal gibi formatlanmalıdır)
Config.PostalFile = "new-postals.json" -- MUTLAKA bir JSON dosyası olmalıdır! (Not: Dosya, helicam scriptinin okuyabilmesi için Config.PostalResource'un fxmanifest'inde yüklenmiş olmalıdır)

-- Helikopter/uçak içindeyken bir ses altmix'i ekler (gürültü bastırma) (NOT: Tüm helikopterler/uçaklar için uygulanır, sadece kamera olanlar için değil)
Config.UseSubmix = false
Config.NoSubmixInCamera = false -- Sadece Config.UseSubmix true olarak ayarlandığında uygulanır, eğer true ise, kamera kullanırken submix durdurulur

-- Eğer true ise, oyuncular, destekleyen helikopterlerden ip inişi yapabilirler.
Config.AllowRappeling = true

-- Script, bazı sohbet komutları için sohbet önerileri eklemelidir.
Config.AddChatSuggestions = true
-- Projektör
Config.AllowSpotlight = true
Config.MaxAmountOfSpotlights = false -- false veya numara, sunucuda aynı anda izin verilen maksimum projektör sayısını ayarlar (global limit)
Config.Spotlight = {
    Colour = { R = 255, G = 255, B = 255 }, -- Projektörün RGB renk değerleri, örneğin, { R = 220, G = 220, B = 255 } gibi biraz daha mavi yapabilirsiniz
    MaxDistance = 600.0,                    -- Projektörün parlayacağı maksimum mesafe
    DefaultBrightness = 5.0,                -- Projektörün varsayılan parlaklığı
    MinBrightness = 0.5,                    -- Projektörün minimum parlaklığı
    MaxBrightness = 20.0,                   -- Projektörün maksimum parlaklığı
    BrightnessIncrements = 0.75,            -- Projektörün parlaklığını ayarlarken ne kadar değişiklik yapılacağı
    Roundness = 2.0,                        -- Projektörün "yuvarlaklığı"
    DefaultRadius = 10.0,                   -- Projektörün varsayılan yarıçapı/büyüklüğü
    MinRadius = 5.0,                        -- Projektörün minimum yarıçapı
    MaxRadius = 15.0,                       -- Projektörün maksimum yarıçapı
    RadiusIncrements = 0.75,                -- Projektörün yarıçapını ayarlarken ne kadar değişiklik yapılacağı
    Falloff = 200.0,                        -- 
}

Config.HideMinimap = false
Config.ZoomBarOffset = 20 -- Minimap etkinleştirildiğinde zoom çubuğunun ekranın altından % kaç uzaklıkta olacağı. (Minimap'in üst kısmında bir şey varsa 25 genellikle iyi çalışır)
Config.TargetBlip = {
    Display = true,
    Sprite = 390,
    Colour = 40
}

Config.AllowNightVision = true
Config.AllowNightVisionDuringDay = false -- Gece görüşünün gündüz etkinleştirilip etkinleştirilemeyeceği.
Config.AllowThermal = true
Config.ThermalOptions = {
    MaxThickness = 1.0, -- 1.0 = Varsayılan GTA, çok fazla şeyi göremez. 20.0 = Çoğu ince duvarın içinden görülebilir, ancak yerin veya birden fazla/kalın duvarların içinden görülemez.
    MinNoise = 0.0, -- Minimum arka plan gürültüsü
    MaxNoise = 0.1, -- Maksimum arka plan gürültüsü
    FadeStart = 5000.0, -- "Arka plan" solmasının başlaması gereken mesafe (metre)
    FadeEnd = 6000.0 -- "Arka plan" solmasının katı hale gelmesi gereken mesafe (metre)
}

Config.AllowMarkers = true
Config.Marker = {
    MaxAmount = 9, -- 9'dan yukarıda sayısal işaretler devre dışı bırakılmalıdır.
    MaxDrawDistance = 1000.0, -- Bir işaretin çizileceği en uzak mesafe.
    Circle = {
        Type = 23,
        Scale = 8.0,
        Colour = { R = 230, G = 50, B = 50, A = 200 } -- { R = 110, G = 160, B = 230, A = 200 }
    },
    Number = {
        Display = true, -- Eğer bu false olarak ayarlanırsa, işaretlerin maksimum sayısını 9'un üzerine çıkarabilirsiniz
        Scale = 6.0,
        Colour = { R = 230, G = 50, B = 50, A = 200 }
    },
    Blip = {
        Display = true, -- İşaret bliplerinin gösterilip gösterilmeyeceği
        Number = true, -- Blip üzerinde numaranın gösterilip gösterilmeyeceği (99 sınırı)
        Sprite = 57,
        Scale = 0.75,
        Colour = 1, -- Kırmızı
    }
}

Config.UseAnimProp = true -- Eğer true ise, oyuncular kamerayı kullanırken ellerinde bir tablet bulunduracaklar
Config.Tablet = {
    model = -1585232418, -- prop_cs_tablet
    anim = {
        dict = "amb@world_human_seat_wall_tablet@female@base",
        name = "base"
    },
    bone = 57005, -- SKEL_R_Hand
    offset = vector3(0.17, 0.10, -0.13),
    rotation = vector3(20.0, 180.0, 180.0)
}

Config.ShowInstructions = false -- Eğer true ise, kameradayken talimatlar gösterilir
-- Bu web sitesini kullanarak kontrolleri buldum (~INPUT_5D25DCCD~ örneğin): http://tools.povers.fr/hashgenerator/
-- 0 = Sağda, 3+ = Solda.
Config.InstructionButtons = {
    -- [0] = { control = "~INPUT_5D25DCCD~", label = "Projektör Parlaklığını Ayarla (scroll +)" },
    -- [1] = { control = "~INPUT_F8C9FB3A~", label = "Projektör Çapını Ayarla (scroll +)" },
    -- [2] = { control = "~INPUT_DB481F5~", label = "Kamerayı Kilitle" }, -- Bu neden çalışmıyor bilmiyorum...
    [0] = { control = "~INPUT_662F7BF5~", label = "İşaret Ekle/Kaldır" },
    [1] = { control = "~INPUT_DB471A88~", label = "Görüş Modlarını Değiştir" },
    [2] = { control = "~INPUT_51D50495~", label = "Projektör" },
    [3] = { control = "~INPUT_5D25DCCD~", label = "Kameradan Çık" }
}

-- Hız Birimleri:
-- KTS = Knotlar (deniz mili/saat)
-- MPH = Mil/saat
-- KMH = Kilometre/saat
-- MPS = Metre/saniye
-- FPS = Ayak/saniye

-- Mesafe Birimleri:
-- FT = Ayak
-- M = Metre
-- MI = Mil
Config.Units = {
    Speed = "KMH", -- Helikopterin hızı (birim türü: hız)
    Altitude = "M", -- Helikopterin yüksekliği (birim türü: mesafe)
    TargetSpeed = "KMH", -- Kameranın baktığı hedefin hızı (birim türü: hız)
    TargetElevation = "M", -- Kameranın hedeflediği yerin yüksekliği (birim türü: mesafe)
    TargetDistance = "M" -- Helikopter ile hedef arasındaki mesafe (birim türü: mesafe)
}


Config.Camera = {
    MovementSpeed = {
        Keyboard = 3.0,
        Controller = 1.0
    },
    Zoom = {
        Max = 100.0,
        Min = 5.0,
        Speed = 5.0
    },
    RotationLimits = {
        Up = 25.0,
        Down = -89.5
    }
}

-- Docs: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/ -- https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.Keybinds = {
    ToggleCam = {
        Type = "KEYBOARD",
        Key = "E"
    },
    AttemptLock = {
        Type = "KEYBOARD",
        Key = "SPACE"
    },
    CycleVision = {
        Type = "MOUSE_BUTTON",
        Key = "MOUSE_RIGHT"
    },
    ToggleMarker = {
        Type = "MOUSE_BUTTON",
        Key = "MOUSE_MIDDLE"
    },
    Rappel = {
        Type = "KEYBOARD",
        Key = "X"
    },
    Spotlight = {
        Type = "KEYBOARD",
        Key = "G"
    },
    SpotlightBrightness = {
        Type = "KEYBOARD",
        Key = "LMENU"
    },
    SpotlightRadius = {
        Type = "KEYBOARD",
        Key = "LCONTROL"
    },
    Postals = {
        Type = "KEYBOARD",
        Key = ""
    }
}

Config.Localisation = {
    -- Bildirimler
    Notification = {
        JobNotWhitelisted = "Gerekli işe sahip değilsiniz!",
        JobGrade = "İş dereceniz çok düşük!",
        NoCameraHeli = "Bu helikopterde kamera yok!",
        NoCameraPlane = "Bu uçakta kamera yok!",
        IsPilot = "Pilotken kamerayı kullanamazsınız!",
        NotInRear = "Kamerayı kullanmak için helikopterin arka tarafında olmanız gerekiyor!",
        CameraInUse = "Bir başkası zaten kamerayı kullanıyor!",
        SpotlightInUse = "Bir başkası zaten projektörü kullanıyor!",
        NoSpotlight = "Bu helikopterde projektör yok!",
        SpotlightGlobalLimit = "Global projektör limiti aşıldı!",
        CannotRappelFromHeli = "Bu helikopterden ip inişi yapılamaz!",
        CannotRappelFromSeat = "Bu koltuktan ip inişi yapamazsınız!",
        ToHighToRappel = "Helikopter ip inişi için çok yüksek!",
        ConfirmRappel = "İp inişi yapmak istediğinize emin misiniz? (Onaylamak için tekrar basın)",
        Rappeling = "İp inişi yapılıyor!"
    },
    -- Blip İsimleri
    Blip = {
        Target = "Helicam Hedefi",
        Marker = "Helicam İşaretleyicisi"
    },
    -- Tuş Ataması Açıklamaları
    KeyMapping = {
        ToggleCam = "Helicam - Kamerayı Aç/Kapat",
        AttemptLock = "Helicam - Kilitlenmeyi Deneyin",
        CycleVision = "Helicam - Görüş Modlarını Değiştir",
        ToggleMarker = "Helicam - İşaretçi Ekle/Kaldır",
        Rappel = "Helicam - Helikopterden İp İnişi",
        Spotlight = "Helicam - Projektörü Aç/Kapat",
        SpotlightBrightness = "Helicam - Projektör Parlaklığını Ayarla (scroll +)",
        SpotlightRadius = "Helicam - Projektör Çapını Ayarla (scroll +)",
        Postals = "Helicam - Posta Kodlarını Aç/Kapat"
    },
    ChatSuggestions = {
        ToggleCamera = "Helikopter kamerasına gir/çık",
        Rappel = "Helikopterden ip inişi yap"
    }
}


-- Nightvision/Thermal/Spotlight/PassengerOnly can be manually enabled/disabled for each model by adding one or more of following varabels under the model.
-- nightvision = false / true
-- thermalvision = false / true
-- spotlight = false / true
-- passengerOnly = false / 1 / 2 (see Config.PassengerOnly)
Config.Helicopters = {
    -- Default (if there is any missing data it will draw it's options from here)
    default = {
        offset = vector3(0.0, 0.0, -1.0),
        -- nightvision = true,   -- These are only needed/used if Config.AllowNightVision or Config.AllowThermal is set to false
        -- thermalvision = true, -- You can add these to each and every model, adding these and setting them to false disables the vision even if Config.AllowThermal etc. is set to true
        -- spotlight = true,     -- Allows yo overwrite Config.AllowSpotlight on a helicopter to helicopter basis.
        -- passengerOnly = false,
        labels = {
            [0] = "FLIR SYSTEMS"
        }
    },
    -- Police Maverick (polmav)
    [353883353] = {
        offset = vector3(0.0, 2.65, -1.0),
        labels = { -- Liveries
            [0] = "LOS SANTOS POLICE DEPARTMENT", -- 0 is default
            [1] = "AIR AMBULANCE"
        }
    },
    -- Maverick (maverick)
    [-1660661558] = {
        offset = vector3(0.0, 3.45, -0.65)
    },
    -- Buzzard Attack Chopper (buzzard)
    [788747387] = {
        offset = vector3(0.0, 2.15, -0.35)
    },
    -- Buzzard (buzzard2)
    [745926877] = {
        offset = vector3(0.0, 2.15, -0.35)
    },
    -- Frogger (frogger)
    [744705981] = {
        offset = vector3(-1.0, 3.02, -1.1)
    },
    -- TPI/FIB Frogger (frogger2)
    [1949211328] = {
        offset = vector3(-1.0, 3.02, -1.1),
        labels = { -- Liveries
            [0] = "FEDERAL INVESTIGATION BUREAU",
            [1] = "TREVOR PHILIPS ENTERPRISES"
        }
    },
    -- Annihilator/Patriotism and Immigration Authority (annihilator)
    [837858166] = {
        offset = vector3(-0.5, 4.0, -0.35),
        labels = { -- Liveries
            [0] = "NATIONAL OFFICE OF SECURITY ENFORCMENT"
        }
    },
    -- Valkyrie (valkyrie)
    [-1600252419] = {
        offset = vector3(0.0, 4.0, -1.15),
        labels = { -- Liveries
            [0] = "UNITED STATES ARMY"
        }
    },
    -- Avenger (avenger)
    [-2118308144] = {
        offset = vector3(0.0, 9.45, -2.45),
        labels = { -- Liveries
            [0] = "UNITED STATES MARINES"
        }
    },

    -- Example of custom helicopter:
    -- Emergency Maverick AS350 (eheli)
    -- [`eheli`] = {
    --     offset = vector3(0.0, 3.0, -1.15),
    --     labels = { -- Liveries
    --         [0] = "LOS SANTOS POLICE DEPARTMENT",
    --         [1] = "SAN ANDREAS HIGHWAY PATROL",
    --         [2] = "BLAIN COUNTY SHERIFF OFFICE",
    --         [3] = "SAN ANDREAS FIRE DEPARTMENT"
    --     }
    -- },
    -- You can also do GetHashKey("eheli") instead of `eheli`
    -- Here is a guide if you need more help: https://madsl.gitbook.io/docs/resources/helicopter-camera/adding-custom-helicopters
}
