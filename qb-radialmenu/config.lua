Config = {}
Config.Keybind = 'F3'           -- FiveM Keyboard, this is registered keymapping, so needs changed in keybindings if player already has this mapped.
Config.Toggle = false           -- use toggle mode. False requires hold of key
Config.UseWhilstWalking = false -- use whilst walking
Config.EnableExtraMenu = true
Config.Fliptime = 15000

Config.MenuItems = {
    {
        id = 'citizen',
        title = 'Genel',
        icon = 'user',
        items = {
             { 
                id = 'getintrunk',
                title = 'Bagaja Girin',
                icon = 'car',
                type = 'client',
                event = 'qb-trunk:client:GetIn',
                shouldClose = true
            },
            {
                id = 'interactions',
                title = 'Etkileşim',
                icon = 'triangle-exclamation',
                items = {
                    {
                        id = 'stealplayer',
                        title = 'Soy',
                        icon = 'mask',
                        type = 'client',
                        event = 'police:client:RobPlayer',
                        shouldClose = true
                    },
                    -- {
                    --     id = 'escort',
                    --     title = 'Sırtla',
                    --     icon = 'user-group',
                    --     type = 'command',
                    --     event = 'sirtla',
                    --     shouldClose = true
                    -- },
                    {
                        id = 'escort2',
                        title = 'Taşı',
                        icon = 'user-group',
                        type = 'client',
                        event = 'esx_barbie_lyftupp:TgiannTasi',
                        shouldClose = true
                    },
                    {
                        id = 'kucak',
                        title = 'Kucakla',
                        icon = 'user-group',
                        type = 'command',
                        event = 'kucakla',
                        shouldClose = true
                    },
                 
                }
            }
        }
    },
    {
        id = 'blips',
        title = 'Lokasyon',
        icon = 'map',
        items = {
            {
                id = 'marketler',
                title = 'Marketler',
                icon = 'store',
                type = 'client',
                event = 'qb-radialmenu:blips:market',
                shouldClose = true
            },
            {
                id = 'isletme',
                title = 'T. Lokasyon',
                icon = 'store',
                type = 'client',
                event = 'qb-radialmenu:blips:toggleAll',
                shouldClose = true
            },
            {
                id = 'isletme',
                title = 'İşletme',
                icon = 'store',
                type = 'client',
                event = 'qb-radialmenu:blips:isletme',
                shouldClose = true
            },
            {
                id = 'berber',
                title = 'Berber',
                icon = 'user',
                type = 'client',
                event = 'qb-radialmenu:blips:barbers',
                shouldClose = true
            },
            {
                id = 'dovmeci',
                title = 'Dövmeci',
                icon = 'highlighter',
                type = 'client',
                event = 'qb-radialmenu:blips:tatto',
                shouldClose = true
            },
            {
                id = 'kiyafetci',
                title = 'Kıyafetçi',
                icon = 'shirt',
                type = 'client',
                event = 'qb-radialmenu:blips:kiyafet',
                shouldClose = true
            },
            {
                id = 'banka',
                title = 'Banka',
                icon = 'money-bill',
                type = 'client',
                event = 'qb-radialmenu:blips:banks',
                shouldClose = true
            },
            {
                id = 'meslekler',
                title = 'Meslek',
                icon = 'pencil',
                type = 'client',
                event = 'qb-radialmenu:blips:jobs',
                shouldClose = true
            },
            {
                id = 'mekanik',
                title = 'Mekanik',
                icon = 'plus',
                type = 'client',
                event = 'qb-radialmenu:blips:mekanik',
                shouldClose = true
            }
        }
    },
    {
        id = 'fpsmenu',
        title = 'FPS Menü',
        icon = 'battery-three-quarters',
        type = 'command',
        event = 'fps',
        shouldClose = true
    },
    {
        id = 'araba',
        title = 'Araç Kontrol',
        icon = 'car',
        type = 'command',
        event = 'vehiclemenu',
        shouldClose = true
    },
    {
        id = 'kiyafet',
        title = 'Kıyafet',
        icon = 'user',
        type = 'command',
        event = 'kiyafet',
        shouldClose = true
    },
}

Config.VehicleDoors = {
    id = 'vehicledoors',
    title = 'Araç Kapıları',
    icon = 'car-side',
    items = {
        {
            id = 'door0',
            title = 'Sürücü Kapısı',
            icon = 'car-side',
            type = 'client',
            event = 'qb-radialmenu:client:openDoor',
            shouldClose = false
        }, 
        {
            id = 'door4',
            title = 'Kaput',
            icon = 'car',
            type = 'client',
            event = 'qb-radialmenu:client:openDoor',
            shouldClose = false
        }, 
        {
            id = 'door1',
            title = 'Ön Yolcu Kapısı',
            icon = 'car-side',
            type = 'client',
            event = 'qb-radialmenu:client:openDoor',
            shouldClose = false
        }, 
        {
            id = 'door3',
            title = 'Sağ Arka Kapı',
            icon = 'car-side',
            type = 'client',
            event = 'qb-radialmenu:client:openDoor',
            shouldClose = false
        }, 
        {
            id = 'door5',
            title = 'Bagaj',
            icon = 'car',
            type = 'client',
            event = 'qb-radialmenu:client:openDoor',
            shouldClose = false
        }, 
        {
            id = 'door2',
            title = 'Sol Arka Kapı',
            icon = 'car-side',
            type = 'client',
            event = 'qb-radialmenu:client:openDoor',
            shouldClose = false
        }
    }
}

