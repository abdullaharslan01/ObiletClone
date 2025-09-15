//
//  HelpTopic.swift
//  ObiletClone
//
//  Created by abdullah on 15.09.2025.
//

import Foundation

struct HelpTopic: Identifiable {
    let id = UUID()
    let title: String
    let link: String
}

struct HelpCategory: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let topics: [HelpTopic]
}

enum HelpData {
    static let categories: [HelpCategory] = [
        HelpCategory(
            title: "Otobüs Bileti",
            image: AppImages.bus,
            topics: [
                HelpTopic(title: "Otobüs - Açık Bilet Kuponumu Nasıl Kullanabilirim?",
                          link: "https://yardim.obilet.com/hc/tr/articles/15849928568988-Otob%C3%BCs-A%C3%A7%C4%B1k-Bilet-Kuponumu-Nas%C4%B1l-Kullanabilirim"),
                HelpTopic(title: "Otobüs biletimi nasıl iptal ederim?",
                          link: "https://yardim.obilet.com/hc/tr/articles/360014116139-Otob%C3%BCs-biletimi-nas%C4%B1l-iptal-ederim"),
                HelpTopic(title: "Otobüs biletimi nasıl değiştirebilirim?",
                          link: "https://yardim.obilet.com/hc/tr/articles/360014412279-Otob%C3%BCs-biletimi-nas%C4%B1l-de%C4%9Fi%C5%9Ftirebilirim"),
                HelpTopic(title: "Diğer Konular",
                          link: "https://yardim.obilet.com/hc/tr/categories/360001240994-Otobüs-Bileti-Yardım-ve-İletişim")
            ]
        ),
        HelpCategory(
            title: "Uçak Bileti",
            image: AppImages.plane,
            topics: [
                HelpTopic(title: "Uçak biletimi nasıl iptal edebilirim?",
                          link: "https://yardim.obilet.com/hc/tr/articles/360014341160-U%C3%A7ak-biletimi-nas%C4%B1l-iptal-edebilirim"),
                HelpTopic(title: "Uçak biletimi nasıl değiştirebilirim?",
                          link: "https://yardim.obilet.com/hc/tr/articles/5118742312476-U%C3%A7ak-biletimi-nas%C4%B1l-de%C4%9Fi%C5%9Ftirebilirim"),
                HelpTopic(title: "Uçak bileti alırken kartımdan ücret çekildi ama bilet bilgilerim gelmedi, ne yapmalıyım?",
                          link: "https://yardim.obilet.com/hc/tr/articles/360015423874-U%C3%A7ak-bileti-al%C4%B1rken-kart%C4%B1mdan-%C3%BCcret-%C3%A7ekildi-ama-bilet-bilgilerim-gelmedi-ne-yapmal%C4%B1y%C4%B1m"),
                HelpTopic(title: "Diğer Konular",
                          link: "https://yardim.obilet.com/hc/tr/categories/360001266133-Uçak-Bileti-Yardım-ve-İletişim")
            ]
        ),
        HelpCategory(
            title: "Otel",
            image: AppImages.hotel,
            topics: [
                HelpTopic(title: "Otel rezervasyonumu nasıl iptal edebilirim?",
                          link: "https://yardim.obilet.com/hc/tr/articles/12668583060124-Otel-rezervasyonumu-nas%C4%B1l-iptal-edebilirim"),
                HelpTopic(title: "Otel rezervasyonumda değişiklik yapabilir miyim",
                          link: "https://yardim.obilet.com/hc/tr/articles/12706407338012-Otel-rezervasyonumda-de%C4%9Fi%C5%9Fiklik-yapabilir-miyim"),
                HelpTopic(title: "Otele giriş yaparken yanımda bulundurmam gereken belgeler nelerdir?",
                          link: "https://yardim.obilet.com/hc/tr/articles/5546934810268-Otele-giri%C5%9F-yaparken-yan%C4%B1mda-bulundurmam-gereken-belgeler-nelerdir"),
                HelpTopic(title: "Diğer Konular",
                          link: "https://yardim.obilet.com/hc/tr/categories/5194407709340-Otel-Rezervasyonu")
            ]
        ),
        HelpCategory(
            title: "Araç Kiralama",
            image: AppImages.car,
            topics: [
                HelpTopic(title: "İptal/İade ve Değişim Süreçleri",
                          link: "https://yardim.obilet.com/hc/tr/articles/5226148210716-%C4%B0ptal-%C4%B0ade-ve-De%C4%9Fi%C5%9Fim-S%C3%BCre%C3%A7leri"),
                HelpTopic(title: "Araç kiralama rezervasyonumu nasıl görebilirim?",
                          link: "https://yardim.obilet.com/hc/tr/articles/10874520822812-Ara%C3%A7-kiralama-rezervasyonumu-nas%C4%B1l-g%C3%B6rebilirim"),
                HelpTopic(title: "Araç kiralama hizmetinin faturasını nasıl alabilirim? Kurumsal fatura düzenlenebilir mi?",
                          link: "https://yardim.obilet.com/hc/tr/articles/4596339525916-Ara%C3%A7-kiralama-hizmetinin-faturas%C4%B1n%C4%B1-nas%C4%B1l-alabilirim-Kurumsal-fatura-d%C3%BCzenlenebilir-mi"),
                HelpTopic(title: "Diğer Konular",
                          link: "https://yardim.obilet.com/hc/tr/categories/7999736714012-Araç-Kiralama")
            ]
        ),
        HelpCategory(
            title: "Feribot Bileti",
            image: AppImages.ferry,
            topics: [
                HelpTopic(title: "Satın aldığım bilette koltuğu değiştirebilir miyim?",
                          link: "https://yardim.obilet.com/hc/tr/articles/4719195756572-Sat%C4%B1n-ald%C4%B1%C4%9F%C4%B1m-bilette-koltu%C4%9Fu-de%C4%9Fi%C5%9Ftirebilir-miyim"),
                HelpTopic(title: "Feribot Bilet İptali, İadesi ve Değişim Koşulları",
                          link: "https://yardim.obilet.com/hc/tr/articles/360019580598-Feribot-Bilet-%C4%B0ptali-%C4%B0adesi-ve-De%C4%9Fi%C5%9Fim-Ko%C5%9Fullar%C4%B1"),
                HelpTopic(title: "Feribot seferlerinde evcil hayvanım ile seyahat edebilir miyim?",
                          link: "https://yardim.obilet.com/hc/tr/articles/360019602817-Feribot-seferlerinde-evcil-hayvan%C4%B1m-ile-seyahat-edebilir-miyim"),
                HelpTopic(title: "Yunan Adaları feribot bileti açığa alınabilir mi?",
                          link: "https://yardim.obilet.com/hc/tr/articles/13978065527708-Yunan-Adalar%C4%B1-feribot-bileti-a%C3%A7%C4%B1%C4%9Fa-al%C4%B1nabilir-mi"),
                HelpTopic(title: "Yunan Adaları feribot bileti iptal edilebilir mi?",
                          link: "https://yardim.obilet.com/hc/tr/articles/13977984701852-Yunan-Adalar%C4%B1-feribot-bileti-iptal-edilebilir-mi"),
                HelpTopic(title: "Diğer Konular",
                          link: "https://yardim.obilet.com/hc/tr/categories/360003255159-Feribot-Yardım-ve-İletişim")
            ]
        ),
        HelpCategory(
            title: "Tren Bileti",
            image: AppImages.train,
            topics: [
                HelpTopic(title: "Trene Yetişmek İçin Ne Zaman İstasyonda Olmalıyım?",
                          link: "https://yardim.obilet.com/hc/tr/articles/16747144662684-Trene-Yeti%C5%9Fmek-%C4%B0%C3%A7in-Ne-Zaman-%C4%B0stasyonda-Olmal%C4%B1y%C4%B1m"),
                HelpTopic(title: "Diğer Konular",
                          link: "https://yardim.obilet.com/hc/tr/categories/16783689241500-Tren-Bileti-Yardım-ve-İletişim")
            ]
        )
    ]
}
