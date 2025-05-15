Config = {}

Config.CraftPeds = {
    ['test'] = {
        model = "s_m_y_construct_01",
        coords =  vector4(61.1423, -771.9042, 17.7962, 164.9711),
        label = 'Konuş Michael ile',
        items = {
            ["weapon_browning"] = {
                label = "Browning",
                time = 10000,
                requiredItems = {
                    { item = "weapon_glock19gen4", amount = 1 },
                    { item = "weapon_dp9", amount = 1 }
                }
            },
            ["heavyarmor"] = {
                label = "Ağir Zirh",
                time = 5000,
                requiredItems = {
                    { item = "armor", amount = 3 },
                }
            },
            ["drone"] = {
                label = "Drone",
                time = 5000,
                requiredItems = {
                    { item = "drone_lspd", amount = 8 },
                }
            },
            ["weapon_glock20"] = {
                label = "Glock 20",
                time = 5000,
                requiredItems = {
                    { item = "weapon_browning", amount = 1 },
                    { item = "weapon_browning", amount = 1 },
                }
            }
        }
    }
}



Config.Locale = "tr" -- tr or en

Config.Locales = {
    ["en"] = {
        menu_header = "Crafting",
        crafting_in_progress = "Crafting in Progress...",
        craft_complete = "Craft Complete!",
        not_enough_materials = "Not Enough Materials!",
        select_craft_amount = "Select Craft Amount",
        enter_craft_amount = "How many do you want to craft?",
        invalid_amount = "Invalid amount!",
        required_items = "Required items:"
    },
    ["tr"] = {
        menu_header = "Crafting",
        crafting_in_progress = "Craft Yapılıyor...",
        craft_complete = "Craft tamamlandı!",
        not_enough_materials = "Yeterli malzeme yok!",
        select_craft_amount = "Craft Miktarı Seç",
        enter_craft_amount = "Kaç adet craftlamak istiyorsun?",
        invalid_amount = "Geçerli bir miktar gir!",
        required_items = "Gerekli eşyalar:"
    }
}


function Locales(key)
    local lang = Config.Locale
    return Config.Locales[lang][key] or key
end
