local currentMenuItemID = 0
local currentMenuItem = ""
local currentMenuItem2 = ""
local currentMenu = "mainMenu"
local currentCategory = 0
local currentResprayCategory = 0
local currentResprayType = 0
local currentWheelCategory = 0
local currentNeonSide = 0

local function toggleMenuContainer(state)
    SendNUIMessage({
        toggleMenuContainer = true,
        state = state
    })
end

local function createMenu(menu, heading, subheading)
    SendNUIMessage({
        createMenu = true,
        menu = menu,
        heading = heading,
        subheading = subheading
    })
end

local function destroyMenus()
    SendNUIMessage({
        destroyMenus = true
    })
end

local function populateMenu(menu, id, item, item2)
    SendNUIMessage({
        populateMenu = true,
        menu = menu,
        id = id,
        item = item,
        item2 = item2
    })
end

local function finishPopulatingMenu(menu)
    SendNUIMessage({
        finishPopulatingMenu = true,
        menu = menu
    })
end

local function updateMenuHeading(menu)
    SendNUIMessage({
        updateMenuHeading = true,
        menu = menu
    })
end

local function updateMenuSubheading(menu)
    SendNUIMessage({
        updateMenuSubheading = true,
        menu = menu
    })
end

local function updateMenuStatus(text)
    SendNUIMessage({
        updateMenuStatus = true,
        statusText = text
    })
end

local function toggleMenu(state, menu)
    SendNUIMessage({
        toggleMenu = true,
        state = state,
        menu = menu
    })
end

local function updateItem2Text(menu, id, text)
    SendNUIMessage({
        updateItem2Text = true,
        menu = menu,
        id = id,
        item2 = text
    })
end

local function updateItem2TextOnly(menu, id, text)
    SendNUIMessage({
        updateItem2TextOnly = true,
        menu = menu,
        id = id,
        item2 = text
    })
end

local function scrollMenuFunctionality(direction, menu)
    SendNUIMessage({
        scrollMenuFunctionality = true,
        direction = direction,
        menu = menu
    })
end

local function playSoundEffect(soundEffect, volume)
    SendNUIMessage({
        playSoundEffect = true,
        soundEffect = soundEffect,
        volume = volume
    })
end

