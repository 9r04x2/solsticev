local Translations = {
    lang = {
        header = 'Araç Listesi',
        officer = 'Görüşme yapılan kişi : ',
        pay = ' karşılığı satın al'
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})