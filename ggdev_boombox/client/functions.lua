loadModel = function(model)
    while not HasModelLoaded(model) do Wait(0) RequestModel(model) end
    return model
end

loadDict = function(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
    return dict
end

hasBoomBox = function(radio)
    local equipRadio = true
    CreateThread(function()
        if Config.InstructionNotification then
            exports['ZSX_UIV2']:Notification("Talimatlar", "Boombox'ı bırakmak için E'ye basın", "fas fa-info-circle", 5000)
        end
        while equipRadio do
            Wait(0)
            if IsControlJustReleased(0, 38) then
                equipRadio = false
                DetachEntity(radio)
                PlaceObjectOnGroundProperly(radio)
                FreezeEntityPosition(radio, true)
                boomboxPlaced(radio)
            end
        end
    end)
end


if Framework == "ESX" then
    boomboxPlaced = function(obj)
        local coords = GetEntityCoords(obj)
        local heading = GetEntityHeading(obj)
        local targetPlaced = false
        CreateThread(function()
            while true do
                if DoesEntityExist(obj) and not targetPlaced then
                    exports.qtarget:AddBoxZone("boomboxzone", coords, 1, 1, {
                        name="boomboxzone",
                        heading=heading,
                        debugPoly=false,
                        minZ=coords.z-0.9,
                        maxZ=coords.z+0.9
                    }, {
                        options = {
                            {
                                event = 'ggdev_boombox:interact',
                                icon = 'fas fa-hand-paper',
                                label = 'Kullan',
                            },
                            {
                                event = 'ggdev_boombox:pickup',
                                icon = 'fas fa-volume-up',
                                label = 'Boombox u al'
                            }

                        },
                        job = 'all',
                        distance = 1.5
                    })
                    targetPlaced = true
                elseif not DoesEntityExist(obj) then
                    exports.qtarget:RemoveZone('boomboxzone')
                    targetPlaced = false
                    break
                end
                Wait(1000)
            end
        end)
    end
elseif Framework == "qb" then
    boomboxPlaced = function(obj)
        local coords = GetEntityCoords(obj)
        local heading = GetEntityHeading(obj)
        local targetPlaced = false
        CreateThread(function()
            while true do
                if DoesEntityExist(obj) and not targetPlaced then
                    exports['qb-target']:AddBoxZone("boomboxzone", coords, 1, 1, {
                        name="boomboxzone",
                        heading=heading,
                        debugPoly=false,
                        minZ=coords.z-0.9,
                        maxZ=coords.z+0.9
                    }, {
                        options = {
                            {
                                event = 'ggdev_boombox:interact',
                                icon = 'fas fa-hand-paper',
                                label = 'Kullan',
                            },
                            {
                                event = 'ggdev_boombox:pickup',
                                icon = 'fas fa-volume-up',
                                label = 'Boombox u al'
                            }

                        },
                        job = 'all',
                        distance = 1.5
                    })
                    targetPlaced = true
                elseif not DoesEntityExist(obj) then
                    exports['qb-target']:RemoveZone('boomboxzone')
                    targetPlaced = false
                    break
                end
                Wait(1000)
            end
        end)
    end
end

interactBoombox = function(radio, radioCoords)
    if not activeRadios[radio] then
        activeRadios[radio] = {
            pos = radioCoords,
            data = {
                playing = false
            }
        }
    else
        activeRadios[radio].pos = radioCoords
    end
    TriggerServerEvent('ggdev_boombox:syncActive', activeRadios)
    if not activeRadios[radio].data.playing then
        lib.registerContext({
            id = 'boomboxFirst',
            title = 'Boombox',
            options = {
                {
                    title = 'Müzik Çal',
                    description = 'Hoparlörden Müzik Çalın',
                    arrow = true,
                    event = 'ggdev_boombox:playMenu',
                    args = {type = 'play', id = radio}
                },
                {
                    title = 'Kayıtlı Şarkılar',
                    description = 'daha önce kaydettiğiniz şeyler',
                    arrow = true,
                    event = 'ggdev_boombox:savedSongs',
                    args = {id = radio}
                }
            }
        })
        lib.showContext('boomboxFirst')
    else
        lib.registerContext({
            id = 'boomboxSecond',
            title = 'Boombox',
            options = {
                {
                    title = 'Müziği Değiştir',
                    description = 'Hoparlördeki müziği değiştir',
                    arrow = true,
                    event = 'ggdev_boombox:playMenu',
                    args = {type = 'play', id = radio}
                },
                {
                    title = 'Kayıtlı Şarkılar',
                    description = 'daha önce kaydettiğiniz şarkılar',
                    arrow = true,
                    event = 'ggdev_boombox:savedSongs',
                    args = {id = radio}
                },
                {
                    title = 'Müziği Durdur',
                    description = 'Hoparlördeki müziği durdur',
                    arrow = false,
                    event = 'ggdev_boombox:playMenu',
                    args = {type = 'stop', id = radio}
                },
                {
                    title = 'Sesi Ayarla',
                    description = 'hoparlördeki ses seviyesini değiştirme',
                    arrow = false,
                    event = 'ggdev_boombox:playMenu',
                    args = {type = 'volume', id = radio}
                },
                {
                    title = 'Mesafeyi Değiştir',
                    description = 'Hoparlördeki mesafeyi değiştirin',
                    arrow = false,
                    event = 'ggdev_boombox:playMenu',
                    args = {type = 'distance', id = radio}
                }
            }
        })
        lib.showContext('boomboxSecond')
    end
end

selectSavedSong = function(data)
    lib.registerContext({
        id = 'selectSavedSong',
        title = 'Manage Song',
        options = {
            {
                title = 'Şarkıyı Çal',
                description = 'Bu şarkıyı çal',
                arrow = false,
                event = 'ggdev_boombox:playSavedSong',
                args = data
            },
            {
                title = 'Şarkıyı Sil',
                description = 'Bu şarkıyı sil',
                arrow = true,
                event = 'ggdev_boombox:deleteSong',
                args = data
            }
        }
    })
    lib.showContext('selectSavedSong')
end

if Framework == "ESX" then
    savedSongsMenu = function(radio)
        ESX.TriggerServerCallback('ggdev_boombox:getSavedSongs', function(cb)
            local radio = radio.id
            local Options = {
                {
                    title = 'Save A Song',
                    description = 'Save a song to play later',
                    arrow = true,
                    event = 'ggdev_boombox:saveSong',
                    args = {id = radio}
                }
            }
            if cb then
                for i=1, #cb do
                    print(radio)
                    table.insert(Options, {
                        title = cb[i].label,
                        description = '',
                        arrow = true,
                        event = 'ggdev_boombox:selectSavedSong',
                        args = {id = radio, link = cb[i].link, label = cb[i].label}
                    })
                end
            end
            lib.registerContext({
                id = 'boomboxSaved',
                title = 'Boombox',
                options = Options
            })
            lib.showContext('boomboxSaved')
        end)
    end
elseif Framework == "qb" then
    savedSongsMenu = function(radio)
        QBCore.Functions.TriggerCallback('ggdev_boombox:getSavedSongs', function(cb)
            local radio = radio.id
            local Options = {
                {
                    title = 'Save A Song',
                    description = 'Save a song to play later',
                    arrow = true,
                    event = 'ggdev_boombox:saveSong',
                    args = {id = radio}
                }
            }
            if cb then
                for i=1, #cb do
                    print(radio)
                    table.insert(Options, {
                        title = cb[i].label,
                        description = '',
                        arrow = true,
                        event = 'ggdev_boombox:selectSavedSong',
                        args = {id = radio, link = cb[i].link, label = cb[i].label}
                    })
                end
            end
            lib.registerContext({
                id = 'boomboxSaved',
                title = 'Boombox',
                options = Options
            })
            lib.showContext('boomboxSaved')
        end)
    end
end
