QBCore = exports['qb-core']:GetCoreObject()

Config = {}

Config.RenewedPhone = false --> Set to true if you are using Renewed scripts their qb-phone
Config.idcard = "default" -- default, bl_idcard, qbx_idcard, um_idcard

-- Ped spawner
Config.ped = {
    enabled = true,
    model = "a_m_m_hasjew_01",
    coords = vector4(-552.51, -202.82, 37.24, 337.79),
    label = "Vatandaş İşlemleri"
}

Config.blip = {
    enabled = false,
    Name = "LSDOJ",
    SpriteId = 487,
    Color = 2,
    Scale = 0.8,
    ShortRange = true,
    Alpha = 255,  
    Coords = vector3(-552.51, -202.82, 38.24)
}

-- Jobs for hire
Config.jobs = { 
}

-- Items for purchase
Config.items = {{
    item = "id_card",
    meta = 'id',
    label = "Kimlik",
    price = 10,
    id_card = true
}, 

{
    item = "driver_license",
    label = "Sürücü Lisansı",
    meta = 'driver',
    price = 10,
    id_card = true 
},
{
    item = "lawyerpass",
    label = "Meslek Kartı",
    meta = 'driver',
    price = 10,
    id_card = true 
}} 

-- {
--     item = "weaponlicense",
--     label = "Silah Lisansı",
--     meta = 'weapon',
--     price = 100,
--     id_card = true
-- }}

-- Items shown in the information tab
Config.licenseItems = {{
    item = 'id_card',
    label = 'Kimlik'
}, 

{
    item = 'driver_license',
    label = 'Sürücü Lisansı'
}}

-- {
--     item = 'weaponlicense',
--     label = 'Silah Lisansı'
-- }}
