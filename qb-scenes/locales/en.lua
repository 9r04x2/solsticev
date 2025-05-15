local Translations = {
    notify = {
        ["laser_error"] = "Lazer hiçbir şeye isabet etmedi.",
        ["scene_delete"] = "Sahne silindi!",
        ["scene_error"] = "Yeterince yakın bir sahne yoktu.",
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})
