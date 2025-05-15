local QBCore = exports['qb-core']:GetCoreObject()
local ped

RegisterNetEvent('qb-smallresources:client:grandmaMenu', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.metadata['inlaststand'] or PlayerData.metadata['isdead'] then
        local menu = {
            {
                header = 'İllegal Doktor',
                txt = 'Tedavi ol!',
                icon = 'fas fa-user-doctor',
                params = {
                    event = 'qb-smallresources:client:grandmaRevive',
                }
            }
        }
        exports['qb-menu']:openMenu(menu)
    else
        exports['ZSX_UIV2']:Notification("Hata", "Gayet sağlıklı görünüyorsun kaybol burdan!", "fas fa-times-circle", 5000)
    end
end)

RegisterNetEvent('qb-smallresources:client:grandmaRevive', function()
    QBCore.Functions.Progressbar('hospital_checkin', 'Tedavi oluyorsun', 40000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() 
        TriggerEvent('hospital:client:Revive')
    end, function() 
        exports['ZSX_UIV2']:Notification("Hata", "İşlem iptal edildi!", "fas fa-times-circle", 5000)
    end)
end)


local DoctorLocation = vector4(2368.45, 3155.85, 48.62, 48.03)

CreateThread(function()
    local pedModel = `a_f_o_ktown_01`
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do Wait(100) end
    ped = CreatePed(0, pedModel, DoctorLocation.x, DoctorLocation.y, DoctorLocation.z, DoctorLocation.w, false, false)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
    exports['qb-target']:AddTargetEntity(ped, {
        options = {
            {
                type = 'client',
                event = 'qb-smallresources:client:grandmaMenu',
                icon = 'fas fa-user-doctor',
                label = 'İllegal Doktor',
            }
        },
        distance = 2.5,
    })
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        DisableControlAction(1, 140, true)
        if not IsPlayerTargettingAnything(PlayerId()) then
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)