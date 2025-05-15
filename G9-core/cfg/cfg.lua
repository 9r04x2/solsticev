G9_CORE = {
    framework = nil, -- don't edit
    core = nil, -- don't edit
    lang = 'tr', -- for nui languages (en,ar,de etc.)
    inventoryImages = 'nui://qb-inventory/html/images/' -- for nui images   
}

function vehicleKey()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local plate = GetVehicleNumberPlateText(vehicle)
    Wait(1000)
    TriggerEvent('vehiclekeys:client:SetOwner', plate)
end

function management(job,amount) -- for bossmenu [You need edit here for bank script.]
    if G9_CORE.framework then
        -- for QBCore Example:
        -- exports["savana-bossmenu"]:paidBills(job, math.floor(amount))
    else
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' ..job, function(account)
            if job and amount then
                account.addMoney(amount)
            end
        end)
    end
end

if GetResourceState('qb-core') == 'started' then
    G9_CORE.framework = true
    G9_CORE.core = exports['qb-core']:GetCoreObject()
    f = 'QBCore'
elseif GetResourceState('qbx_core') == 'started' then
    G9_CORE.framework = true
    G9_CORE.core = exports['qb-core']:GetCoreObject()
    f = 'QBOX'
elseif GetResourceState('es_extended') == 'started' then
    G9_CORE.framework = false
    G9_CORE.core = exports['es_extended']:getSharedObject()
    f = 'ESX'
end

