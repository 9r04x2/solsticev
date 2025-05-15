local Translations = {
    error = {
        no_people_nearby = "Yakınlarda oyuncu yok",
        no_vehicle_found = "Araç bulunamadı",
        extra_deactivated = "Ekstra %{extra} devre dışı bırakıldı",
        extra_not_present = "Bu araçta %{extra} mevcut değil",
        not_driver = "Araçta sürücü değilsin",
        vehicle_driving_fast = "Bu araç çok hızlı gidiyor",
        seat_occupied = "Bu koltuk dolu",
        race_harness_on = "Yarış emniyet kemerin var, değiştiremezsin",
        obj_not_found = "İstenen nesne oluşturulamadı",
        not_near_ambulance = "Bir ambulansa yakın değilsin",
        far_away = "Çok uzaktasın",
        stretcher_in_use = "Bu sedye zaten kullanılıyor",
        not_kidnapped = "Bu kişiyi kaçırmadın",
        trunk_closed = "Bagaj kapalı",
        cant_enter_trunk = "Bu bagaja giremezsin",
        already_in_trunk = "Zaten bagajdasın",
        someone_in_trunk = "Bagajda zaten biri var"
    },
    progress = {
        flipping_car = "Aracı çevirmek.."
    },
    success = {
        extra_activated = "Ekstra %{extra} etkinleştirildi",
        entered_trunk = "Bagajdasın"
    },
    info = {
        no_variants = "Bunun için herhangi bir varyant görünmüyor",
        wrong_ped = "Bu ped modeli bu seçeneği desteklemiyor",
        nothing_to_remove = "Kaldıracak bir şeyin yok gibi görünüyor",
        already_wearing = "Zaten bunu giyiyorsun",
        switched_seats = "Artık %{seat} koltukdasın"
    },
    general = {
        command_description = "Radial Menüyü Aç",
        push_stretcher_button = "[E] - Sedye İt",
        stop_pushing_stretcher_button = "~g~E~w~ - Sedye İtmeyi Durdur",
        lay_stretcher_button = "[G] - Sedyeye Yat",
        push_position_drawtext = "Buradan İt",
        get_off_stretcher_button = "[G] - Sedyeden İn",
        get_out_trunk_button = "[E] Bagajdan Çık",
        close_trunk_button = "[G] Bagajı Kapat",
        open_trunk_button = "[G] Bagajı Aç",
        getintrunk_command_desc = "Bagaja Gir",
        putintrunk_command_desc = "Oyuncuyu Bagaja Koy"
    },
    options = {
        emergency_button = "Acil Durum Butonu",
        driver_seat = "Sürücü Koltuğu",
        passenger_seat = "Yolcu Koltuğu",
        other_seats = "Diğer Koltuk",
        rear_left_seat = "Arka Sol Koltuk",
        rear_right_seat = "Arka Sağ Koltuk"
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
