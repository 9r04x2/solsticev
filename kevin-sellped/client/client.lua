local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    local hash = Config.PedProps.hash
    QBCore.Functions.LoadModel(hash)

    local locations = {
        Config.PedProps.location,
        Config.PedProps.location2
    }

    for _, coords in pairs(locations) do
        local buyerPed = CreatePed(0, hash, coords.x, coords.y, coords.z - 1.0, coords.w, false, false)
        TaskStartScenarioInPlace(buyerPed, 'WORLD_HUMAN_CLIPBOARD', true)
        FreezeEntityPosition(buyerPed, true)
        SetEntityInvincible(buyerPed, true)
        SetBlockingOfNonTemporaryEvents(buyerPed, true)

        exports['qb-target']:AddTargetEntity(buyerPed, {
            options = {{
                icon   = 'fas fa-circle',
                label  = 'Konuş',
                action = function()
                    local job = QBCore.Functions.GetPlayerData().job.name
                    if job ~= 'lojistik' and job ~= 'sacred' then
                        QBCore.Functions.Notify('Bu işlemi gerçekleştirmek için lojistik veya sacred işine sahip olmalısın.', 'error')
                        return
                    end
                    ShowMenu()
                end,
            }},
            distance = 2.0
        })
    end
end)

function ShowMenu()
    local menu = {
        id      = 'item-menu',
        title   = 'Satılabilir Ürünler',
        options = {}
    }

    for itemName, info in pairs(Config.Items) do
        local itemData = exports.ox_inventory:Items(itemName)                    
        local label    = itemData and itemData.label or itemName

        if QBCore.Functions.HasItem(itemName) then
            menu.options[#menu.options+1] = {
                title       = label .. " · $" .. info.price,
                description = 'Ücret: $' .. info.price,
                event       = 'kevin-sellped:giveinput',
                args        = { item = itemName, price = info.price }
            }
        end
    end

    if #menu.options == 0 then
        QBCore.Functions.Notify('Satılabilecek eşyan yok.', 'error')
        return
    end

    lib.registerContext(menu)
    lib.showContext('item-menu')
end

RegisterNetEvent('kevin-sellped:giveinput', function(data)
    local header = 'Item: ' .. data.item

    local input = lib.inputDialog(header, {
        { type = 'input',  label = 'Kaçtane Satıcaksın',     placeholder = '10' },
        { type = 'select', label = 'Ödeme Yöntemi',  options = {
            { value = 'cash', label = 'Nakit', icon = 'fas fa-wallet' },
            { value = 'bank', label = 'Bank', icon = 'fas fa-landmark' },
        }},
    })
    if not input then return end

    local amount = tonumber(input[1])
    local method = input[2]

    if not amount or amount < 1 then
        QBCore.Functions.Notify('Geçerli bir miktar gir.', 'error')
        return
    end
    if not method then
        QBCore.Functions.Notify('Ödeme yöntemi seç.', 'error')
        return
    end

    TriggerServerEvent('kevin-sellped:sellitem', data.item, data.price, amount, method)
end)
