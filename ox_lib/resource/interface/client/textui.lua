local textUISerial = nil  -- Persistent modda serial genellikle dönmez, ama bayrak tutuyoruz.

-- TextUI kaldırma fonksiyonu (persistent)
local function hideText()
    if textUISerial then
        if exports["ZSX_UIV2"] and exports["ZSX_UIV2"].TextUI_RemovePersistent then
            local success, err = pcall(function()
                exports["ZSX_UIV2"]:TextUI_RemovePersistent(false)
            end)
            if not success then
                print("[lib.hideTextUI] TextUI_RemovePersistent çağrısı başarısız oldu:", err)
            else
                print("[lib.hideTextUI] Persistent TextUI kaldırıldı.")
            end
        else
            print("[lib.hideTextUI] TextUI_RemovePersistent export fonksiyonu bulunamadı!")
        end
        textUISerial = nil
    else
        print("[lib.hideTextUI] Kaldırılacak TextUI mevcut değil.")
    end
end

---@class TextUIOptions
---@field key? string          -- Tıklanabilir kontrol için kullanılan key (varsayılan: "E")
---@field onComplete? function -- TextUI tamamlandığında çağrılacak fonksiyon
---@field onFailure? function  -- TextUI tıklanamadığında veya iptal edildiğinde çağrılacak fonksiyon
---@field persistent? boolean  -- Eğer true ise, persistent TextUI kullanılır (bizim kullanımda her zaman persistent olacak)
-- Diğer seçenekler (position, icon, iconColor, style, alignIcon) export tarafından desteklenmiyorsa göz ardı edilir.

local isOpen = false
local currentText = nil
local isPersistent = false

--- TextUI ekler.
--- @param text string   -- Ekranda gösterilecek metin
--- @param options? TextUIOptions  -- Ek ayarlar; key, persistent, onComplete, onFailure
function lib.showTextUI(text, options)
    if currentText == text then 
        return 
    end

    options = options or {}
    currentText = text
    isOpen = true
    isPersistent = true  -- Zorla persistent mod

    local key = options.key or "E"  -- Varsayılan: "E"
    local onComplete = options.onComplete or function() end
    local onFailure = options.onFailure or function() end

    print("[lib.showTextUI] Persistent TextUI çağrılıyor. Text:", text)
    if exports["ZSX_UIV2"] and exports["ZSX_UIV2"].TextUI_Persistent then
        local success, err = pcall(function()
            -- Duration olarak -1 gönderilerek metin sonsuz süre ekranda kalır.
            exports["ZSX_UIV2"]:TextUI_Persistent(key, text, -1, onComplete, onFailure)
        end)
        if not success then
            print("[lib.showTextUI] TextUI_Persistent çağrısı başarısız oldu:", err)
        end
    else
        print("[lib.showTextUI] TextUI_Persistent export fonksiyonu bulunamadı!")
    end
end

--- TextUI'yi kaldırır.
--- @param animComplete? boolean  -- Animasyon tamamlanma durumu (varsayılan: false)
function lib.hideTextUI(animComplete)
    animComplete = animComplete or false
    print("[lib.hideTextUI] Persistent TextUI kaldırılıyor.")
    if exports["ZSX_UIV2"] and exports["ZSX_UIV2"].TextUI_RemovePersistent then
        local success, err = pcall(function()
            exports["ZSX_UIV2"]:TextUI_RemovePersistent(animComplete)
        end)
        if not success then
            print("[lib.hideTextUI] TextUI_RemovePersistent çağrısı başarısız oldu:", err)
        end
    else
        print("[lib.hideTextUI] TextUI_RemovePersistent export fonksiyonu bulunamadı!")
    end

    isOpen = false
    currentText = nil
    textUISerial = nil
    isPersistent = false
end

--- TextUI'nin açık olup olmadığını kontrol eder.
--- @return boolean, string|nil  -- İlk değer: açık mı, ikincisi: gösterilen metin (veya nil)
function lib.isTextUIOpen()
    return isOpen, currentText
end
