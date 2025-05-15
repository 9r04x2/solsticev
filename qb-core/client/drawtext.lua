local textUISerial = nil

-- TextUI kaldırma fonksiyonu (persistent versiyon çağrılıyor)
local function HideText()
    if textUISerial then
        if exports["ZSX_UIV2"] and exports["ZSX_UIV2"].TextUI_RemovePersistent then
            local success, err = pcall(function()
                exports["ZSX_UIV2"]:TextUI_RemovePersistent(false)
            end)
            if not success then
                print("[lib.HideText] TextUI_RemovePersistent çağrısı başarısız oldu:", err)
            else
                print("[lib.HideText] Persistent TextUI kaldırıldı.")
            end
        else
            print("[lib.HideText] TextUI_RemovePersistent export fonksiyonu bulunamadı!")
        end
        textUISerial = nil  -- persistent versiyonda serial saklanmasa da bayrak sıfırlanıyor
    else
        print("[lib.HideText] Kaldırılacak TextUI mevcut değil.")
    end
end

-- TextUI gösterme fonksiyonu
local function drawText(text, position)
    if type(position) ~= "string" then 
        position = "left" 
    end

    -- Eğer mevcut TextUI varsa kaldırıyoruz
    HideText()

    if exports["ZSX_UIV2"] and exports["ZSX_UIV2"].TextUI_Persistent then
        -- Persistent TextUI, duration = -1 ile sonsuz gösterilir
        exports["ZSX_UIV2"]:TextUI_Persistent("E", text, -1, function() end, function() end)
        -- Persistent modda serial genellikle dönmez; sadece bayrak tutulur
        textUISerial = true
        print("[lib.drawText] Persistent TextUI gösterildi:", text)
    else
        print("[lib.drawText] TextUI_Persistent export fonksiyonu bulunamadı!")
    end
end

-- Metin güncelleme: Önce mevcut metin kaldırılır, sonra yeni metin eklenir.
local function changeText(text, position)
    HideText()
    drawText(text, position)
end

-- Tuşa basılınca çalışacak fonksiyon: NUI'ye 'KEY_PRESSED' mesajı gönderilir, 500 ms sonra TextUI kapatılır.
local function keyPressed()
    CreateThread(function()
        SendNUIMessage({
            action = 'KEY_PRESSED'
        })
        Wait(500)
        HideText()
    end)
end

-- Net Event'ler: Bu event'ler tetiklendiğinde ilgili fonksiyonlar çağrılır.
RegisterNetEvent('qb-core:client:DrawText', function(text, position)
    drawText(text, position)
end)

RegisterNetEvent('qb-core:client:ChangeText', function(text, position)
    changeText(text, position)
end)

RegisterNetEvent('qb-core:client:HideText', function()
    HideText()
end)

RegisterNetEvent('qb-core:client:KeyPressed', function()
    keyPressed()
end)

-- Exportlar; diğer kaynaklar bu fonksiyonları çağırabilir.
exports('DrawText', drawText)
exports('ChangeText', changeText)
exports('HideText', HideText)
exports('KeyPressed', keyPressed)
