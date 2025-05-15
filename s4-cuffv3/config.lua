Config = {}

Config.CuffItem = 'cuff'
Config.CuffKeysItem = 'cuff_keys'
Config.RopeItem = 'rope'
Config.BagToHeadItem = 'headbag'
Config.ElectronicCuffItem = 'electrocuff'
Config.ElectronicCuffTrackerItem = 'electrocufftracker'

Config.InventoryOpenKey = 289 -- Disables this input when user is cuffed
Config.DisableWhenUserCuffed = {289, 37, 192, 204, 211, 349, 75, 112}


Config.HandcuffIMG = 'https://raw.githubusercontent.com/0resmon/db/main/img/black.png'
Config.HandcuffDefaultIMG = 'https://raw.githubusercontent.com/0resmon/db/main/img/prop_chrome_03.png'
Config.HandcuffSound = 'https://raw.githubusercontent.com/0resmon/db/main/sound/handcuff.mp3'

Config.RealtimeGPS = false -- WARNING: Enabling this option will enable realtime gps isntead of just marking gps location on tablet but it may cause a lot of cps/ram usage on both client and server side.
Config.RealtimeGPSRefreshMS = 1000 -- WARNING: This option directly affect cpu/ram usage, so be carefull when changing it! It controls how fast the gps will refresh itself

Config.TestMode = false

Config.GetClosestPlayer = function()
   return QBCore.Functions.GetClosestPlayer()
end

Config.Lang = {
["no_one_nearby"] = "Yakınlarda kimse yok",
["no_one_nearby_cuff"] = "Yakınlarda kelepçe takabilecek kimse yok.",
["no_one_nearby_cuff2"] = "O ellerini yukarı kaldırmalı.",
["menu_title"] = "Yardım Menüsü",
["put_bag"] = "Başındaki poşeti çıkar.",
["arac_bin"] = "Oyuncuyu araca koy",
["arac_in"] = "Oyuncuyu araçtan çıkar",
["bacak_coz"] = "Bacağındaki ipi çöz",
["bant_cikar"] = "Ağzındaki bandı tak/çıkar",
["tasi"] = "Oyuncuyu taşı",
["birak"] = "Oyuncuyu bırak",
["tape_type"] = "Bant tipini seç",
["bant"] = "Siyah bant",
["money"] = "Nakit",
}

Config.MenuElements = {
  
    { value = "arac_bin", label = Config.Lang["arac_bin"] },
    { value = "arac_in", label = Config.Lang["arac_in"] },
    { value = "bacak_coz", label = Config.Lang["bacak_coz"] },
    { value = "bant_cikar", label = Config.Lang["bant_cikar"] },
    { value = "tasi", label = Config.Lang["tasi"] },
    { value = "birak", label = Config.Lang["birak"] }
}