local function isMenuActive(menu)
    local menuActive = false
    if menu == "modMenu" then
        for _, v in pairs(vehicleCustomisation) do
            if (v.category:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true

                break
            else
                menuActive = false
            end
        end
    elseif menu == "ResprayMenu" then
        for _, v in pairs(vehicleResprayOptions) do
            if (v.category:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true

                break
            else
                menuActive = false
            end
        end
    elseif menu == "WheelsMenu" then
        for _, v in pairs(vehicleWheelOptions) do
            if (v.category:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true

                break
            else
                menuActive = false
            end
        end
    elseif menu == "NeonsSideMenu" then
        for _, v in pairs(vehicleNeonOptions.neonTypes) do
            if (v.name:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true

                break
            else
                menuActive = false
            end
        end
    end
    return menuActive
end

local function updateCurrentMenuItemID(id, item, item2)
    currentMenuItemID = id
    currentMenuItem = item
    currentMenuItem2 = item2
    if isMenuActive("modMenu") then
        if currentCategory ~= 18 then
            PreviewMod(currentCategory, currentMenuItemID)
        end
    elseif isMenuActive("ResprayMenu") then
        PreviewColour(currentResprayCategory, currentResprayType, currentMenuItemID)
    elseif isMenuActive("WheelsMenu") then
        if currentWheelCategory ~= -1 and currentWheelCategory ~= 20 then
            PreviewWheel(currentCategory, currentMenuItemID, currentWheelCategory)
        end
    elseif isMenuActive("NeonsSideMenu") then
        PreviewNeon(currentNeonSide, currentMenuItemID)
    elseif currentMenu == "WindowTintMenu" then
        PreviewWindowTint(currentMenuItemID)
    elseif currentMenu == "NeonColoursMenu" then
        local r = vehicleNeonOptions.neonColours[currentMenuItemID].r
        local g = vehicleNeonOptions.neonColours[currentMenuItemID].g
        local b = vehicleNeonOptions.neonColours[currentMenuItemID].b
        PreviewNeonColour(r, g, b)
    elseif currentMenu == "XenonColoursMenu" then
        PreviewXenonColour(currentMenuItemID)
    elseif currentMenu == "OldLiveryMenu" then
        PreviewOldLivery(currentMenuItemID)
    elseif currentMenu == "PlateIndexMenu" then
        PreviewPlateIndex(currentMenuItemID)
    end
end

function InitiateMenus(isMotorcycle, vehicleHealth, categories, welcomeLabel)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if vehicleHealth < 1000.0 and categories.repair then
        local repairCost = math.ceil(1000 - vehicleHealth)
        TriggerServerEvent("qb-customs:server:updateRepairCost", "1")
        createMenu("repairMenu", welcomeLabel, "Repair Vehicle")
        populateMenu("repairMenu", -1, "Repair", "$1")
        finishPopulatingMenu("repairMenu")
    end
    createMenu("mainMenu", welcomeLabel, "Choose a Category")
    for _, v in ipairs(vehicleCustomisation) do
        local _, amountValidMods = CheckValidMods(v.category, v.id)
        if amountValidMods > 0 or v.id == 18 then
            if (v.id == 11 or v.id == 12 or v.id == 13 or v.id == 15) then
                if categories.mods and maxVehiclePerformanceUpgrades ~= -1 then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            elseif v.id == 16 then
                if categories.armor then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            elseif v.id == 14 then
                if categories.horn then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            elseif v.id == 18 then
                if categories.turbo then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            elseif v.id == 48 then
                if categories.liveries then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            else
                if categories.cosmetics then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            end
        end
    end
    if categories.respray then populateMenu("mainMenu", -1, "Respray", "none") end

    if not isMotorcycle then
        if categories.tint then populateMenu("mainMenu", -2, "Window Tint", "none") end
        if categories.neons then populateMenu("mainMenu", -3, "Neons", "none") end
    end
    if categories.xenons then populateMenu("mainMenu", 22, "Xenons", "none") end
    if categories.wheels then populateMenu("mainMenu", 23, "Wheels", "none") end

    local livCount = GetVehicleLiveryCount(plyVeh)
    if livCount > 0 and categories.liveries then
        populateMenu("mainMenu", 24, "Old Livery", "none")
    end
    if categories.plate then populateMenu("mainMenu", 25, "Plate Index", "none") end
    if categories.extras then populateMenu("mainMenu", 26, "Vehicle Extras", "none") end
    finishPopulatingMenu("mainMenu")
    for _, v in ipairs(vehicleCustomisation) do
        local validMods, amountValidMods = CheckValidMods(v.category, v.id)
        local currentMod, _ = GetCurrentMod(v.id)
        if amountValidMods > 0 or v.id == 18 then
            if v.id == 11 or v.id == 12 or v.id == 13 or v.id == 15 or v.id == 16 then
                local tempNum = 0
                createMenu(v.category:gsub("%s+", "") .. "Menu", v.category, "Choose an Upgrade")
                for _, n in pairs(validMods) do
                    tempNum = tempNum + 1
                    if maxVehiclePerformanceUpgrades == 0 then
                        populateMenu(v.category:gsub("%s+", "") .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.performance.prices[tempNum])
                        if currentMod == n.id then
                            updateItem2Text(v.category:gsub("%s+", "") .. "Menu", n.id, "Installed")
                        end
                    else
                        if tempNum <= (maxVehiclePerformanceUpgrades + 1) then
                            populateMenu(v.category:gsub("%s+", "") .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.performance.prices[tempNum])
                            if currentMod == n.id then
                                updateItem2Text(v.category:gsub("%s+", "") .. "Menu", n.id, "Installed")
                            end
                        end
                    end
                end
                finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
            elseif v.id == 18 then
                local currentTurboState = GetCurrentTurboState()
                createMenu(v.category:gsub("%s+", "") .. "Menu", v.category .. " Customisation", "Enable or Disable Turbo")
                populateMenu(v.category:gsub("%s+", "") .. "Menu", -1, "Disable", "$0")
                populateMenu(v.category:gsub("%s+", "") .. "Menu", 0, "Enable", "$" .. vehicleCustomisationPrices.turbo.prices[2])
                updateItem2Text(v.category:gsub("%s+", "") .. "Menu", currentTurboState, "Installed")
                finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
            else
                createMenu(v.category:gsub("%s+", "") .. "Menu", v.category .. " Customisation", "Choose a Mod")
                for _, n in pairs(validMods) do
                    populateMenu(v.category:gsub("%s+", "") .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.cosmetics.price)
                    if currentMod == n.id then
                        updateItem2Text(v.category:gsub("%s+", "") .. "Menu", n.id, "Installed")
                    end
                end
                finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
            end
        end
    end
    createMenu("ResprayMenu", "Respray", "Choose a Colour Category")
    populateMenu("ResprayMenu", 0, "Primary Colour", "none")
    populateMenu("ResprayMenu", 1, "Secondary Colour", "none")
    populateMenu("ResprayMenu", 2, "Pearlescent Colour", "none")
    populateMenu("ResprayMenu", 3, "Wheel Colour", "none")
    populateMenu("ResprayMenu", 4, "Interior Colour", "none")
    populateMenu("ResprayMenu", 5, "Dashboard Colour", "none")
    finishPopulatingMenu("ResprayMenu")
    createMenu("ResprayTypeMenu", "Respray Types", "Choose a Colour Type")
    for _, v in ipairs(vehicleResprayOptions) do
        populateMenu("ResprayTypeMenu", v.id, v.category, "none")
    end
    finishPopulatingMenu("ResprayTypeMenu")
    for _, v in ipairs(vehicleResprayOptions) do
        createMenu(v.category .. "Menu", v.category .. " Colours", "Choose a Colour")
        for _, n in ipairs(v.colours) do
            populateMenu(v.category .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.respray.price)
        end
        finishPopulatingMenu(v.category .. "Menu")
    end
    createMenu("WheelsMenu", "Wheel Categories", "Choose a Category")
    for _, v in ipairs(vehicleWheelOptions) do
        if isMotorcycle then
            if v.id == -1 or v.id == 20 or v.id == 6 then 
                populateMenu("WheelsMenu", v.id, v.category, "none")
            end
        else
            populateMenu("WheelsMenu", v.id, v.category, "none")
        end
    end
    finishPopulatingMenu("WheelsMenu")
    for _, v in ipairs(vehicleWheelOptions) do
        if v.id == -1 then
            local currentCustomWheelState = GetCurrentCustomWheelState()
            createMenu(v.category:gsub("%s+", "") .. "Menu", v.category, "Enable or Disable Custom Wheels")
            populateMenu(v.category:gsub("%s+", "") .. "Menu", 0, "Disable", "$0")
            populateMenu(v.category:gsub("%s+", "") .. "Menu", 1, "Enable", "$" .. vehicleCustomisationPrices.customwheels.price)
            updateItem2Text(v.category:gsub("%s+", "") .. "Menu", currentCustomWheelState, "Installed")
            finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
        elseif v.id ~= 20 then
            if isMotorcycle then
                if v.id == 6 then 
                    local validMods, _ = CheckValidMods(v.category, v.wheelID, v.id)
                    createMenu(v.category .. "Menu", v.category .. " Wheels", "Choose a Wheel")
                    for _, n in pairs(validMods) do
                        populateMenu(v.category .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.wheels.price)
                    end
                    finishPopulatingMenu(v.category .. "Menu")
                end
            else
                local validMods, _ = CheckValidMods(v.category, v.wheelID, v.id)
                createMenu(v.category .. "Menu", v.category .. " Wheels", "Choose a Wheel")
                for _, n in pairs(validMods) do
                    populateMenu(v.category .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.wheels.price)
                end
                finishPopulatingMenu(v.category .. "Menu")
            end
        end
    end
    local currentWheelSmokeR, currentWheelSmokeG, currentWheelSmokeB = GetCurrentVehicleWheelSmokeColour()
    createMenu("TyreSmokeMenu", "Tyre Smoke Customisation", "Choose a Colour")
    for k, v in ipairs(vehicleTyreSmokeOptions) do
        populateMenu("TyreSmokeMenu", k, v.name, "$" .. vehicleCustomisationPrices.wheelsmoke.price)
        if v.r == currentWheelSmokeR and v.g == currentWheelSmokeG and v.b == currentWheelSmokeB then
            updateItem2Text("TyreSmokeMenu", k, "Installed")
        end
    end
    finishPopulatingMenu("TyreSmokeMenu")
    local currentWindowTint = GetCurrentWindowTint()
    createMenu("WindowTintMenu", "Window Tint Customisation", "Choose a Tint")
    for _, v in ipairs(vehicleWindowTintOptions) do
        populateMenu("WindowTintMenu", v.id, v.name, "$" .. vehicleCustomisationPrices.windowtint.price)
        if currentWindowTint == v.id then
            updateItem2Text("WindowTintMenu", v.id, "Installed")
        end
    end
    finishPopulatingMenu("WindowTintMenu")
    if livCount > 0 then
        local tempOldLivery = GetVehicleLivery(plyVeh)
        createMenu("OldLiveryMenu", "Old Livery Customisation", "Choose a Livery")
        for i=0, livCount-1 do
            populateMenu("OldLiveryMenu", i, "Livery", "$100")
            if tempOldLivery == i then
                updateItem2Text("OldLiveryMenu", i, "Installed")
            end
        end
        finishPopulatingMenu("OldLiveryMenu")
    end
    local tempPlateIndex = GetVehicleNumberPlateTextIndex(plyVeh)
    createMenu("PlateIndexMenu", "Plate Colour", "Choose a Style")
    local plateTypes = {
        "Blue on White #1",
        "Yellow on Black",
        "Yellow on Blue",
        "Blue on White #2",
        "Blue on White #3",
        "North Yankton",
    }
    for i=0, #plateTypes-1 do
        if i ~= 4 or (i == 4 and GetVehicleClass(plyVeh) == 18) or Config.allowGovPlateIndex then
            populateMenu("PlateIndexMenu", i, plateTypes[i+1], "$"..vehicleCustomisationPrices.plateindex.price)
            if tempPlateIndex == i then
                updateItem2Text("PlateIndexMenu", i, "Installed")
            end
        end
    end
    finishPopulatingMenu("PlateIndexMenu")
    createMenu("VehicleExtrasMenu", "Vehicle Extras Customisation", "Toggle Extras")
    for i=1, 12 do
        if DoesExtraExist(plyVeh, i) then
            populateMenu("VehicleExtrasMenu", i, "Extra "..tostring(i), "Toggle")
        else
            populateMenu("VehicleExtrasMenu", i, "No Option", "NONE")
        end
    end
    finishPopulatingMenu("VehicleExtrasMenu")
    createMenu("NeonsMenu", "Neon Customisation", "Choose a Category")
    for _, v in ipairs(vehicleNeonOptions.neonTypes) do
        populateMenu("NeonsMenu", v.id, v.name, "none")
    end
    populateMenu("NeonsMenu", -1, "Neon Colours", "none")
    finishPopulatingMenu("NeonsMenu")
    for _, v in ipairs(vehicleNeonOptions.neonTypes) do
        local currentNeonState = GetCurrentNeonState(v.id)
        createMenu(v.name:gsub("%s+", "") .. "Menu", "Neon Customisation", "Enable or Disable Neon")
        populateMenu(v.name:gsub("%s+", "") .. "Menu", 0, "Disabled", "$0")
        populateMenu(v.name:gsub("%s+", "") .. "Menu", 1, "Enabled", "$" .. vehicleCustomisationPrices.neonside.price)
        updateItem2Text(v.name:gsub("%s+", "") .. "Menu", currentNeonState, "Installed")
        finishPopulatingMenu(v.name:gsub("%s+", "") .. "Menu")
    end
    local currentNeonR, currentNeonG, currentNeonB = GetCurrentNeonColour()
    createMenu("NeonColoursMenu", "Neon Colours", "Choose a Colour")
    for k, _ in ipairs(vehicleNeonOptions.neonColours) do
        populateMenu("NeonColoursMenu", k, vehicleNeonOptions.neonColours[k].name, "$" .. vehicleCustomisationPrices.neoncolours.price)
        if currentNeonR == vehicleNeonOptions.neonColours[k].r and currentNeonG == vehicleNeonOptions.neonColours[k].g and currentNeonB == vehicleNeonOptions.neonColours[k].b then
            updateItem2Text("NeonColoursMenu", k, "Installed")
        end
    end
    finishPopulatingMenu("NeonColoursMenu")
    createMenu("XenonsMenu", "Xenon Customisation", "Choose a Category")
    populateMenu("XenonsMenu", 0, "Headlights", "none")
    populateMenu("XenonsMenu", 1, "Xenon Colours", "none")
    finishPopulatingMenu("XenonsMenu")
    local currentXenonState = GetCurrentXenonState()
    createMenu("HeadlightsMenu", "Headlights Customisation", "Enable or Disable Xenons")
    populateMenu("HeadlightsMenu", 0, "Disable Xenons", "$0")
    populateMenu("HeadlightsMenu", 1, "Enable Xenons", "$" .. vehicleCustomisationPrices.headlights.price)
    updateItem2Text("HeadlightsMenu", currentXenonState, "Installed")
    finishPopulatingMenu("HeadlightsMenu")
    local currentXenonColour = GetCurrentXenonColour()
    createMenu("XenonColoursMenu", "Xenon Colours", "Choose a Colour")
    for _, v in ipairs(vehicleXenonOptions.xenonColours) do
        populateMenu("XenonColoursMenu", v.id, v.name, "$" .. vehicleCustomisationPrices.xenoncolours.price)
        if currentXenonColour == v.id then
            updateItem2Text("XenonColoursMenu", v.id, "Installed")
        end
    end
    finishPopulatingMenu("XenonColoursMenu")
end

function DestroyMenus()
    destroyMenus()
end

function DisplayMenuContainer(state)
    toggleMenuContainer(state)
end

function DisplayMenu(state, menu)
    if state then
        currentMenu = menu
    end
    toggleMenu(state, menu)
    updateMenuHeading(menu)
    updateMenuSubheading(menu)
end

function MenuManager(state, repairOnly)
    if state then
        if currentMenuItem2 ~= "Installed" then
            if isMenuActive("modMenu") then
                if currentCategory == 18 then
                    if AttemptPurchase("turbo", currentMenuItemID) then
                        ApplyMod(currentCategory, currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Installed")
                        updateMenuStatus("Purchased")
                    else
                        updateMenuStatus("Not Enough Money!")
                    end
                elseif currentCategory == 11 or currentCategory == 12 or currentCategory== 13 or currentCategory == 15 or currentCategory == 16 then 
                    if AttemptPurchase("performance", currentMenuItemID) then
                        ApplyMod(currentCategory, currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Installed")
                        updateMenuStatus("Purchased")
                    else
                        updateMenuStatus("Not Enough Money")
                    end
                else
                    if AttemptPurchase("cosmetics") then
                        ApplyMod(currentCategory, currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Installed")
                        updateMenuStatus("Purchased")
                    else
                        updateMenuStatus("Not Enough Money")
                    end
                end
            elseif isMenuActive("ResprayMenu") then
                if AttemptPurchase("respray") then
                    ApplyColour(currentResprayCategory, currentResprayType, currentMenuItemID)
                    playSoundEffect("respray", 1.0)
                    updateItem2Text(currentMenu, currentMenuItemID, "Installed")
                    updateMenuStatus("Purchased")
                else
                    updateMenuStatus("Not Enough Money")
                end
            elseif isMenuActive("WheelsMenu") then
                if currentWheelCategory == 20 then
                    if AttemptPurchase("wheelsmoke") then
                        local r = vehicleTyreSmokeOptions[currentMenuItemID].r
                        local g = vehicleTyreSmokeOptions[currentMenuItemID].g
                        local b = vehicleTyreSmokeOptions[currentMenuItemID].b

                        ApplyTyreSmoke(r, g, b)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Installed")
                        updateMenuStatus("Purchased")
                    else
                        updateMenuStatus("Not Enough Money")
                    end
                else
                    if currentWheelCategory == -1 then
                        local currentWheel = GetCurrentWheel()
                        if currentWheel == -1 then
                            updateMenuStatus("Can't Apply Custom Tyres to Stock Wheels")
                        else
                            if AttemptPurchase("customwheels") then
                                ApplyCustomWheel(currentMenuItemID)
                                playSoundEffect("wrench", 0.4)
                                updateItem2Text(currentMenu, currentMenuItemID, "Installed")
                                updateMenuStatus("Purchased")
                            else
                                updateMenuStatus("Not Enough Money")
                            end
                        end
                    else
                        local currentWheel = GetCurrentWheel()
                        local currentCustomWheelState = GetOriginalCustomWheel()
                        if currentCustomWheelState and currentWheel == -1 then
                            updateMenuStatus("Can't Apply Stock Wheels With Custom Tyres")
                        else
                            if AttemptPurchase("wheels") then
                                ApplyWheel(currentCategory, currentMenuItemID, currentWheelCategory)
                                playSoundEffect("wrench", 0.4)
                                updateItem2Text(currentMenu, currentMenuItemID, "Installed")
                                updateMenuStatus("Purchased")
                            else
                                updateMenuStatus("Not Enough Money")
                            end
                        end
                    end
                end
            elseif isMenuActive("NeonsSideMenu") then
                if AttemptPurchase("neonside") then
                    ApplyNeon(currentNeonSide, currentMenuItemID)
                    playSoundEffect("wrench", 0.4)
                    updateItem2Text(currentMenu, currentMenuItemID, "Installed")
                    updateMenuStatus("Purchased")
                else
                    updateMenuStatus("Not Enough Money")
                end
            else
                if currentMenu == "repairMenu" then
                    if AttemptPurchase("repair") then
                        currentMenu = "mainMenu"
                        RepairVehicle()
                        if not repairOnly then
                            toggleMenu(false, "repairMenu")
                            toggleMenu(true, currentMenu)
                        else
                            ExitBennys()
                            QBCore.Functions.Notify('Araç tamir edildi.', 'success')
                        end
                        updateMenuHeading(currentMenu)
                        updateMenuSubheading(currentMenu)
                        playSoundEffect("wrench", 0.4)
                        updateMenuStatus("")
                    else
                        updateMenuStatus("Not Enough Money")
                    end
                elseif currentMenu == "mainMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentCategory = currentMenuItemID
                    toggleMenu(false, "mainMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "ResprayMenu" then
                    currentMenu = "ResprayTypeMenu"
                    currentResprayCategory = currentMenuItemID
                    toggleMenu(false, "ResprayMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "ResprayTypeMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentResprayType = currentMenuItemID
                    toggleMenu(false, "ResprayTypeMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "WheelsMenu" then
                    local currentWheel, _, currentWheelType = GetCurrentWheel()
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentWheelCategory = currentMenuItemID
                    if currentWheelType == currentWheelCategory then
                        updateItem2Text(currentMenu, currentWheel, "Installed")
                    end
                    toggleMenu(false, "WheelsMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "NeonsMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentNeonSide = currentMenuItemID
                    toggleMenu(false, "NeonsMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "XenonsMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    toggleMenu(false, "XenonsMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "WindowTintMenu" then
                    if AttemptPurchase("windowtint") then
                        ApplyWindowTint(currentMenuItemID)
                        playSoundEffect("respray", 1.0)
                        updateItem2Text(currentMenu, currentMenuItemID, "Installed")
                        updateMenuStatus("Purchased")
                    else
                        updateMenuStatus("Not Enough Money")
                    end
                elseif currentMenu == "NeonColoursMenu" then
                    if AttemptPurchase("neoncolours") then
                        local r = vehicleNeonOptions.neonColours[currentMenuItemID].r
                        local g = vehicleNeonOptions.neonColours[currentMenuItemID].g
                        local b = vehicleNeonOptions.neonColours[currentMenuItemID].b
                        ApplyNeonColour(r, g, b)
                        playSoundEffect("respray", 1.0)
                        updateItem2Text(currentMenu, currentMenuItemID, "Installed")
                        updateMenuStatus("Purchased")
                    else
                        updateMenuStatus("Not Enough Money")
                    end
                elseif currentMenu == "HeadlightsMenu" then
                    if AttemptPurchase("headlights") then
                        ApplyXenonLights(currentCategory, currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Installed")
                        updateMenuStatus("Purchased")
                    else
                        updateMenuStatus("Not Enough Money")
                    end
                elseif currentMenu == "XenonColoursMenu" then
                    if AttemptPurchase("xenoncolours") then
                        ApplyXenonColour(currentMenuItemID)
                        playSoundEffect("respray", 1.0)
                        updateItem2Text(currentMenu, currentMenuItemID, "Installed")
                        updateMenuStatus("Purchased")
                    else
                        updateMenuStatus("Not Enough Money")
                    end
                elseif currentMenu == "OldLiveryMenu" then
                    if AttemptPurchase("oldlivery") then
                        ApplyOldLivery(currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Installed")
                        updateMenuStatus("Purchased")
                    else
                        updateMenuStatus("Not Enough Money")
                    end
                elseif currentMenu == "PlateIndexMenu" then
                    if AttemptPurchase("plateindex") then
                        ApplyPlateIndex(currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Installed")
                        updateMenuStatus("Purchased")
                    else
                        updateMenuStatus("Not Enough Money")
                    end
                elseif currentMenu == "VehicleExtrasMenu" then
                    ApplyExtra(currentMenuItemID)
                    playSoundEffect("wrench", 0.4)
                    updateItem2TextOnly(currentMenu, currentMenuItemID, "Toggle")
                    updateMenuStatus("Purchased")
                end
            end
        else
            if currentMenu == "VehicleExtrasMenu" then
                ApplyExtra(currentMenuItemID)
                playSoundEffect("wrench", 0.4)
                updateItem2TextOnly(currentMenu, currentMenuItemID, "Toggle")
                updateMenuStatus("Purchased")
            end
        end
    else
        updateMenuStatus("")
        if isMenuActive("modMenu") then
            toggleMenu(false, currentMenu)
            currentMenu = "mainMenu"
            if currentCategory ~= 18 then
                RestoreOriginalMod()
            end
            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        elseif isMenuActive("ResprayMenu") then
            toggleMenu(false, currentMenu)
            currentMenu = "ResprayTypeMenu"
            RestoreOriginalColours()
            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        elseif isMenuActive("WheelsMenu") then
            if currentWheelCategory ~= 20 and currentWheelCategory ~= -1 then
                local currentWheel = GetOriginalWheel()
                updateItem2Text(currentMenu, currentWheel, "$" .. vehicleCustomisationPrices.wheels.price)
                RestoreOriginalWheels()
            end
            toggleMenu(false, currentMenu)
            currentMenu = "WheelsMenu"
            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        elseif isMenuActive("NeonsSideMenu") then
            toggleMenu(false, currentMenu)
            currentMenu = "NeonsMenu"
            RestoreOriginalNeonStates()
            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        else
            if currentMenu == "mainMenu" or currentMenu == "repairMenu" then
                ExitBennys()
            elseif currentMenu == "ResprayMenu" or currentMenu == "WindowTintMenu" or currentMenu == "WheelsMenu" or currentMenu == "NeonsMenu" or currentMenu == "XenonsMenu" or currentMenu == "OldLiveryMenu" or currentMenu == "PlateIndexMenu" or currentMenu == "VehicleExtrasMenu" then
                toggleMenu(false, currentMenu)
                if currentMenu == "WindowTintMenu" then
                    RestoreOriginalWindowTint()
                end
                if currentMenu == "OldLiveryMenu" then
                    RestoreOldLivery()
                end
                if currentMenu == "PlateIndexMenu" then
                    RestorePlateIndex()
                end
                currentMenu = "mainMenu"
                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "ResprayTypeMenu" then
                toggleMenu(false, currentMenu)
                currentMenu = "ResprayMenu"
                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "NeonColoursMenu" then
                toggleMenu(false, currentMenu)
                currentMenu = "NeonsMenu"
                RestoreOriginalNeonColours()
                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "HeadlightsMenu" then
                toggleMenu(false, currentMenu)
                currentMenu = "XenonsMenu"
                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "XenonColoursMenu" then
                toggleMenu(false, currentMenu)
                currentMenu = "XenonsMenu"
                RestoreOriginalXenonColour()
                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            end
        end
    end
end

function MenuScrollFunctionality(direction)
    scrollMenuFunctionality(direction, currentMenu)
end

RegisterNUICallback("selectedItem", function(data, cb)
    updateCurrentMenuItemID(tonumber(data.id), data.item, data.item2)
    cb("ok")
end)

RegisterNUICallback("updateItem2", function(data, cb)
    currentMenuItem2 = data.item
    cb("ok")
end)