Config.VehicleExtras = {
    -- id = 'vehicleextras',
    -- title = 'Vehicle Extras',
    -- icon = 'plus',
    -- items = {
    --     {
    --         id = 'extra1',
    --         title = 'Extra 1',
    --         icon = 'box-open',
    --         type = 'client',
    --         event = 'qb-radialmenu:client:setExtra',
    --         shouldClose = false
    --     }, {
    --         id = 'extra2',
    --         title = 'Extra 2',
    --         icon = 'box-open',
    --         type = 'client',
    --         event = 'qb-radialmenu:client:setExtra',
    --         shouldClose = false
    --     }, {
    --         id = 'extra3',
    --         title = 'Extra 3',
    --         icon = 'box-open',
    --         type = 'client',
    --         event = 'qb-radialmenu:client:setExtra',
    --         shouldClose = false
    --     }, {
    --         id = 'extra4',
    --         title = 'Extra 4',
    --         icon = 'box-open',
    --         type = 'client',
    --         event = 'qb-radialmenu:client:setExtra',
    --         shouldClose = false
    --     }, {
    --         id = 'extra5',
    --         title = 'Extra 5',
    --         icon = 'box-open',
    --         type = 'client',
    --         event = 'qb-radialmenu:client:setExtra',
    --         shouldClose = false
    --     }, {
    --         id = 'extra6',
    --         title = 'Extra 6',
    --         icon = 'box-open',
    --         type = 'client',
    --         event = 'qb-radialmenu:client:setExtra',
    --         shouldClose = false
    --     }, {
    --         id = 'extra7',
    --         title = 'Extra 7',
    --         icon = 'box-open',
    --         type = 'client',
    --         event = 'qb-radialmenu:client:setExtra',
    --         shouldClose = false
    --     }, {
    --         id = 'extra8',
    --         title = 'Extra 8',
    --         icon = 'box-open',
    --         type = 'client',
    --         event = 'qb-radialmenu:client:setExtra',
    --         shouldClose = false
    --     }, {
    --         id = 'extra9',
    --         title = 'Extra 9',
    --         icon = 'box-open',
    --         type = 'client',
    --         event = 'qb-radialmenu:client:setExtra',
    --         shouldClose = false
    --     }, {
    --         id = 'extra10',
    --         title = 'Extra 10',
    --         icon = 'box-open',
    --         type = 'client',
    --         event = 'qb-radialmenu:client:setExtra',
    --         shouldClose = false
    --     }, {
    --         id = 'extra11',
    --         title = 'Extra 11',
    --         icon = 'box-open',
    --         type = 'client',
    --         event = 'qb-radialmenu:client:setExtra',
    --         shouldClose = false
    --     }, {
    --         id = 'extra12',
    --         title = 'Extra 12',
    --         icon = 'box-open',
    --         type = 'client',
    --         event = 'qb-radialmenu:client:setExtra',
    --         shouldClose = false
    --     }, {
    --         id = 'extra13',
    --         title = 'Extra 13',
    --         icon = 'box-open',
    --         type = 'client',
    --         event = 'qb-radialmenu:client:setExtra',
    --         shouldClose = false
    --     }
    -- }
}

Config.VehicleSeats = {
    -- id = 'vehicleseats',
    -- title = 'Koltuklar',
    -- icon = 'chair',
    items = {}
}

