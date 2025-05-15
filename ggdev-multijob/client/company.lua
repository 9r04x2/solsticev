-- client.lua
local QBCore = exports['qb-core']:GetCoreObject()
local ox     = exports.ox_lib

local CONTEXT_ID = 'ate_craft_menu'

-- 1) qb-target ile craft noktalarını ekle, sadece items tablosunu args’ta gönder
Citizen.CreateThread(function()
    for idx, loc in ipairs(Config.CraftLocations) do
        exports['qb-target']:AddBoxZone(
            "craft_" .. idx,
            loc.coords,
            1.0, 1.0,
            {
                name      = "craft_" .. idx,
                heading   = loc.heading or 0,
                debugPoly = false,
                minZ      = loc.coords.z - 1,
                maxZ      = loc.coords.z + 1,
            },
            {
                options = {{
                    type  = "client",
                    event = "ate-basic:openCraftMenu",
                    icon  = "fas fa-hammer",
                    label = "Yemek Yap",
                    job   = loc.job,
                    args  = { items = loc.items },    -- ← sadece items gönder
                }},
                distance = 2.5,
            }
        )
    end
end)

-- 2) Menü açma event’i
RegisterNetEvent('ate-basic:openCraftMenu', function(data)
    local items = data and data.args and data.args.items
    if type(items) ~= 'table' or #items == 0 then
        print("^1[ate-basic]^7 openCraftMenu: geçerli items yok!", items)
        return
    end

    -- kaç item geldiğini logla (debug)
    print(("[ate-basic] Craft edilecek item sayısı: %d"):format(#items))
    openCraftMenu(items)
end)

-- 3) Ox Lib context menüsünü bu fonksiyonda oluştur
function openCraftMenu(items)
    local options = {}

    -- Anahtarlı tabloyu numerik diziye çevir
    if not items[1] then
        for _, value in pairs(items) do
            options[#options+1] = value
        end
    else
        options = items
    end

    local menuOptions = {}
    for _, it in ipairs(options) do
        local reqTxt = ""
        for _, req in ipairs(it.requiredItems or {}) do
            reqTxt = reqTxt .. req.amount .. "x " .. req.label .. ", "
        end
        reqTxt = reqTxt:sub(1, -3)

        menuOptions[#menuOptions+1] = {
            title       = it.label or "İsimsiz",
            description = "Gerekenler: " .. (reqTxt ~= "" and reqTxt or "Yok"),
            image       = "nui://ox_inventory/web/images/" .. (it.image or "question.png"),
            args        = it,
            onSelect    = function(args)
                exports.ox_lib:hideContext()
                TriggerEvent('ate-basic:selectCraftItem', args)
            end
        }
    end

    if #menuOptions == 0 then
        print("[ate-basic] Menü boş, gösterilmeyecek.")
        return
    end

    exports.ox_lib:registerContext({
        id = "ate_craft_menu",
        title = "Yemek Yap",
        options = menuOptions
    })

    exports.ox_lib:showContext("ate_craft_menu")
end

-- 4) Seçilen item için adet sor ve craft event’ine yolla
RegisterNetEvent('ate-basic:selectCraftItem', function(item)
    if not item then return end

    local input = exports['qb-input']:ShowInput({
        header     = "Kaç adet üretmek istiyorsunuz?",
        submitText = "Üret",
        inputs     = {{
            type       = 'number',
            isRequired = true,
            name       = 'count',
            text       = 'Adet',
        }},
    })

    local count = input and tonumber(input.count)
    if not count or count < 1 then
        exports['ZSX_UIV2']:Notification("Hata", "Geçersiz miktar", "fas fa-times-circle", 5000)
        return
    end

    TriggerEvent(
        'ate-basic:craftItems',
        item.name,
        item.label,
        item.requiredItems,
        item.progressTime,
        count
    )
end)

-- 5) Progress bar göster ve bitince server’a gönder
RegisterNetEvent('ate-basic:craftItems', function(itemName, itemLabel, requiredItems, progressTime, count)
    QBCore.Functions.Progressbar(
        'crafting_item',
        'Üretiliyor ' .. itemLabel .. '...',
        progressTime,
        false, true, {
            disableMovement    = true,
            disableCarMovement = true,
            disableMouse       = false,
            disableCombat      = true,
        }, {
            animDict = "mini@repair",
            anim     = "fixing_a_player",
            flags    = 16,
        }, {}, {}, function()
            TriggerServerEvent('ate-basic:craftItems', itemName, requiredItems, count)
        end, function()
            exports['ZSX_UIV2']:Notification("Hata", "Craft işlemi iptal edildi", "fas fa-times-circle", 5000)
        end
    )
end)
