class Locale {
    constructor(strings) {
        this.update(strings);
    }

    update(strings) {
        this.strings = strings;
        this.setUI();
    }


    get(key) {
        return this.strings[key];
    }

    setUI() {
        for (const key in this.strings) {
            let element = document.getElementById(key)
            if(!element) continue;
            element.innerHTML = this.get(key);
        }
    }
}

let stringsEN = {
    "text_jobs": "İşler ve Gelir",
    "text_items": "Online İşlemler",
    "text_information": "Bilgilerim",
    "text_close": "Kapat",

    "text_identification": "Kimlik kartları",
    "desc_identification": "Aşağıda şu anda cebinizde hangi kimlik kartlarının bulunduğunu görebilirsiniz..",

    "text_licenses": "İzinler",
    "desc_licenses": "Aşağıda şu anda hangi kimlik kartlarına yazdırma erişiminiz olduğunu görebilirsiniz.",

    "text_buy": "Satın al",
    "text_apply": "Uygula",

    "text_cost": "Fiyat: $ ",
    "text_salary": "Maaş: $ ",
}


const locale = new Locale(stringsEN);