local QBCore = exports['qb-core']:GetCoreObject()
local alcoholCount = 0
local parachuteEquipped = false

RegisterNetEvent('QBCore:Client:UpdateObject', function()
    QBCore = exports['qb-core']:GetCoreObject()
end)

local function loadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return end
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(100)
    end
end

local function EquipAnim()
    loadAnimDict('clothingshirt')
    TaskPlayAnim(PlayerPedId(), 'clothingshirt', 'try_shirt_positive_d', 8.0, 1.0, -1, 49, 0, false, false, false)
end

RegisterNetEvent('consumables:client:UseMedikit', function()
    local ped = PlayerPedId()
    local health = GetEntityHealth(ped)

    if health >= 200 then
        QBCore.Functions.Notify('Zaten tam sağlıklısın!', 'error')
        return
    end
    EquipAnim()
    QBCore.Functions.Progressbar('use_medikit', 'Medikit kullanılıyor...', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        SetEntityHealth(ped, 200)
        QBCore.Functions.Notify('Medikit kullanıldı, sağlığın tam!', 'success')
    end)
end)

RegisterNetEvent('consumables:client:Eat', function(itemName)
    QBCore.Functions.Progressbar('eat_something', 'Yemek yiyorsun', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mp_player_inteat@burger',
        anim = 'mp_player_int_eat_burger',
        flags = 49
    }, {
        model = 'prop_cs_burger_01',
        bone = 60309,
        coords = vec3(0.0, 0.0, -0.02),
        rotation = vec3(30, 0.0, 0.0),
    }, {}, function()
        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        TriggerServerEvent('consumables:server:addHunger', QBCore.Functions.GetPlayerData().metadata.hunger + Config.Consumables.eat[itemName])
    end)
end)

RegisterNetEvent('consumables:client:Drink', function(itemName)
    QBCore.Functions.Progressbar('drink_something', 'İçecek içiyorsun', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mp_player_intdrink',
        anim = 'loop_bottle',
        flags = 49
    }, {
        model = 'vw_prop_casino_water_bottle_01a',
        bone = 60309,
        coords = vec3(0.0, 0.0, -0.05),
        rotation = vec3(0.0, 0.0, -40),
    }, {}, function()
        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        TriggerServerEvent('consumables:server:addThirst', QBCore.Functions.GetPlayerData().metadata.thirst + Config.Consumables.drink[itemName])
    end)
end)

RegisterNetEvent('consumables:client:DrinkAlcohol', function(itemName)
    QBCore.Functions.Progressbar('drink_alcohol', 'Alkol içiyorsun', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mp_player_intdrink',
        anim = 'loop_bottle',
        flags = 49
    }, {
        model = 'prop_cs_beer_bot_40oz',
        bone = 60309,
        coords = vec3(0.0, 0.0, -0.05),
        rotation = vec3(0.0, 0.0, -40),
    }, {}, function()
        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        TriggerServerEvent('consumables:server:drinkAlcohol', itemName)
        TriggerServerEvent('consumables:server:addThirst', QBCore.Functions.GetPlayerData().metadata.thirst + Config.Consumables.alcohol[itemName])
        alcoholCount += 1
        AlcoholLoop()
    end, function()
        QBCore.Functions.Notify('İşlem iptal edildi!', 'error')
    end)
end)

RegisterNetEvent('consumables:client:UseParachute', function()
    EquipAnim()
    QBCore.Functions.Progressbar('use_parachute', 'Paraşüt giyiliyor', 10000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        local ped = PlayerPedId()
        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['parachute'], 'remove')
        GiveWeaponToPed(ped, `GADGET_PARACHUTE`, 1, false, false)
        local parachuteData = {
            outfitData = {['bag'] = {item = 7, texture = 0 }}
        }
        TriggerEvent('qb-clothing:client:loadOutfit', parachuteData)
        parachuteEquipped = true
        TaskPlayAnim(ped, 'clothingshirt', 'exit', 8.0, 1.0, -1, 49, 0, false, false, false)
    end)
end)

RegisterNetEvent('consumables:client:UseArmor', function()
    EquipAnim()
    QBCore.Functions.Progressbar('use_armor', 'Hafif zırh giyiliyor', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('consumables:server:useArmor')
    end)
end)