Config.JobInteractions = {
    ["ambulance"] = {
        {
            id = 'revivep',
            title = 'Tedavi et',
            icon = 'user-doctor',
            type = 'client',
            event = 'hospital:client:RevivePlayer',
            shouldClose = true
        },{
            id = 'treatwounds',
            title = 'Yaraları İyileştir',
            icon = 'bandage',
            type = 'client',
            event = 'hospital:client:TreatWounds',
            shouldClose = true
        },  {
            id = 'escort',
            title = 'Hasta Taşı',
            icon = 'user-group',
            type = 'client',
            event = 'police:client:EscortPlayer',
            shouldClose = true
        },  
        {
            id = 'stretcheroptions',
            title = 'Sedye',
            icon = 'bed-pulse',
            items = {
                {
                    id = 'spawnstretcher',
                    title = 'Sedye Çıkart',
                    icon = 'plus',
                    type = 'client',
                    event = 'qb-radialmenu:client:TakeStretcher',
                    shouldClose = false
                }, {
                    id = 'despawnstretcher',
                    title = 'Sedye Kaldır',
                    icon = 'minus',
                    type = 'client',
                    event = 'qb-radialmenu:client:RemoveStretcher',
                    shouldClose = false
                }
            }
        }
    },
    ["unemployed"] = {
        {
            id = 'togglemeter',
            title = 'Taksimetre Göster/Gizle',
            icon = 'eye-slash',
            type = 'client',
            event = 'qb-taxi:client:toggleMeter',
            shouldClose = false
        }, {
            id = 'togglemouse',
            title = 'Taksimetre Aç/Kapat',
            icon = 'hourglass-start',
            type = 'client',
            event = 'qb-taxi:client:enableMeter',
            shouldClose = true
        }, 
    },
    ["tow"] = {
        {
            id = 'togglenpc',
            title = 'NPC Aç/Kapat',
            icon = 'toggle-on',
            type = 'client',
            event = 'jobs:client:ToggleNpc',
            shouldClose = true
        }, {
            id = 'towvehicle',
            title = 'Çekici Aracı',
            icon = 'truck-pickup',
            type = 'client',
            event = 'qb-tow:client:TowVehicle',
            shouldClose = true
        }
    },
    ["police"] = {  
        {
            id = 'policeinteraction',
            title = 'Polis Eylemleri',
            icon = 'list-check',
            items = {
                {
                    id = 'arackit',
                    title = 'Araç Kilidi Kır',
                    icon = 'anchor-lock',
                    type = 'client',
                    event = 'police:client:LockBroke',
                    shouldClose = true
                }, {
                    id = 'araccek',
                    title = 'Araç Çek',
                    icon = 'car',
                    type = 'client',
                    event = 'police:client:ImpoundVehicle',
                    shouldClose = true
                },{
                    id = 'kamu',
                    title = 'Kamu',
                    icon = 'export',
                    type = 'client',
                    action = function()
                        exports["savana-communityservice"]:openMenu()
                    end,
                    shouldClose = true
                },
            }
        }, {
            id = 'policeobjects',
            title = 'Objeler',
            icon = 'road',
            items = {
                {
                    id = 'spawnpion',
                    title = 'Koni',
                    icon = 'triangle-exclamation',
                    type = 'client',
                    event = 'police:client:spawnCone',
                    shouldClose = false
                }, {
                    id = 'spawnhek',
                    title = 'Kapı',
                    icon = 'torii-gate',
                    type = 'client',
                    event = 'police:client:spawnBarrier',
                    shouldClose = false
                }, {
                    id = 'spawnschotten',
                    title = 'Hız Limit Uyarısı',
                    icon = 'sign-hanging',
                    type = 'client',
                    event = 'police:client:spawnRoadSign',
                    shouldClose = false
                }, {
                    id = 'spawntent',
                    title = 'Çadır',
                    icon = 'campground',
                    type = 'client',
                    event = 'police:client:spawnTent',
                    shouldClose = false
                }, {
                    id = 'spawnverlichting',
                    title = 'Aydınlatma',
                    icon = 'lightbulb',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false
                }, {
                    id = 'spikestrip',
                    title = 'Spike',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'police:client:SpawnSpikeStrip',
                    shouldClose = false
                }, {
                    id = 'deleteobject',
                    title = 'Objeyi Kaldır',
                    icon = 'trash',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false
                }
            }
        }
    },
    ["doj"] = {  {
            id = 'policeinteraction',
            title = 'Polis Eylemleri',
            icon = 'list-check',
            items = {{
                    id = 'arackit',
                    title = 'Araç Kilidi Kır',
                    icon = 'anchor-lock',
                    type = 'client',
                    event = 'police:client:LockBroke',
                    shouldClose = true
                }, {
                    id = 'araccek',
                    title = 'Araç Çek',
                    icon = 'car',
                    type = 'client',
                    event = 'police:client:ImpoundVehicle',
                    shouldClose = true
                }, {
                    id = 'escort',
                    title = 'Taşı',
                    icon = 'user-group',
                    type = 'client',
                    event = 'police:client:EscortPlayer',
                    shouldClose = true
                }, {
                    id = 'billplayer',
                    title = 'Fatura Kes',
                    icon = 'money-bill',
                    type = 'command',
            event = 'fatura',
                    shouldClose = true
                }
            }
        }, {
            id = 'policeobjects',
            title = 'Objeler',
            icon = 'road',
            items = {
                {
                    id = 'spawnpion',
                    title = 'Koni',
                    icon = 'triangle-exclamation',
                    type = 'client',
                    event = 'police:client:spawnCone',
                    shouldClose = false
                }, {
                    id = 'spawnhek',
                    title = 'Kapı',
                    icon = 'torii-gate',
                    type = 'client',
                    event = 'police:client:spawnBarrier',
                    shouldClose = false
                }, {
                    id = 'spawnschotten',
                    title = 'Hız Limit Uyarısı',
                    icon = 'sign-hanging',
                    type = 'client',
                    event = 'police:client:spawnRoadSign',
                    shouldClose = false
                }, {
                    id = 'spawntent',
                    title = 'Çadır',
                    icon = 'campground',
                    type = 'client',
                    event = 'police:client:spawnTent',
                    shouldClose = false
                }, {
                    id = 'spawnverlichting',
                    title = 'Aydınlatma',
                    icon = 'lightbulb',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false
                }, {
                    id = 'spikestrip',
                    title = 'Spike',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'police:client:SpawnSpikeStrip',
                    shouldClose = false
                }, {
                    id = 'deleteobject',
                    title = 'Objeyi Kaldır',
                    icon = 'trash',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false
                }
            }
        }
    },
    ["dsd"] = {  {
            id = 'policeinteraction',
            title = 'Polis Eylemleri',
            icon = 'list-check',
            items = {{
                    id = 'arackit',
                    title = 'Araç Kilidi Kır',
                    icon = 'anchor-lock',
                    type = 'client',
                    event = 'police:client:LockBroke',
                    shouldClose = true
                }, {
                    id = 'araccek',
                    title = 'Araç Çek',
                    icon = 'car',
                    type = 'client',
                    event = 'police:client:ImpoundVehicle',
                    shouldClose = true
                }, {
                    id = 'escort',
                    title = 'Taşı',
                    icon = 'user-group',
                    type = 'client',
                    event = 'police:client:EscortPlayer',
                    shouldClose = true
                }, {
                    id = 'billplayer',
                    title = 'Fatura Kes',
                    icon = 'money-bill',
                    type = 'command',
            event = 'fatura',
                    shouldClose = true
                }
            }
        }, {
            id = 'policeobjects',
            title = 'Objeler',
            icon = 'road',
            items = {
                {
                    id = 'spawnpion',
                    title = 'Koni',
                    icon = 'triangle-exclamation',
                    type = 'client',
                    event = 'police:client:spawnCone',
                    shouldClose = false
                }, {
                    id = 'spawnhek',
                    title = 'Kapı',
                    icon = 'torii-gate',
                    type = 'client',
                    event = 'police:client:spawnBarrier',
                    shouldClose = false
                }, {
                    id = 'spawnschotten',
                    title = 'Hız Limit Uyarısı',
                    icon = 'sign-hanging',
                    type = 'client',
                    event = 'police:client:spawnRoadSign',
                    shouldClose = false
                }, {
                    id = 'spawntent',
                    title = 'Çadır',
                    icon = 'campground',
                    type = 'client',
                    event = 'police:client:spawnTent',
                    shouldClose = false
                }, {
                    id = 'spawnverlichting',
                    title = 'Aydınlatma',
                    icon = 'lightbulb',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false
                }, {
                    id = 'spikestrip',
                    title = 'Spike',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'police:client:SpawnSpikeStrip',
                    shouldClose = false
                }, {
                    id = 'deleteobject',
                    title = 'Objeyi Kaldır',
                    icon = 'trash',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false
                }
            }
        }
    },
    ["lspr"] = {  {
            id = 'policeinteraction',
            title = 'Polis Eylemleri',
            icon = 'list-check',
            items = {{
                    id = 'arackit',
                    title = 'Araç Kilidi Kır',
                    icon = 'anchor-lock',
                    type = 'client',
                    event = 'police:client:LockBroke',
                    shouldClose = true
                }, {
                    id = 'araccek',
                    title = 'Araç Çek',
                    icon = 'car',
                    type = 'client',
                    event = 'police:client:ImpoundVehicle',
                    shouldClose = true
                }, {
                    id = 'escort',
                    title = 'Taşı',
                    icon = 'user-group',
                    type = 'client',
                    event = 'police:client:EscortPlayer',
                    shouldClose = true
                },
                {
                    id = 'escort',
                    title = 'Hapis',
                    icon = 'user-group',
                    type = 'command',
                    event = 'hapismenu',
                    shouldClose = true
                },
                {
                    id = 'escort',
                    title = 'Kamu',
                    icon = 'user-group',
                    type = 'command',
                    event = 'kamumenu',
                    shouldClose = true
                },  {
                    id = 'billplayer',
                    title = 'Fatura Kes',
                    icon = 'money-bill',
                    type = 'command',
            event = 'fatura',
                    shouldClose = true
                }
            }
        }, {
            id = 'policeobjects',
            title = 'Objeler',
            icon = 'road',
            items = {
                {
                    id = 'spawnpion',
                    title = 'Koni',
                    icon = 'triangle-exclamation',
                    type = 'client',
                    event = 'police:client:spawnCone',
                    shouldClose = false
                }, {
                    id = 'spawnhek',
                    title = 'Kapı',
                    icon = 'torii-gate',
                    type = 'client',
                    event = 'police:client:spawnBarrier',
                    shouldClose = false
                }, {
                    id = 'spawnschotten',
                    title = 'Hız Limit Uyarısı',
                    icon = 'sign-hanging',
                    type = 'client',
                    event = 'police:client:spawnRoadSign',
                    shouldClose = false
                }, {
                    id = 'spawntent',
                    title = 'Çadır',
                    icon = 'campground',
                    type = 'client',
                    event = 'police:client:spawnTent',
                    shouldClose = false
                }, {
                    id = 'spawnverlichting',
                    title = 'Aydınlatma',
                    icon = 'lightbulb',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false
                }, {
                    id = 'spikestrip',
                    title = 'Spike',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'police:client:SpawnSpikeStrip',
                    shouldClose = false
                }, {
                    id = 'deleteobject',
                    title = 'Objeyi Kaldır',
                    icon = 'trash',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false
                }
            }
        }
    },
    ["pbsd"] = {  {
            id = 'policeinteraction',
            title = 'Polis Eylemleri',
            icon = 'list-check',
            items = {{
                    id = 'arackit',
                    title = 'Araç Kilidi Kır',
                    icon = 'anchor-lock',
                    type = 'client',
                    event = 'police:client:LockBroke',
                    shouldClose = true
                }, {
                    id = 'araccek',
                    title = 'Araç Çek',
                    icon = 'car',
                    type = 'client',
                    event = 'police:client:ImpoundVehicle',
                    shouldClose = true
                }, {
                    id = 'escort',
                    title = 'Taşı',
                    icon = 'user-group',
                    type = 'client',
                    event = 'police:client:EscortPlayer',
                    shouldClose = true
                },  {
                    id = 'billplayer',
                    title = 'Fatura Kes',
                    icon = 'money-bill',
                    type = 'command',
            event = 'fatura',
                    shouldClose = true
                }
            }
        }, {
            id = 'policeobjects',
            title = 'Objeler',
            icon = 'road',
            items = {
                {
                    id = 'spawnpion',
                    title = 'Koni',
                    icon = 'triangle-exclamation',
                    type = 'client',
                    event = 'police:client:spawnCone',
                    shouldClose = false
                }, {
                    id = 'spawnhek',
                    title = 'Kapı',
                    icon = 'torii-gate',
                    type = 'client',
                    event = 'police:client:spawnBarrier',
                    shouldClose = false
                }, {
                    id = 'spawnschotten',
                    title = 'Hız Limit Uyarısı',
                    icon = 'sign-hanging',
                    type = 'client',
                    event = 'police:client:spawnRoadSign',
                    shouldClose = false
                }, {
                    id = 'spawntent',
                    title = 'Çadır',
                    icon = 'campground',
                    type = 'client',
                    event = 'police:client:spawnTent',
                    shouldClose = false
                }, {
                    id = 'spawnverlichting',
                    title = 'Aydınlatma',
                    icon = 'lightbulb',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false
                }, {
                    id = 'spikestrip',
                    title = 'Spike',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'police:client:SpawnSpikeStrip',
                    shouldClose = false
                }, {
                    id = 'deleteobject',
                    title = 'Objeyi Kaldır',
                    icon = 'trash',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false
                }
            }
        }
    },
    ["bcsd"] = {  {
            id = 'policeinteraction',
            title = 'Polis Eylemleri',
            icon = 'list-check',
            items = {{
                    id = 'arackit',
                    title = 'Araç Kilidi Kır',
                    icon = 'anchor-lock',
                    type = 'client',
                    event = 'police:client:LockBroke',
                    shouldClose = true
                }, {
                    id = 'araccek',
                    title = 'Araç Çek',
                    icon = 'car',
                    type = 'client',
                    event = 'police:client:ImpoundVehicle',
                    shouldClose = true
                }, {
                    id = 'escort',
                    title = 'Taşı',
                    icon = 'user-group',
                    type = 'client',
                    event = 'police:client:EscortPlayer',
                    shouldClose = true
                },  {
                    id = 'billplayer',
                    title = 'Fatura Kes',
                    icon = 'money-bill',
                    type = 'command',
            event = 'fatura',
                    shouldClose = true
                }
            }
        }, {
            id = 'policeobjects',
            title = 'Objeler',
            icon = 'road',
            items = {
                {
                    id = 'spawnpion',
                    title = 'Koni',
                    icon = 'triangle-exclamation',
                    type = 'client',
                    event = 'police:client:spawnCone',
                    shouldClose = false
                }, {
                    id = 'spawnhek',
                    title = 'Kapı',
                    icon = 'torii-gate',
                    type = 'client',
                    event = 'police:client:spawnBarrier',
                    shouldClose = false
                }, {
                    id = 'spawnschotten',
                    title = 'Hız Limit Uyarısı',
                    icon = 'sign-hanging',
                    type = 'client',
                    event = 'police:client:spawnRoadSign',
                    shouldClose = false
                }, {
                    id = 'spawntent',
                    title = 'Çadır',
                    icon = 'campground',
                    type = 'client',
                    event = 'police:client:spawnTent',
                    shouldClose = false
                }, {
                    id = 'spawnverlichting',
                    title = 'Aydınlatma',
                    icon = 'lightbulb',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false
                }, {
                    id = 'spikestrip',
                    title = 'Spike',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'police:client:SpawnSpikeStrip',
                    shouldClose = false
                }, {
                    id = 'deleteobject',
                    title = 'Objeyi Kaldır',
                    icon = 'trash',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false
                }
            }
        }
    },
    ["lssp"] = {  {
            id = 'policeinteraction',
            title = 'Polis Eylemleri',
            icon = 'list-check',
            items = {{
                    id = 'arackit',
                    title = 'Araç Kilidi Kır',
                    icon = 'anchor-lock',
                    type = 'client',
                    event = 'police:client:LockBroke',
                    shouldClose = true
                }, {
                    id = 'araccek',
                    title = 'Araç Çek',
                    icon = 'car',
                    type = 'client',
                    event = 'police:client:ImpoundVehicle',
                    shouldClose = true
                }, {
                    id = 'escort',
                    title = 'Taşı',
                    icon = 'user-group',
                    type = 'client',
                    event = 'police:client:EscortPlayer',
                    shouldClose = true
                },{
                    id = 'billplayer',
                    title = 'Fatura Kes',
                    icon = 'money-bill',
                    type = 'command',
            event = 'fatura',
                    shouldClose = true
                }
            }
        }, {
            id = 'policeobjects',
            title = 'Objeler',
            icon = 'road',
            items = {
                {
                    id = 'spawnpion',
                    title = 'Koni',
                    icon = 'triangle-exclamation',
                    type = 'client',
                    event = 'police:client:spawnCone',
                    shouldClose = false
                }, {
                    id = 'spawnhek',
                    title = 'Kapı',
                    icon = 'torii-gate',
                    type = 'client',
                    event = 'police:client:spawnBarrier',
                    shouldClose = false
                }, {
                    id = 'spawnschotten',
                    title = 'Hız Limit Uyarısı',
                    icon = 'sign-hanging',
                    type = 'client',
                    event = 'police:client:spawnRoadSign',
                    shouldClose = false
                }, {
                    id = 'spawntent',
                    title = 'Çadır',
                    icon = 'campground',
                    type = 'client',
                    event = 'police:client:spawnTent',
                    shouldClose = false
                }, {
                    id = 'spawnverlichting',
                    title = 'Aydınlatma',
                    icon = 'lightbulb',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false
                }, {
                    id = 'spikestrip',
                    title = 'Spike',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'police:client:SpawnSpikeStrip',
                    shouldClose = false
                }, {
                    id = 'deleteobject',
                    title = 'Objeyi Kaldır',
                    icon = 'trash',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false
                }
            }
        }
    },
    ["vespuccipd"] = {  {
            id = 'policeinteraction',
            title = 'Polis Eylemleri',
            icon = 'list-check',
            items = {{
                    id = 'arackit',
                    title = 'Araç Kilidi Kır',
                    icon = 'anchor-lock',
                    type = 'client',
                    event = 'police:client:LockBroke',
                    shouldClose = true
                }, {
                    id = 'araccek',
                    title = 'Araç Çek',
                    icon = 'car',
                    type = 'client',
                    event = 'police:client:ImpoundVehicle',
                    shouldClose = true
                }, {
                    id = 'escort',
                    title = 'Taşı',
                    icon = 'user-group',
                    type = 'client',
                    event = 'police:client:EscortPlayer',
                    shouldClose = true
                },  {
                    id = 'billplayer',
                    title = 'Fatura Kes',
                    icon = 'money-bill',
                    type = 'command',
            event = 'fatura',
                    shouldClose = true
                }
            }
        }, {
            id = 'policeobjects',
            title = 'Objeler',
            icon = 'road',
            items = {
                {
                    id = 'spawnpion',
                    title = 'Koni',
                    icon = 'triangle-exclamation',
                    type = 'client',
                    event = 'police:client:spawnCone',
                    shouldClose = false
                }, {
                    id = 'spawnhek',
                    title = 'Kapı',
                    icon = 'torii-gate',
                    type = 'client',
                    event = 'police:client:spawnBarrier',
                    shouldClose = false
                }, {
                    id = 'spawnschotten',
                    title = 'Hız Limit Uyarısı',
                    icon = 'sign-hanging',
                    type = 'client',
                    event = 'police:client:spawnRoadSign',
                    shouldClose = false
                }, {
                    id = 'spawntent',
                    title = 'Çadır',
                    icon = 'campground',
                    type = 'client',
                    event = 'police:client:spawnTent',
                    shouldClose = false
                }, {
                    id = 'spawnverlichting',
                    title = 'Aydınlatma',
                    icon = 'lightbulb',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false
                }, {
                    id = 'spikestrip',
                    title = 'Spike',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'police:client:SpawnSpikeStrip',
                    shouldClose = false
                }, {
                    id = 'deleteobject',
                    title = 'Objeyi Kaldır',
                    icon = 'trash',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false
                }
            }
        }
    },

    ["hotdog"] = {
        {
            id = 'togglesell',
            title = 'Satışı Başlat/Bitir',
            icon = 'hotdog',
            type = 'client',
            event = 'qb-hotdogjob:client:ToggleSell',
            shouldClose = true
        }
    },
    ["castrum"] = {
        {
            id = 'billplayer',
            title = 'Fatura Kes',
            icon = 'money-bill',
           type = 'command',
            event = 'fatura',
            shouldClose = true
        }, {
            id = 'araccek',
            title = 'Araç Çek',
            icon = 'car',
            type = 'client',
            event = 'police:client:ImpoundVehicle',
            shouldClose = true
        },{
            id = 'temizlikfix',
            title = 'Temizle',
            icon = 'water',
            type = 'client',
            event = 'qb-vehiclefailure:client:CleanVehicle',
            shouldClose = true
        },{
            id = 'aractamir',
            title = 'Tamir Et',
            icon = 'toolbox',
            type = 'client',
            event = 'qb-vehiclefailure:client:RepairVehicleFull',
            shouldClose = true
        },
    },
    ["lostmc"] = {
        {
            id = 'billplayer',
            title = 'Fatura Kes',
            icon = 'money-bill',
           type = 'command',
            event = 'fatura',
            shouldClose = true
        }, {
            id = 'araccek',
            title = 'Araç Çek',
            icon = 'car',
            type = 'client',
            event = 'police:client:ImpoundVehicle',
            shouldClose = true
        },{
            id = 'temizlikfix',
            title = 'Temizle',
            icon = 'water',
            type = 'client',
            event = 'qb-vehiclefailure:client:CleanVehicle',
            shouldClose = true
        },{
            id = 'aractamir',
            title = 'Tamir Et',
            icon = 'toolbox',
            type = 'client',
            event = 'qb-vehiclefailure:client:RepairVehicleFull',
            shouldClose = true
        },
    },
    ["mechanic_bennys"] = {
        {
            id = 'billplayer',
            title = 'Fatura Kes',
            icon = 'money-bill',
           type = 'command',
            event = 'fatura',
            shouldClose = true
        }, {
            id = 'araccek',
            title = 'Araç Çek',
            icon = 'car',
            type = 'client',
            event = 'police:client:ImpoundVehicle',
            shouldClose = true
        },{
            id = 'temizlikfix',
            title = 'Temizle',
            icon = 'water',
            type = 'client',
            event = 'qb-vehiclefailure:client:CleanVehicle',
            shouldClose = true
        },{
            id = 'aractamir',
            title = 'Tamir Et',
            icon = 'toolbox',
            type = 'client',
            event = 'qb-vehiclefailure:client:RepairVehicleFull',
            shouldClose = true
        },
    },
    ["afterlife"] = {
        {
            id = 'billplayer',
            title = 'Fatura Kes',
            icon = 'money-bill',
           type = 'command',
            event = 'fatura',
            shouldClose = true
        }, {
            id = 'araccek',
            title = 'Araç Çek',
            icon = 'car',
            type = 'client',
            event = 'police:client:ImpoundVehicle',
            shouldClose = true
        },{
            id = 'temizlikfix',
            title = 'Temizle',
            icon = 'water',
            type = 'client',
            event = 'qb-vehiclefailure:client:CleanVehicle',
            shouldClose = true
        },{
            id = 'aractamir',
            title = 'Tamir Et',
            icon = 'toolbox',
            type = 'client',
            event = 'qb-vehiclefailure:client:RepairVehicleFull',
            shouldClose = true
        },
    },
    ["redline"] = {
        {
            id = 'billplayer',
            title = 'Fatura Kes',
            icon = 'money-bill',
           type = 'command',
            event = 'fatura',
            shouldClose = true
        },{
            id = 'temizlikfix',
            title = 'Temizle',
            icon = 'water',
            type = 'client',
            event = 'qb-vehiclefailure:client:CleanVehicle',
            shouldClose = true
        },{
            id = 'aractamir',
            title = 'Tamir Et',
            icon = 'toolbox',
            type = 'client',
            event = 'qb-vehiclefailure:client:RepairVehicleFull',
            shouldClose = true
        },
    },
    ["pitstop"] = {
        {
            id = 'billplayer',
            title = 'Fatura Kes',
            icon = 'money-bill',
           type = 'command',
            event = 'fatura',
            shouldClose = true
        }, {
            id = 'araccek',
            title = 'Araç Çek',
            icon = 'car',
            type = 'client',
            event = 'police:client:ImpoundVehicle',
            shouldClose = true
        },{
            id = 'temizlikfix',
            title = 'Temizle',
            icon = 'water',
            type = 'client',
            event = 'qb-vehiclefailure:client:CleanVehicle',
            shouldClose = true
        },{
            id = 'aractamir',
            title = 'Tamir Et',
            icon = 'toolbox',
            type = 'client',
            event = 'qb-vehiclefailure:client:RepairVehicleFull',
            shouldClose = true
        },
    },
    ["tequila"] = {
        {
            id = 'billplayer',
            title = 'Fatura Kes',
            icon = 'money-bill',
           type = 'command',
            event = 'fatura',
            shouldClose = true
        }, {
            id = 'araccek',
            title = 'Araç Çek',
            icon = 'car',
            type = 'client',
            event = 'police:client:ImpoundVehicle',
            shouldClose = true
        },{
            id = 'temizlikfix',
            title = 'Temizle',
            icon = 'water',
            type = 'client',
            event = 'qb-vehiclefailure:client:CleanVehicle',
            shouldClose = true
        },{
            id = 'aractamir',
            title = 'Tamir Et',
            icon = 'toolbox',
            type = 'client',
            event = 'qb-vehiclefailure:client:RepairVehicleFull',
            shouldClose = true
        },
    },
    ["blacklotus"] = {
        {
            id = 'billplayer',
            title = 'Fatura Kes',
            icon = 'money-bill',
           type = 'command',
            event = 'fatura',
            shouldClose = true
        }, {
            id = 'araccek',
            title = 'Araç Çek',
            icon = 'car',
            type = 'client',
            event = 'police:client:ImpoundVehicle',
            shouldClose = true
        },{
            id = 'temizlikfix',
            title = 'Temizle',
            icon = 'water',
            type = 'client',
            event = 'qb-vehiclefailure:client:CleanVehicle',
            shouldClose = true
        },{
            id = 'aractamir',
            title = 'Tamir Et',
            icon = 'toolbox',
            type = 'client',
            event = 'qb-vehiclefailure:client:RepairVehicleFull',
            shouldClose = true
        },
    },
    ["cardealer"] = {
        {
            id = 'billplayer',
            title = 'Fatura Kes',
            icon = 'money-bill',
           type = 'command',
            event = 'fatura',
            shouldClose = true
        }, {
            id = 'araccek',
            title = 'Araç Çek',
            icon = 'car',
            type = 'client',
            event = 'police:client:ImpoundVehicle',
            shouldClose = true
        },{
            id = 'temizlikfix',
            title = 'Temizle',
            icon = 'water',
            type = 'client',
            event = 'qb-vehiclefailure:client:CleanVehicle',
            shouldClose = true
        },{
            id = 'aractamir',
            title = 'Tamir Et',
            icon = 'toolbox',
            type = 'client',
            event = 'qb-vehiclefailure:client:RepairVehicleFull',
            shouldClose = true
        },
    },
    ["mechanic_lscustom"] = {
        {
            id = 'billplayer',
            title = 'Fatura Kes',
            icon = 'money-bill',
           type = 'command',
            event = 'fatura',
            shouldClose = true
        }, {
            id = 'araccek',
            title = 'Araç Çek',
            icon = 'car',
            type = 'client',
            event = 'police:client:ImpoundVehicle',
            shouldClose = true
        },{
            id = 'temizlikfix',
            title = 'Temizle',
            icon = 'water',
            type = 'client',
            event = 'qb-vehiclefailure:client:CleanVehicle',
            shouldClose = true
        },{
            id = 'aractamir',
            title = 'Tamir Et',
            icon = 'toolbox',
            type = 'client',
            event = 'qb-vehiclefailure:client:RepairVehicleFull',
            shouldClose = true
        },
    },
    ["mechanic_lscustom2"] = {
        {
            id = 'billplayer',
            title = 'Fatura Kes',
            icon = 'money-bill',
           type = 'command',
            event = 'fatura',
            shouldClose = true
        }, {
            id = 'araccek',
            title = 'Araç Çek',
            icon = 'car',
            type = 'client',
            event = 'police:client:ImpoundVehicle',
            shouldClose = true
        },{
            id = 'temizlikfix',
            title = 'Temizle',
            icon = 'water',
            type = 'client',
            event = 'qb-vehiclefailure:client:CleanVehicle',
            shouldClose = true
        },{
            id = 'aractamir',
            title = 'Tamir Et',
            icon = 'toolbox',
            type = 'client',
            event = 'qb-vehiclefailure:client:RepairVehicleFull',
            shouldClose = true
        },
    },
    ["mechanic_airport"] = {
        {
            id = 'billplayer',
            title = 'Fatura Kes',
            icon = 'money-bill',
           type = 'command',
            event = 'fatura',
            shouldClose = true
        }, {
            id = 'araccek',
            title = 'Araç Çek',
            icon = 'car',
            type = 'client',
            event = 'police:client:ImpoundVehicle',
            shouldClose = true
        },{
            id = 'temizlikfix',
            title = 'Temizle',
            icon = 'water',
            type = 'client',
            event = 'qb-vehiclefailure:client:CleanVehicle',
            shouldClose = true
        },{
            id = 'aractamir',
            title = 'Tamir Et',
            icon = 'toolbox',
            type = 'client',
            event = 'qb-vehiclefailure:client:RepairVehicleFull',
            shouldClose = true
        },
    },
    ["mechanic_oldhayes"] = {
        {
            id = 'billplayer',
            title = 'Fatura Kes',
            icon = 'money-bill',
           type = 'command',
            event = 'fatura',
            shouldClose = true
        }, {
            id = 'araccek',
            title = 'Araç Çek',
            icon = 'car',
            type = 'client',
            event = 'police:client:ImpoundVehicle',
            shouldClose = true
        },{
            id = 'temizlikfix',
            title = 'Temizle',
            icon = 'water',
            type = 'client',
            event = 'qb-vehiclefailure:client:CleanVehicle',
            shouldClose = true
        },{
            id = 'aractamir',
            title = 'Tamir Et',
            icon = 'toolbox',
            type = 'client',
            event = 'qb-vehiclefailure:client:RepairVehicleFull',
            shouldClose = true
        },
    },
    ["mechanic_hayes"] = {
        {
            id = 'billplayer',
            title = 'Fatura Kes',
            icon = 'money-bill',
           type = 'command',
            event = 'fatura',
            shouldClose = true
        }, {
            id = 'araccek',
            title = 'Araç Çek',
            icon = 'car',
            type = 'client',
            event = 'police:client:ImpoundVehicle',
            shouldClose = true
        },{
            id = 'temizlikfix',
            title = 'Temizle',
            icon = 'water',
            type = 'client',
            event = 'qb-vehiclefailure:client:CleanVehicle',
            shouldClose = true
        },{
            id = 'aractamir',
            title = 'Tamir Et',
            icon = 'toolbox',
            type = 'client',
            event = 'qb-vehiclefailure:client:RepairVehicleFull',
            shouldClose = true
        },
    },
    ["mechanic_illegal"] = {
        {
            id = 'billplayer',
            title = 'Fatura Kes',
            icon = 'money-bill',
           type = 'command',
            event = 'fatura',
            shouldClose = true
        }, {
            id = 'araccek',
            title = 'Araç Çek',
            icon = 'car',
            type = 'client',
            event = 'police:client:ImpoundVehicle',
            shouldClose = true
        },{
            id = 'temizlikfix',
            title = 'Temizle',
            icon = 'water',
            type = 'client',
            event = 'qb-vehiclefailure:client:CleanVehicle',
            shouldClose = true
        },{
            id = 'aractamir',
            title = 'Tamir Et',
            icon = 'toolbox',
            type = 'client',
            event = 'qb-vehiclefailure:client:RepairVehicleFull',
            shouldClose = true
        },
    },
    ["mechanic_ottos"] = {
        {
            id = 'billplayer',
            title = 'Fatura Kes',
            icon = 'money-bill',
           type = 'command',
            event = 'fatura',
            shouldClose = true
        }, {
            id = 'araccek',
            title = 'Araç Çek',
            icon = 'car',
            type = 'client',
            event = 'police:client:ImpoundVehicle',
            shouldClose = true
        },{
            id = 'temizlikfix',
            title = 'Temizle',
            icon = 'water',
            type = 'client',
            event = 'qb-vehiclefailure:client:CleanVehicle',
            shouldClose = true
        },{
            id = 'aractamir',
            title = 'Tamir Et',
            icon = 'toolbox',
            type = 'client',
            event = 'qb-vehiclefailure:client:RepairVehicleFull',
            shouldClose = true
        },
    },

}

