local Translations = {
    error = {
        already_has_plate = 'Bu aracın bu plaka üzerinde zaten başka bir plakası var',
        does_not_have_fakeplate = 'Bu araçta takılı ekstra bir plaka bulunmuyor',
        
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
