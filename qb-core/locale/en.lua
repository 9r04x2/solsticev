local Translations = {
    error = {
        not_online                  = 'Oyuncu Aktif Değil!',
        wrong_format                = 'Yanlış format',
        missing_args                = 'Tüm argümanlar girilmedi (x, y, z)',
        missing_args2               = 'Tüm argümanlar doldurulmalıdır!',
        no_access                   = 'Bu komutu kullanma izni yok',
        company_too_poor            = 'İşvereniniz iflas etti',
        item_not_exist              = 'Öge mevcut değil',
        too_heavy                   = 'Envanter çok dolu',
        location_not_exist          = 'Konum mevcut değil',
        duplicate_license           = '[QBCORE] - Yineleme Rockstar Lisansı Bulundu',
        no_valid_license            = '[QBCORE] - Geçerli bir Rockstar Lisansı Bulunamadı',
        not_whitelisted             = '[QBCORE] - Bu sunucu için beyaz listeye alınmadınız',
        server_already_open         = 'Sunucu zaten açık',
        server_already_closed       = 'Sunucu zaten kapalı',
        no_permission               = 'Bunu yapmak için izniniz yok..',
        no_waypoint                 = 'Yol işareti ayarlanmadı.',
        tp_error                    = 'Teleport yapılırken hata oluştu.',
        connecting_database_error   = '[QBCORE] - Sunucuya bağlanırken bir veritabanı hatası oluştu. (SQL sunucusu açık mı?)',
        connecting_database_timeout = '[QBCORE] - Veritabanına bağlantı zaman aşımına uğradı. (SQL sunucusu açık mı?)',
    },
    success = {
        server_opened = 'Sunucu açıldı',
        server_closed = 'Sunucu kapatıldı',
        teleported_waypoint = 'Yol işaretine teleport edildi.',
    },
    info = {
        received_paycheck = 'Maaşınızı aldınız: $%{value}',
        job_info = 'İş: %{value} | Kademe: %{value2} | Görev: %{value3}',
        gang_info = 'Çete: %{value} | Kademe: %{value2}',
        on_duty = 'Şimdi görevdesiniz!',
        off_duty = 'Şimdi görev dışı!',
        checking_ban = 'Merhaba %s. Yasaklı olup olmadığınızı kontrol ediyoruz.',
        join_server = 'Hoş geldiniz %s {Sunucu Adı} sunucusuna.',
        checking_whitelisted = 'Merhaba %s. İzin durumunuzu kontrol ediyoruz.',
        exploit_banned = 'Hile yaptığınız için yasaklandınız. Daha fazla bilgi için Discord\'a bakın: %{discord}',
        exploit_dropped = 'Hile Yapmaktan Atıldınız',
    },
    command = {
        tp = {
            help = 'Oyuncuya veya Koordinatlara TP (Yöneticiye Özel)',
            params = {
                x = { name = 'id/x', help = 'Oyuncunun IDsi veya X pozisyonu' },
                y = { name = 'y', help = 'Y pozisyonu' },
                z = { name = 'z', help = 'Z pozisyonu' },
            },
        },
        tpm = { help = 'İşaretçiye TP (Yöneticiye Özel)' },
        togglepvp = { help = 'Sunucuda PVP\'yi Değiştir (Yöneticiye Özel)' },
        addpermission = {
            help = 'Oyuncuya İzinler Ver (Tanrıya Özel)',
            params = {
                id = { name = 'id', help = 'Oyuncunun IDsi' },
                permission = { name = 'permission', help = 'İzin seviyesi' },
            },
        },
        removepermission = {
            help = 'Oyuncudan İzinleri Kaldır (Tanrıya Özel)',
            params = {
                id = { name = 'id', help = 'Oyuncunun IDsi' },
                permission = { name = 'permission', help = 'İzin seviyesi' },
            },
        },
        openserver = { help = 'Sunucuyu herkese aç (Yöneticiye Özel)' },
        closeserver = {
            help = 'Sunucuyu izni olmayanlar için kapat (Yöneticiye Özel)',
            params= {
                reason = { name = 'reason', help = 'Kapatma nedeni (isteğe bağlı)' },
            },
        },
        car = {
            help = 'Araç Oluştur (Yöneticiye Özel)',
            params = {
                model = { name = 'model', help = 'Araç modeli adı' },
            },
        },
        dv = { help = 'Araç Sil (Yöneticiye Özel)' },
        dvall = { help = 'Tüm Araçları Sil (Yöneticiye Özel)' },
        dvp = { help = 'Tüm NPCleri Sil (Yöneticiye Özel)' },
        dvo = { help = 'Tüm Objeleri Sil (Yöneticiye Özel)' },
        givemoney = {
            help = 'Oyuncuya Para Ver (Yöneticiye Özel)',
            params = {
                id = { name = 'id', help = 'Oyuncunun IDsi' },
                moneytype = { name = 'moneytype', help = 'Para türü (nakit, banka, kripto)' },
                amount = { name = 'amount', help = 'Miktar' },
            },
        },
        setmoney = {
            help = 'Oyuncunun Para Miktarını Ayarla (Yöneticiye Özel)',
            params = {
                id = { name = 'id', help = 'Oyuncunun IDsi' },
                moneytype = { name = 'moneytype', help = 'Para türü (nakit, banka, kripto)' },
                amount = { name = 'amount', help = 'Miktar' },
            },
        },
        job = { help = 'İşinizi Kontrol Edin' },
        setjob = {
            help = 'Bir Oyuncunun İşini Ayarla (Yöneticiye Özel)',
            params = {
                id = { name = 'id', help = 'Oyuncunun IDsi' },
                job = { name = 'job', help = 'İş adı' },
                grade = { name = 'grade', help = 'İş kademesi' },
            },
        },
        gang = { help = 'Çetenizi Kontrol Edin' },
        setgang = {
            help = 'Bir Oyuncunun Çetesini Ayarla (Yöneticiye Özel)',
            params = {
                id = { name = 'id', help = 'Oyuncunun IDsi' },
                gang = { name = 'gang', help = 'Çete adı' },
                grade = { name = 'grade', help = 'Çete kademesi' },
            },
        },
        ooc = { help = 'OOC Sohbet Mesajı' },
        me = {
            help = 'Yerel mesajı göster',
            params = {
                message = { name = 'message', help = 'Gönderilecek mesaj' }
            },
        },
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