RegisterNetEvent('consumables:client:UseHeavyArmor', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
        if GetPedArmour(PlayerPedId()) >= 100 then
            QBCore.Functions.Notify('Yeterince zırhın var!', 'error')
            return
        end
        EquipAnim()
        QBCore.Functions.Progressbar('use_heavyarmor', 'Ağır zırh giyiliyor', 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            TriggerServerEvent('consumables:server:useHeavyArmor')
        end)
end)

local iswearingsuit = false
local oxygen = 0
local currentGear = {mask = 0, tank = 0, enabled = false}

local function deleteGear()
	if currentGear.mask ~= 0 then
        DetachEntity(currentGear.mask, 0, 1)
        DeleteEntity(currentGear.mask)
		currentGear.mask = 0
    end
	if currentGear.tank ~= 0 then
        DetachEntity(currentGear.tank, 0, 1)
        DeleteEntity(currentGear.tank)
		currentGear.tank = 0
	end
end

local function gearAnim()
    RequestAnimDict('clothingshirt')
    while not HasAnimDictLoaded('clothingshirt') do
        Wait(100)
    end
	TaskPlayAnim(PlayerPedId(), 'clothingshirt', 'try_shirt_positive_d', 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

RegisterNetEvent('qb-diving:client:UseGear', function()
    local ped = PlayerPedId()
    if iswearingsuit == false then
            iswearingsuit = true
            if not IsPedSwimming(ped) and not IsPedInAnyVehicle(ped) then
                gearAnim()
                oxygen = Config.DiveTimer * 60
                TriggerServerEvent('qb-diving:removeItem', 'divingsuit')
                QBCore.Functions.Progressbar('equip_gear', 'Ekipman giyiliyor', 5000, false, true, {}, {}, {}, {},
                    function()
                        deleteGear()
                        local maskModel = `p_d_scuba_mask_s`
                        local tankModel = `p_s_scuba_tank_s`
                        RequestModel(tankModel)
                        while not HasModelLoaded(tankModel) do
                            Wait(100)
                        end
                        currentGear.tank = CreateObject(tankModel, 1.0, 1.0, 1.0, 1, 1, 0)
                        local bone1 = GetPedBoneIndex(ped, 24818)
                        AttachEntityToEntity(currentGear.tank, ped, bone1, -0.25, -0.25, 0.0, 180.0, 90.0, 0.0, 1, 1, 0, 0, 2, 1)
                        RequestModel(maskModel)
                        while not HasModelLoaded(maskModel) do
                            Wait(100)
                        end
                        currentGear.mask = CreateObject(maskModel, 1.0, 1.0, 1.0, 1, 1, 0)
                        local bone2 = GetPedBoneIndex(ped, 12844)
                        AttachEntityToEntity(currentGear.mask, ped, bone2, 0.0, 0.0, 0.0, 180.0, 90.0, 0.0, 1, 1, 0, 0, 2, 1)
                if IsPedMale(ped) then
                    SetPedComponentVariation(ped, 3, Config.DiveClothesMale['Arms'].code, Config.DiveClothesMale['Arms'].color)
                    SetPedComponentVariation(ped, 1, Config.DiveClothesMale['Mask'].code, Config.DiveClothesMale['Mask'].color)
                else
                    SetPedComponentVariation(ped, 3, Config.DiveClothesFemale['Arms'].code, Config.DiveClothesFemale['Arms'].color)
                    SetPedComponentVariation(ped, 1, Config.DiveClothesFemale['Mask'].code, Config.DiveClothesFemale['Mask'].color)
                end
                    SetEnableScuba(ped, true)
                    SetPedMaxTimeUnderwater(ped, 2000.00)
                    currentGear.enabled = true
                    ClearPedTasks(ped)
                    Citizen.CreateThread(function()
                        while currentGear.enabled do
                            if IsPedSwimmingUnderWater(PlayerPedId()) then
                                oxygen = oxygen - 1
                                if oxygen == 0 then
                                    SetEnableScuba(ped, false)
                                    SetPedMaxTimeUnderwater(ped, 1.00)
                                    currentGear.enabled = false
                                    iswearingsuit = false
                                end
                            end
                            Wait(1000)
                        end
                    end)
                end)
            else
                QBCore.Functions.Notify('Dalış ekipmanlarını giymeniz için ayakta olmalısınız.', 'error')
            end
        elseif iswearingsuit == true then
            gearAnim()
            QBCore.Functions.Progressbar('remove_gear', 'Ekipman giyiliyor', 5000, false, true, {}, {}, {}, {},
            function()
                SetEnableScuba(ped, false)
                SetPedMaxTimeUnderwater(ped, 50.00)
                currentGear.enabled = false
                ClearPedTasks(ped)
                deleteGear()
                QBCore.Functions.Notify('Dalgıç kıyafetini çıkarttın.', 'success')
                iswearingsuit = false
                oxygen = oxygen
            end)
        ExecuteCommand('yenile')
    end
end)

function DrawTextWater(text)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextScale(0.0, 0.45)
	SetTextDropshadow(1, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry('STRING')
	AddTextComponentString(text)
    DrawText(0.45, 0.90)
end

CreateThread(function()
    while true do
        Wait(200)
        if currentGear.enabled == true and iswearingsuit == true then
            if IsPedSwimmingUnderWater(PlayerPedId()) then
                DrawTextWater(oxygen..'⏱')
            end
        end
    end
end)

RegisterCommand('divingsuit', function()
    if iswearingsuit == true then
        gearAnim()
        SetEnableScuba(ped, false)
        SetPedMaxTimeUnderwater(ped, 50.00)
        currentGear.enabled = false
        ClearPedTasks(ped)
        deleteGear()
        iswearingsuit = false
        oxygen = oxygen
        ExecuteCommand('yenile')
    end
end)

local looped = false

function AlcoholLoop()
    if not looped then
        looped = true
        CreateThread(function()
            while true do
                Wait(200)
                if alcoholCount > 0 then
                    Wait(1000 * 60 * 15)
                    alcoholCount -= 1
                else
                    looped = false
                    break
                end
            end
        end)
    end
end

local skinData = {
    ["hair"] = {
        item = 0,
        texture = 0,
        defaultItem = 0,
        defaultTexture = 0
    },
    ["face2"] = {
        item = 0,
        texture = 0,
        defaultItem = 0,
        defaultTexture = 0
    },
    ["facemix"] = {
        skinMix = 0,
        shapeMix = 0,
        defaultSkinMix = 0.0,
        defaultShapeMix = 0.0
    }
}

local defaultHairMale = 18
local defaultHairFemale = 4
local oldHair = {
    item = -1,
    texture = -1
}
local sinirS = 0
RegisterCommand("toka", function()
    if skinData["hair"].item == 0 then
        skinData["hair"].item = GetPedDrawableVariation(PlayerPedId(), 2)
    end
    if GetGameTimer() > sinirS then
        sinirS = GetGameTimer() + 5000
        local playerPed = PlayerPedId()
        oldHair.texture = GetPedHairColor(playerPed)
        oldHair.texture2 = GetPedHairHighlightColor(playerPed)
        local defaultHair = defaultHairFemale
        if GetEntityModel(playerPed) == 1885233650 then
            defaultHair = defaultHairMale
        end 
        if oldHair.item == -1 then
            oldHair.item = defaultHair
        end
        if oldHair.item == defaultHair then
            ExecuteCommand('me Tokasını çıkartıp saçını bağlamaya başlar')
            Citizen.Wait(1000)
            SetPedComponentVariation(playerPed, 2, defaultHair, 0, 0)
            oldHair.item = skinData["hair"].item
            Citizen.Wait(1000)
            ExecuteCommand('do Saçında toka olduğu görülebilir')
        else
            ExecuteCommand('me Saçındaki tokayı çıkartır')
            Citizen.Wait(1000)
            SetPedComponentVariation(playerPed, 2, oldHair.item, 0, 0)
            oldHair.item = defaultHair
        end
        SetPedHairColor(playerPed, oldHair.texture, oldHair.texture2)
    end
end)