local Framework, frameworkName = getFramework()

function notify(message)
    if frameworkName == "esx" then
        Framework.ShowNotification(getMessage(message))
    else
        Framework.Functions.Notify(getMessage(message))
    end
end

function getMessage(message)
    return Savana.Locales[Savana.Language][message] or "Message Not Found: "..message
end


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('savana-community:check')
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    TriggerServerEvent('savana-community:check')
end)

local zones = {}

function createTaskBox(id, coord)
    local zone = lib.zones.sphere({
        coords = coord,
        radius = 2,
        debug = Savana.Debug,
        onEnter = function()                        
            lib.showTextUI(getMessage('clear'))
        end,
        onExit = function()
            lib.hideTextUI()
        end,
        inside = function()
            if IsControlJustPressed(0, 38) then
                lib.hideTextUI()
                progress(id)
            end
        end,
    })

    zones[id] = zone
end

function removeZone(id)
    zones[id]:remove()
end

function resetZones()
    for k,v in pairs(zones) do
        zones[k]:remove()
    end

    zones = {}
    lib.hideTextUI()
end
