peds = {}

exports('pedcreate', function(name, hash, x, y, z, h, dict, anim)
    if peds[name] then
        if peds[name].spawn then
            DeletePed(peds[name].ped)
            peds[name].spawn = false
            peds[name].ped = 0
        end
    end

    if dict then
        peds[name] = {hash = hash, x = x, y = y, z = z, h = h, spawn = false, ped = 0, dict = dict, anim = anim}
    else
        peds[name] = {hash = hash, x = x, y = y, z = z, h = h, spawn = false, ped = 0}
    end
end)

exports('isCreatedPed', function(ped)
    for x, pedData in pairs(peds) do
        if pedData.ped == ped then
            return true
        end
    end
    return false
end)
    

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        for x, pedData in pairs(peds) do
            local distance = #(coords - vector3(pedData.x, pedData.y, pedData.z))
            if distance < 300 then
                if not pedData.spawn then
                    Citizen.CreateThread(function()
                        local hash = pedData.hash
                        if not IsModelValid(hash) then 
                            print("[PED] ".. hash .. "("..x..") Bulunamadı! Yöneticilere Bildiriniz!")
                        else
                            while not HasModelLoaded(hash) do
                                RequestModel(hash)
                                Citizen.Wait(1) 
                            end
                            local ped = CreatePed(4, hash, pedData.x, pedData.y, pedData.z, pedData.h, false, true)
                            FreezeEntityPosition(ped, true)
                            SetEntityInvincible(ped, true)
                            SetBlockingOfNonTemporaryEvents(ped, true)
                            SetModelAsNoLongerNeeded(hash)
                            
                            if peds[x].dict then
                                RequestAnimDict(peds[x].dict)
                                while not HasAnimDictLoaded(peds[x].dict) do
                                    Wait(1000)
                                end

                                TaskPlayAnim(ped,peds[x].dict,peds[x].anim, 1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
                            end

                            peds[x].ped = ped
                            peds[x].spawn = true
                        end
                    end)
                end
            else
                if pedData.spawn then
                    DeletePed(pedData.ped)
                    peds[x].spawn = false
                    peds[x].ped = 0
                end
            end
        end
    end
end)