Config.TrunkClasses = {
    [0] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes
    [1] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sedans
    [2] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- SUVs
    [3] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes
    [4] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Muscle
    [5] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports Classics
    [6] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports
    [7] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Super
    [8] = {allowed = false, x = 0.0, y = -1.0, z = 0.25}, -- Motorcycles
    [9] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Off-road
    [10] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Industrial
    [11] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Utility
    [12] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Vans
    [13] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Cycles
    [14] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Boats
    [15] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Helicopters
    [16] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Planes
    [17] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Service
    [18] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Emergency
    [19] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Military
    [20] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Commercial
    [21] = {allowed = true, x = 0.0, y = -1.0, z = 0.25} -- Trains
}

Config.ExtrasEnabled = true

Config.Commands = {
    ["tisort"] = {
        Func = function() ToggleClothing("Top") end,
        Sprite = "tisort",
        Desc = "Tişörtünü çıkar veya giy",
        Button = 1,
        Name = "Tisort"
    },
    ["eldiven"] = {
        Func = function() ToggleClothing("gloves") end,
        Sprite = "eldiven",
        Desc = "Eldivenini çıkar veya tak",
        Button = 2,
        Name = "Eldiven"
    },
    ["siperlik"] = {
        Func = function() ToggleProps("visor") end,
        Sprite = "siperlik",
        Desc = "Şapka varyasyonunu değiştir",
        Button = 3,
        Name = "Siperlik"
    },
    ["canta"] = {
        Func = function() ToggleClothing("Bag") end,
        Sprite = "canta",
        Desc = "Çantanı aç veya kapat",
        Button = 8,
        Name = "Canta"
    },
    ["ayakkabi"] = {
        Func = function() ToggleClothing("Shoes") end,
        Sprite = "ayakkabi",
        Desc = "Ayakkabılarını çıkar veya giy",
        Button = 5,
        Name = "Ayakkabi"
    },
    ["yelek"] = {
        Func = function() ToggleClothing("Vest") end,
        Sprite = "yelek",
        Desc = "Yeleğini çıkar veya giy",
        Button = 14,
        Name = "Yelek"
    },
    ["sac"] = {
        Func = function() ToggleClothing("hair") end,
        Sprite = "sac",
        Desc = "Saçını topla veya aç",
        Button = 7,
        Name = "Sac"
    },
    ["sapka"] = {
        Func = function() ToggleProps("Hat") end,
        Sprite = "sapka",
        Desc = "Şapkanı çıkar veya tak",
        Button = 4,
        Name = "Sapka"
    },
    ["gozluk"] = {
        Func = function() ToggleProps("Glasses") end,
        Sprite = "gozluk",
        Desc = "Gözlüklerini çıkar veya tak",
        Button = 9,
        Name = "Gozluk"
    },
    ["kulak"] = {
        Func = function() ToggleProps("Ear") end,
        Sprite = "kulak",
        Desc = "Kulak aksesuarını çıkar veya tak",
        Button = 10,
        Name = "Kulak"
    },
    ["boyun"] = {
        Func = function() ToggleClothing("Neck") end,
        Sprite = "boyun",
        Desc = "Boyun aksesuarını çıkar veya tak",
        Button = 11,
        Name = "Boyun"
    },
    ["saat"] = {
        Func = function() ToggleProps("Watch") end,
        Sprite = "saat",
        Desc = "Saatini çıkar veya tak",
        Button = 12,
        Name = "Saat",
        Rotation = 5.0
    },
    ["bilezik"] = {
        Func = function() ToggleProps("Bracelet") end,
        Sprite = "bilezik",
        Desc = "Bileziğini çıkar veya tak",
        Button = 13,
        Name = "Bilezik"
    },
    ["maske"] = {
        Func = function() ToggleClothing("Mask") end,
        Sprite = "maske",
        Desc = "Maskeni çıkar veya tak",
        Button = 6,
        Name = "Maske"
    }
}

