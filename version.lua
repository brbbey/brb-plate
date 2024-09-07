local currentVersion = nil
PerformHttpRequest("https://raw.githubusercontent.com/FiveEngine/FiveEngine-OzelPlaka/main/fxmanifest.lua", function(err, text, headers)
    if err == 200 then
        currentVersion = LoadResourceFile(GetCurrentResourceName(), "fxmanifest.lua"):match("version '(%d+%.%d+%.%d+)'")
        local latestVersion = text:match("version '(%d+%.%d+%.%d+)'")

        if latestVersion then
            if currentVersion ~= latestVersion then
                print("^1[Uyarı]: Script'iniz güncel değil! En son sürüm: " .. latestVersion .. " | Mevcut sürüm: " .. currentVersion .. "^0")
            else
                print("^2[Bilgi]: Script'iniz güncel! Sürüm: " .. currentVersion .. "^0")
            end
        else
            print("^3[Hata]: GitHub'dan sürüm bilgisi alınamadı. fxmanifest.lua dosyasında 'version' anahtarı bulunamadı.^0")
        end
    else
        print("^3[Hata]: Sürüm kontrolü sırasında bir hata oluştu. Lütfen URL'nin doğru olduğundan emin olun.^0")
    end
end)
