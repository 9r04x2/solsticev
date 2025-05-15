local Translations = {
    notify = {
        ydhk = 'Bu aracın anahtarlarına sahip değilsiniz.',
        nonear = 'Yakınında anahtar verilebilecek kimse yok.',
        vlock = 'Araç kilitlendi!',
        vunlock = 'Araç kilidi açıldı!',
        vlockpick = 'Kapı kilidini açmayı başardınız!',
        fvlockpick = 'Anahtarı bulamadınız ve sinirlendiniz.',
        vgkeys = 'Anahtarları teslim ettiniz.',
        vgetkeys = 'Araç anahtarlarını aldınız!',
        fpid = 'Oyuncu kimliği ve plaka bilgilerini doldurun',
        cjackfail = 'Araç çalma başarısız oldu!',
        vehclose = 'Yakında araç yok!',
    },
    progress = {
        takekeys = 'Anahtarı bedenden alınıyor...',
        hskeys = 'Araç anahtarları aranıyor...',
        acjack = 'Araç çalma deneniyor...',
    },
    info = {
        skeys = '~g~[H]~w~ - Anahtarları ara',
        tlock = 'Araç Kilidini Değiştir',
        palert = 'Araç hırsızlığı devam ediyor. Tür: ',
        engine = 'Motoru Aç/Kapat',
    },
    addcom = {
        givekeys = 'Anahtarları birine teslim edin. Eğer ID yoksa, en yakındaki kişiye veya araçtaki herkese verir.',
        givekeys_id = 'id',
        givekeys_id_help = 'Oyuncu IDsi',
        addkeys = 'Birine araç için anahtar ekleyin.',
        addkeys_id = 'id',
        addkeys_id_help = 'Oyuncu IDsi',
        addkeys_plate = 'plaka',
        addkeys_plate_help = 'Plaka',
        rkeys = 'Birinden araç için anahtarları kaldırın.',
        rkeys_id = 'id',
        rkeys_id_help = 'Oyuncu IDsi',
        rkeys_plate = 'plaka',
        rkeys_plate_help = 'Plaka',
    }

}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
