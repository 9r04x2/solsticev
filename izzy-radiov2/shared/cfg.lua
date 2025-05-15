cfg = {
    debug = false,
    defaultVolume = 50,
    radioProp = 'prop_cs_hand_radio',
    loopInterval = 1000, -- this checks whether the number of members has pressed the microphone. the lower this number, the faster it checks, but keep in mind that this will affect the performance of your server. the recommended value is 500
    clearSizeCommand = 'clearRadioSize',

    frequencies = { -- ['FREQUENCY'] = { 'job_name', ... }
        ['1'] = {
            type = 'police',
            jobs =  { 'police','bcsd','pbsd','lssp','lspr', 'dsd', 'doj','vespuccipd','ambulance' }
        },
        ['2'] = {
            type = 'police',
            jobs =  { 'police','bcsd','pbsd','lssp','lspr', 'dsd', 'doj','vespuccipd','ambulance' }
        },
        ['3'] = {
            type = 'police',
            jobs =  { 'police','bcsd','pbsd','lssp','lspr', 'dsd', 'doj','vespuccipd','ambulance' }
        },
        ['4'] = {
            type = 'police',
            jobs =  { 'police','bcsd','pbsd','lssp','lspr', 'dsd', 'doj','vespuccipd','ambulance' }
        },
        ['5'] = {
            type = 'ambulance',
            jobs =  { 'police','bcsd','pbsd','lssp','lspr', 'dsd', 'doj','vespuccipd','ambulance' }
        },
        ['6'] = {
            type = 'police',
            jobs =  { 'police','bcsd','pbsd','lssp','lspr', 'dsd', 'doj','vespuccipd','ambulance' }
        },
        ['7'] = {
            type = 'police',
            jobs =  { 'police','bcsd','pbsd','lssp','lspr', 'dsd', 'doj','vespuccipd','ambulance' }
        },
        ['8'] = {
            type = 'police',
             jobs =  { 'police','bcsd','pbsd','lssp','lspr', 'dsd', 'doj','vespuccipd','ambulance' }
        },
        ['9'] = {
            type = 'police',
            jobs =  { 'police','bcsd','pbsd','lssp','lspr', 'dsd', 'doj','vespuccipd','ambulance' }
        }
    },
    types = {
        police = './lspd.png', -- you can change/add in web/dist or you can use with link
        ems = './ems.png', -- you can change/add in web/dist or you can use with link
        sheriff = './sheriff.png', -- you can change/add in web/dist or you can use with link
    },

    locale = 'en',
    locales = {
        ["en"] = {
            channels = 'Kanallar',
            members = 'Üyeler',
            channelList = 'Kanal Listesi',
            favorite = 'Favorilere Eklendi',
            addToFavorite = 'Favorilere Ekle',
            connect = 'Bağlan',
            ['not'] = 'Hayır',
            frequency = 'Frekans',
            radioChannel = 'Radyo Kanalı;',
            message = 'Mesaj...',
            name = 'Ad',
            password = 'Şifre',
            save = 'Kaydet',
            memberList = 'Üye Listesi',
            wrongPassword = 'Yanlış şifre girdiniz, tekrar deneyin!',
            detailsChanged = 'Ayrıntılar başarıyla değiştirildi!',
            youCanConnect = 'Bu frekansa bağlanamazsınız',
            thisChannelDeleted = 'Bu kanal silindi!',
            maxVolume = 'Maksimum ses seviyesi',
            minVolume = 'Minimum ses seviyesi',
            currentVolume = 'Geçerli ses seviyesi',
            playerPlaceholder = 'Ad'
        }
    }
}
