-- Add translations by MC
local Translations = {
    headers = {
        ['bsm'] = 'Meslek Menü - ',
    },
    body = {
        ['manage'] = 'Çalışanları Yönet',
        ['managed'] = 'Çalışan Listenizi Kontrol Edin',
        ['hire'] = 'İşe al',
        ['hired'] = 'Yakındaki Sivilleri İşe Alın',
        ['storage'] = 'Depo',
        ['storaged'] = 'Depoyu Aç',
        ['outfits'] = 'Kıyafetler',
        ['outfitsd'] = 'Kayıtlı Kıyafetleri Gör',
        ['money'] = 'Para yönetimi',
        ['moneyd'] = 'Şirket Bakiyenizi Kontrol Edin',
        ['mempl'] = 'Çalışan Listesi - ',
        ['mngpl'] = 'Çalışan Listesi',
        ['grade'] = 'Seviye: ',
        ['fireemp'] = 'İşten Kov',
        ['hireemp'] = 'İşe Alma Menüsü - ',
        ['cid'] = 'Vatandaşlık Numarası: ',
        ['balance'] = 'Kasa: $',
        ['deposit'] = 'Para Yatır',
        ['depositd'] = 'Kasaya Para Yatır',
        ['withdraw'] = 'Para Çek',
        ['withdrawd'] = 'Kasadan Para Çek',
        ['depositm'] = 'Para Yatırma <br> Kullanılabilir Bakiye: $',
        ['withdrawm'] = 'Para Çekme <br> Kullanılabilir Bakiye: $',
        ['submit'] = 'Onayla',
        ['amount'] = 'Miktar',
        ['return'] = 'Geri',
        ['exit'] = 'Geri',
    },
    drawtext = {
        ['label'] = '[E] Open Job Management',
    },
    target = {
        ['label'] = 'Meslek Menüsü',
    },
    headersgang = {
        ['bsm'] = 'Gang Management  - ',
    },
    bodygang = {
        ['manage'] = 'Çalışanları Yönet',
        ['managed'] = 'Çalışan Listenizi Kontrol Edin',
        ['hire'] = 'İşe al',
        ['hired'] = 'Yakındaki Sivilleri İşe Alın',
        ['storage'] = 'Depo',
        ['storaged'] = 'Depoyu Aç',
        ['outfits'] = 'Kıyafetler',
        ['outfitsd'] = 'Kayıtlı Kıyafetleri Gör',
        ['money'] = 'Para yönetimi',
        ['moneyd'] = 'Şirket Bakiyenizi Kontrol Edin',
        ['mempl'] = 'Çalışan Listesi - ',
        ['mngpl'] = 'Çalışan Listesi',
        ['grade'] = 'Seviye: ',
        ['fireemp'] = 'İşten Kov',
        ['hireemp'] = 'İşe Alma Menüsü - ',
        ['cid'] = 'Vatandaşlık Numarası: ',
        ['balance'] = 'Kasa: $',
        ['deposit'] = 'Para Yatır',
        ['depositd'] = 'Kasaya Para Yatır',
        ['withdraw'] = 'Para Çek',
        ['withdrawd'] = 'Kasadan Para Çek',
        ['depositm'] = 'Para Yatırma <br> Kullanılabilir Bakiye: $',
        ['withdrawm'] = 'Para Çekme <br> Kullanılabilir Bakiye: $',
        ['submit'] = 'Onayla',
        ['amount'] = 'Miktar',
        ['return'] = 'Geri',
        ['exit'] = 'Geri',
    },
    drawtextgang = {
        ['label'] = '[E] Open Gang Management',
    },
    targetgang = {
        ['label'] = 'Gang Menu',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
