local tables = {
    {coords = vector3(-583.76, -1060.40, 21.66), stashId = "masa1"}, -- 1. masa
    {coords = vector3(-585.53, -1063.53, 22.34), stashId = "masa2"}, -- 2. masa
    {coords = vector3(122.11, -1037.03, 28.54), stashId = "masa3"}, -- 3. masa
    {coords = vector3(120.32, -1041.76, 28.51), stashId = "masa4"}, -- 4. masa
    {coords = vector3(-1188.50, -894.34, 13.37), stashId = "masa5"}, -- 5. masa
    {coords = vector3(-1189.51, -895.52, 13.00), stashId = "masa6"}, -- 6. masa
    {coords = vector3(-1080.42, -319.77, 36.52), stashId = "masa7"}, -- 7. masa
    {coords = vector3(-1075.95, -314.1, 36.98), stashId = "masa8"},  -- 8. masa
    {coords = vector3(177.82, -235.68, 54.05), stashId = "masa9"},  -- 9. masa
    {coords = vector3(274.63, 137.35, 103.33), stashId = "masa10"},  -- 10. masa
    {coords = vector3(473.35, 5382.49, 670.76), stashId = "masa11"},  -- 11. masa
    {coords = vector3(-634.72, 235.17, 81.07), stashId = "masa12"},  -- 12. masa 
    {coords = vector3(188.53, -242.17, 52.93), stashId = "masa13"},  -- 12. masa
    {coords = vector3(-369.84, 203.42, 76.49), stashId = "masa14"},  -- 12. masa
    {coords = vector3(-293.82391357422,-67.469459533691,49.355987548828), stashId = "masa15"},  -- 12. masa 
    {coords = vector3(-295.05868530273,-71.21174621582,49.359424591064), stashId = "masa16"},  -- 12. masa  
    {coords = vector3(835.4410, -113.8855, 80.7722), stashId = "masa17"},  -- 12. masa  
    {coords = vector3(1985.1190, 3054.0881, 48.1936), stashId = "masa18"},  -- 12. masa  
    {coords = vector3(247.2120, -3162.6338, -1.10), stashId = "masa19"},  -- 12. masa  
    {coords = vector3(16.4520, -1108.6082, 28.8935), stashId = "masa20"},  -- 12. masa  
    {coords = vector3(127.8311, -1284.5470, 29.2693), stashId = "masa21"},  -- 12. masa  
    {coords = vector3(1249.9453125,-359.22457885742,68.994728088379), stashId = "masa22"},  -- 12. masa   
    {coords = vector3(-560.7690, 286.9946, 83.3358), stashId = "masa23"}  -- 12. masa   
}

local hudHidden = false

RegisterCommand("hud", function(source, args, rawCommand)
    hudHidden = not hudHidden  
    exports['ZSX_UIV2']:HideInterface(hudHidden)
    
    if hudHidden then
        print("HUD gizlendi!")
    else
        print("HUD açıldı!")
    end
end, false)


-- Masalar için etkileşim ekle
Citizen.CreateThread(function()
    for _, tableData in ipairs(tables) do
        exports['qb-target']:AddBoxZone("masa_"..tableData.stashId, tableData.coords, 1, 1, {
            name = "masa_"..tableData.stashId,
            heading = 0,
            debugPoly = false,
            minZ = tableData.coords.z - 1.0,
            maxZ = tableData.coords.z + 1.0,
        }, {
            options = {
                {
                    type = "client",
                    event = "custom:client:openStash",
                    icon = "fas fa-box",
                    label = "Tezgahı Aç",
                    stashId = tableData.stashId -- Benzersiz stash ID'sini gönderiyoruz
                },
            },
            distance = 2.0
        })
    end
end)

-- Stash açma olayı
RegisterNetEvent('custom:client:openStash', function(data)
    local stashId = data.stashId
    local stashLabel = "Tezgah Deposu (" .. stashId .. ")"

    -- qb-inventory kullanarak stash açma işlemi
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', stashId, {
        maxweight = 1000 * 1000, -- 1000 kg
        slots = 250,
        label = stashLabel
    })
    TriggerEvent('inventory:client:SetCurrentStash', stashId)
end)
