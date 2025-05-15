Config = {}

Config.debugMode = false
Config.AdminPerm = 'god'

Config.Locale = 'tr'

Config.UI = {
    colors = {
        primary = '#ff69b4',
        primaryLight = '#ff8dc7',
        primaryDark = '#ff1493',
        background = '#1e2021f8',
        surface = '#2a2a2a',
        success = '#ff69b4',
        error = '#ff1493',
        text = '#ffffff'
    },
    sizes = {
        width = '61.13vw',
        height = '37.36vw',
        borderRadius = '1.6vw'
    }
}

Config.Command = 'depo'

Config.Locales = {
    ['tr'] = {
        ['ui'] = {
            ['title'] = 'Depo Yönetim Sistemi',
            ['create_storage'] = 'Yeni Depo Oluştur',
            ['all_storages'] = 'Tüm Depolar',
            ['job_storages'] = 'Meslek Depoları',
            ['gang_storages'] = 'Çete Depoları',
            ['personal_storages'] = 'Kişisel Depolar',
            ['search_placeholder'] = 'Depo Ara...',
            ['storage_details'] = 'Depo Detayları',
            ['storage_name'] = 'Depo İsmi',
            ['storage_type'] = 'Depo Tipi',
            ['job'] = 'Meslek',
            ['gang'] = 'Çete',
            ['capacity'] = 'Kapasite',
            ['coords'] = 'Koordinatlar',
            ['teleport'] = 'Depoya Git',
            ['delete'] = 'Depoyu Sil',
            ['no_storage'] = 'Henüz depo bulunmuyor',
            ['personal_storage'] = 'Kişisel Depo',
            ['job_storage'] = 'Meslek Deposu',
            ['gang_storage'] = 'Çete Deposu',
            ['general_storage'] = 'Genel Depo',
            ['none'] = 'Yok',
            ['mark_storage'] = 'Depoyu İşaretle',
            ['storage_access'] = 'Depo',
            ['storage_unauthorized'] = 'Depo (Yetkisiz)',
            ['categories'] = 'Kategoriler',
            ['storage_name_placeholder'] = 'Depo ismini giriniz',
            ['job_placeholder'] = 'Meslek kodunu giriniz',
            ['gang_placeholder'] = 'Çete kodunu giriniz',
            ['cancel'] = 'İptal',
            ['create'] = 'Oluştur'
        },
        ['notifications'] = {
            ['storage_created'] = 'Depo başarıyla oluşturuldu!',
            ['storage_deleted'] = 'Depo başarıyla silindi!',
            ['storage_exists'] = 'Bu isimde bir depo zaten mevcut!',
            ['no_access'] = 'Bu depoyu kullanma yetkiniz yok!',
            ['teleported'] = 'Depoya ışınlandınız!',
            ['marked'] = 'Depo haritada işaretlendi!',
            ['name_required'] = 'Depo ismi boş bırakılamaz!',
            ['job_required'] = 'Meslek kodu girilmeli!',
            ['gang_required'] = 'Çete kodu girilmeli!',
            ['invalid_capacity'] = 'Kapasite 100-5000 kg arasında olmalıdır!'
        },
        ['logs'] = {
            ['storage_created'] = 'Depo Oluşturuldu',
            ['storage_deleted'] = 'Depo Silindi',
            ['storage_info'] = '**Depo Bilgileri**\nİsim: %s\nTip: %s\nMeslek: %s\nÇete: %s\nKapasite: %s'
        }
    },
    ['en'] = {
        ['ui'] = {
            ['title'] = 'Storage Management System',
            ['create_storage'] = 'Create New Storage',
            ['all_storages'] = 'All Storages',
            ['job_storages'] = 'Job Storages',
            ['gang_storages'] = 'Gang Storages', 
            ['personal_storages'] = 'Personal Storages',
            ['search_placeholder'] = 'Search Storage...',
            ['storage_details'] = 'Storage Details',
            ['storage_name'] = 'Storage Name',
            ['storage_type'] = 'Storage Type',
            ['job'] = 'Job',
            ['gang'] = 'Gang',
            ['capacity'] = 'Capacity',
            ['coords'] = 'Coordinates',
            ['teleport'] = 'Go to Storage',
            ['delete'] = 'Delete Storage',
            ['no_storage'] = 'No storage found yet',
            ['personal_storage'] = 'Personal Storage',
            ['job_storage'] = 'Job Storage',
            ['gang_storage'] = 'Gang Storage',
            ['general_storage'] = 'General Storage',
            ['none'] = 'None',
            ['mark_storage'] = 'Mark Storage',
            ['storage_access'] = 'Storage',
            ['storage_unauthorized'] = 'Storage (Unauthorized)',
            ['categories'] = 'Categories',
            ['storage_name_placeholder'] = 'Enter storage name',
            ['job_placeholder'] = 'Enter job code',
            ['gang_placeholder'] = 'Enter gang code',
            ['cancel'] = 'Cancel',
            ['create'] = 'Create'
        },
        ['notifications'] = {
            ['storage_created'] = 'Storage created successfully!',
            ['storage_deleted'] = 'Storage deleted successfully!',
            ['storage_exists'] = 'A storage with this name already exists!',
            ['no_access'] = 'You do not have permission to use this storage!',
            ['teleported'] = 'Teleported to storage!',
            ['marked'] = 'Storage marked on map!',
            ['name_required'] = 'Storage name cannot be empty!',
            ['job_required'] = 'Job code must be entered!',
            ['gang_required'] = 'Gang code must be entered!',
            ['invalid_capacity'] = 'Capacity must be between 100-5000 kg!'
        },
        ['logs'] = {
            ['storage_created'] = 'Storage Created',
            ['storage_deleted'] = 'Storage Deleted',
            ['storage_info'] = '**Storage Info**\nName: %s\nType: %s\nJob: %s\nGang: %s\nCapacity: %s'
        }
    }
}

function _L(key, ...)
    local locale = Config.Locales[Config.Locale]
    if not locale then return 'Missing locale: ' .. Config.Locale end
    
    local keys = {}
    for k in string.gmatch(key, "[^.]+") do
        table.insert(keys, k)
    end
    
    local value = locale
    for _, k in ipairs(keys) do
        value = value[k]
        if not value then return 'Missing key: ' .. key end
    end
    
    if select('#', ...) > 0 then
        return string.format(value, ...)
    end
    
    return value
end