local bags = {[40] = true, [41] = true, [44] = true, [45] = true}

Config.ExtraCommands = {
    ['pantolon'] = {
        Func = function() ToggleClothing('Pants', true) end,
        Sprite = 'pantolon',
        Desc = 'Pantolonunu çıkar veya giy',
        Name = 'Pantolon',
        OffsetX = -0.04,
        OffsetY = 0.0
    },
    ['tisort'] = {
        Func = function() ToggleClothing('Shirt', true) end,
        Sprite = 'tisort',
        Desc = 'Tişörtünü çıkar veya giy',
        Name = 'Tisort',
        OffsetX = 0.04,
        OffsetY = 0.0
    },
    ['reset'] = {
        Func = function()
            if not ResetClothing(true) then
                Notify('Sıfırlanacak bir şey bulunamadı!', 'error')
            end
        end,
        Sprite = 'reset',
        Desc = 'Her şeyi normale döndür',
        Name = 'reset',
        OffsetX = 0.12,
        OffsetY = 0.2,
        Rotate = true
    },
    ['cantaoff'] = {
        Func = function() ToggleClothing('Bagoff', true) end,
        Sprite = 'canta',
        SpriteFunc = function()
            local Bag = GetPedDrawableVariation(PlayerPedId(), 5)
            local BagOff = LastEquipped['Bagoff']
            if LastEquipped['Bagoff'] then
                if bags[BagOff.Drawable] then
                    return 'cantaoff'
                else
                    return 'paraoff'
                end
            end
            if Bag ~= 0 then
                if bags[Bag] then
                    return 'cantaoff'
                else
                    return 'paraoff'
                end
            else
                return false
            end
        end,
        Desc = 'Çantanı çıkar veya tak',
        Name = 'cantaoff',
        OffsetX = -0.12,
        OffsetY = 0.2
    }   

}

