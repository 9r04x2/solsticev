local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }

CreateThread(function ()
    for k,v in pairs(Config.Shops) do
        for kk,vv in pairs(v.coords) do
            if v.ped then
                RequestModel(v.ped)
                while not HasModelLoaded(v.ped) do
                    Wait(0)
                end
                local ped = CreatePed(4, v.ped, vv.x, vv.y, vv.z -1, vv.w, false, false)
                SetEntityHeading(ped, vv.w)
                FreezeEntityPosition(ped, true)
                SetEntityInvincible(ped, true)
                SetBlockingOfNonTemporaryEvents(ped, true)
                SetPedDiesWhenInjured(ped, false)
                SetPedCanRagdoll(ped, false)
            end
            if Config.Interact == "qb-target" then
                exports['qb-target']:AddCircleZone("market" .. k .. kk, vv, 1.0, {
                    name = "market" .. k .. kk,
                    debugPoly= false,
                    useZ=true,
                    }, {
                        options = {
                            {
                                label = Config.Strings["Interact_Text"],
                                icon = 'fas fa-basket-shopping',
                                action = function()
                                    TriggerEvent('savana-shopsv2-open', k)
                                end
                            }
                        },
                    distance = 1.7
                })
            elseif Config.Interact == "ox_target" then
                exports.ox_target:addBoxZone({
                    coords = vv,
                    size = vec3(1, 1, 1),
                    rotation = 45,
                    drawSprite = true,
                    options = {
                        {
                            name = "market" .. k .. kk,
                            icon = "fa-solid fa-basket-shopping",
                            label = Config.Strings["Interact_Text"],
                            onSelect = function ()
                                TriggerEvent('savana-shopsv2-open', k)
                            end
                        }
                    }
                })
            elseif Config.Interact == "drawtext" then

            end
        end
    end
end)

function DrawText3Ds(x,y,z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local sleep = 500
CreateThread(function()
    if Config.Interact == "drawtext" then else return end
    while true do
        Wait(sleep)
        local foundshop = false
        for k,v in pairs(Config.Shops) do
            for kk,vv in pairs(v.coords) do
                if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), vv, true) < 15 then
                    foundshop = true
                end
            end
        end
        if foundshop then
            sleep = 1
            for k,v in pairs(Config.Shops) do
                for kk,vv in pairs(v.coords) do
                    sleep = 1
                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), vv, true) < 2 then
                        DrawText3Ds(vv.x, vv.y, vv.z, "[" .. Config.InteractKey .. "] " .. Config.Strings["Interact_Text"])
                        if IsControlJustReleased(0, Keys[Config.InteractKey]) then
                            TriggerEvent('savana-shopsv2-open', k)
                        end
                    end
                end
            end
        else
            sleep = 500
        end
    end
end)