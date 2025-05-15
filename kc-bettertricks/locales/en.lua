Locale                          = Locale or {}

Locale['en'] = { -- 'en' is the reference that will be used for 'Config.Language'

    -- DEBUG SECTION
    DebugName                               = "[HATA AYIKLAMA]",
    LoadingPlayerConfig                     = "Oyuncu yapılandırması yükleniyor...",
    GroundPreferencesLoaded                 = "Zemin tercihleri yüklendi",
    AirPreferencesLoaded                    = "Hava tercihleri yüklendi",
    ControlTypeLoaded                       = "Kontrol türü yüklendi",
    PlayerConfigLoaded                      = "Oyuncu yapılandırması yüklendi!",
    NoStuntFound                            = "Bu tuş kombinasyonu için bir stunt bulunamadı",
    NoFirstInput                            = "İlk giriş yok",
    NoSecondInput                           = "İkinci giriş yok",
    PlayerNoLongerInAir                     = "Artık havada değil, stunt iptal edildi.",
    WaitingPlayerNextInput                  = "Oyuncunun nötr yönünü değiştirmesini bekliyor.",
    WaitingPlayerFirstInput                 = "Oyuncu nötr yönünü değiştirdi. Şimdi oyuncunun ilk yön girişi yapmasını bekleyecek.",
    WaitingPlayerFirstInputLoop             = "Oyuncunun ilk yön girişi yapmasını bekliyor.",
    WaitingPlayerSecondInput                = "İlk yön algılandı, şimdi oyuncunun ikinci yön girişi yapmasını bekleyecek.",
    WaitingPlayerSecondInputLoop            = "Oyuncunun ikinci yön girişi yapmasını bekliyor.",
    PlayerSecondInputProcess                = "İkinci yön algılandı, şimdi %s %s stuntunu gerçekleştirecek.",

    -- COMMAND SECTION
    ChatHeader                              = "Sistem",

    TricksOrganizeCMDHeader                 = "Mevcut Tuş Yönü Yapılandırmaları:\n",
    TricksOrganizeCMDArgs1Missing           = "Yön '%s' bulunamadı!",
    TricksOrganizeCMDInvalidFormat          = "Geçersiz format! Kullanım: /%s [birincilYön] [ikincilYön] [akrobatikHareketAdı]",
    TricksOrganizeCMDStuntDontExist         = "Bu akrobatik hareket mevcut değil",
    TricksOrganizeCMDSetPreferences         = "%s + %s \"%s\" olarak ayarlandı",
    TricksOrganizeSuggestionGenericFormat   = "/%s [birincilYön] [ikincilYön] [akrobatikHareketAdı]",
    TricksOrganizeSuggestionExample         = "'/%s yukarı aşağı Nac-Nac (R)'",
    TricksOrganizeSuggestionListExample     = "'/%s liste' (tam tabloyu görmek için)",
    TricksOrganizeSuggestionListExample2    = "'/%s liste [birincilYön]' (örneğin 'yukarı', 'yukarı' hareket listesini görmenizi sağlar)",
    TricksOrganizeSuggestionHeader          = "Bir hareket ayarlamak için %s kullanın. Örnek: %s, %s veya %s. Toplam mevcut hareket sayısı: %d",
    TricksOrganizeSuggestionPrimary         = "Örnek: yukarı, aşağı, sol, sağ veya 'liste' (tabloyu görüntülemek için). 'liste' kullanıyorsanız, sonuçları filtrelemek için bir yön de belirtebilirsiniz.",
    TricksOrganizeSuggestionSecond          = "Örnek: yukarı, aşağı, sol, sağ (birincilYön'den farklı olmalı)",
    TricksOrganizeSuggestionStuntName       = "Hareketin adı. Örnek: %s",


    TricksToggleCommandInvalid              = "Geçersiz hareket adı!",
    TricksToggleCommandSetPreferences       = "%s %s olarak ayarlandı",
    TricksToggleSuggestionHeader            = "/%s [hareketAdı] kullanarak bir hareketi etkinleştirin veya devre dışı bırakın.\nEtkin Hareketler (%d): %s\nDevre Dışı Hareketler (%d): %s",
    TricksToggleSuggestionPrimary           = "\nEtkin Hareketler (%d): %s\nDevre Dışı Hareketler (%d): %s",
    TricksToggleEnabled                     = "etkin",
    TricksToggleDisabled                    = "devre dışı",

    TricksControlCMDSetType                 = "Kontrol şu şekilde ayarlandı: %s",
    TricksControlCMDInvalidFormat           = "Geçersiz format! Kullanım: /%s [kontrolTürü] \nMevcut kontrol türleri: 'Normal' ve 'Ters'",
    TricksControlSuggestionHeader           = "/%s [kontrolTürü] kullanarak wheelie modunu nasıl kontrol edeceğinizi seçin (Mevcut: %s)\n'Normal' yüksek hızdaki wheelie'ler için daha kolay, 'Ters' ise düşük hızlarda daha kontrollü.",
    TricksControlSuggestionPrimary          = "\nMevcut kontrol türleri: 'Normal' ve 'Ters'",


    -- GENERAL SECTION
    ErrorPlayerNoGroundPreferences          = "En az 1 hareket eklemelisiniz. Birini eklemek için /%s komutunu kullanın!",


}