local bags = {[40] = true, [41] = true, [44] = true, [45] = true}

Config.ExtraCommands = {
    ['pantolon'] = {
        Func = function() ToggleClothing('Pants', true) end,
        Sprite = 'pants',
        Desc = 'Take your pants off/on',
        Name = 'Pantolon',
        OffsetX = -0.04,
        OffsetY = 0.0
    },
    ['tshirt'] = {
        Func = function() ToggleClothing('Shirt', true) end,
        Sprite = 'shirt',
        Desc = 'Take your shirt off/on',
        Name = 'Tshirt',
        OffsetX = 0.04,
        OffsetY = 0.0
    },
    ['reset'] = {
        Func = function()
            if not ResetClothing(true) then
                Notify('Sıfırlanacak bir şey bulunamadı!', 'error')
            end
        end,
        Sprite = 'reset',
        Desc = 'Revert everything back to normal',
        Name = 'reset',
        OffsetX = 0.12,
        OffsetY = 0.2,
        Rotate = true
    },
    ['bagoff'] = {
        Func = function() ToggleClothing('Bagoff', true) end,
        Sprite = 'bagoff',
        SpriteFunc = function()
            local Bag = GetPedDrawableVariation(PlayerPedId(), 5)
            local BagOff = LastEquipped['Bagoff']
            if LastEquipped['Bagoff'] then
                if bags[BagOff.Drawable] then
                    return 'bagoff'
                else
                    return 'paraoff'
                end
            end
            if Bag ~= 0 then
                if bags[Bag] then
                    return 'bagoff'
                else
                    return 'paraoff'
                end
            else
                return false
            end
        end,
        Desc = 'Take your bag off/on',
        Name = 'bagoff',
        OffsetX = -0.12,
        OffsetY = 0.2
    }
}
