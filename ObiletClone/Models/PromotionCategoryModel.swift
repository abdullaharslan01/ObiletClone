//
//  PromotionCategoryModel.swift
//  ObiletClone
//
//  Created by abdullah on 14.09.2025.
//

import Foundation

struct PromotionCategoryModel: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let categoryType: PromotionCategory
    let tag: [PromotionCategory]
    let isUserCoupon: Bool
}

extension PromotionCategoryModel {
    static let demo: [PromotionCategoryModel] = [
        .init(image: "pro0", title: "Uçak Bileti Alana Otel Rezervasyonunda %15 İndirim!", categoryType: .flight, tag: [.flight, .hotel], isUserCoupon: false),
        .init(image: "pro1", title: "Ziraat Bankası Bankkart ile Özel Kampanya!", categoryType: .featured, tag: [.featured], isUserCoupon: false),
        .init(image: "pro2", title: "Burger King Menü İndirimleri – Tıkla Gelsin!", categoryType: .featured, tag: [.featured], isUserCoupon: true),
        .init(image: "pro3", title: "Eylül Ayına Özel Araç Kiralama Fırsatları!", categoryType: .bus, tag: [.bus], isUserCoupon: false),
        .init(image: "pro4", title: "Goldcar ile Seçeceğiniz Araçlarda %20 İndirim Kodu", categoryType: .bus, tag: [.bus], isUserCoupon: false),
        .init(image: "pro0", title: "Otobüs Biletlerinde Hafta Sonu Fırsatları!", categoryType: .bus, tag: [.bus], isUserCoupon: false),
        .init(image: "pro1", title: "Özel Tatil Paketlerinde Ekstra %10 İndirim", categoryType: .hotel, tag: [.hotel], isUserCoupon: false),
        .init(image: "pro2", title: "McDonald’s Menü Kampanyası – Sınırlı Süre", categoryType: .featured, tag: [.featured], isUserCoupon: false),
        .init(image: "pro3", title: "Araç Kiralamada Son Dakika Fırsatları!", categoryType: .bus, tag: [.bus], isUserCoupon: false),
        .init(image: "pro4", title: "Goldcar İndirim Kodunu Kaçırmayın!", categoryType: .bus, tag: [.bus], isUserCoupon: true),
        .init(image: "pro0", title: "Hafta İçi Otobüs Biletlerine %5 Ekstra İndirim!", categoryType: .bus, tag: [.bus], isUserCoupon: false),
        .init(image: "pro1", title: "Banka Kampanyalarıyla Tatilin Tadını Çıkarın!", categoryType: .featured, tag: [.featured], isUserCoupon: false),
        .init(image: "pro2", title: "Fast Food Siparişlerinde %20 İndirim", categoryType: .featured, tag: [.featured], isUserCoupon: true),
        .init(image: "pro3", title: "Araç Kiralamada Eylül Sonu İndirimleri", categoryType: .bus, tag: [.bus], isUserCoupon: false),
        .init(image: "pro4", title: "Goldcar İle Tatilde Tasarruf Et!", categoryType: .bus, tag: [.bus], isUserCoupon: true),
        .init(image: "pro0", title: "Uçak + Otel Paketlerinde Özel Kampanya", categoryType: .flight, tag: [.flight, .hotel], isUserCoupon: true),
        .init(image: "pro1", title: "Banka Kartınızla Özel İndirim Fırsatları", categoryType: .featured, tag: [.featured], isUserCoupon: false),
        .init(image: "pro2", title: "Fast Food Siparişlerinde Ekstra İndirim", categoryType: .featured, tag: [.featured], isUserCoupon: false),
        .init(image: "pro3", title: "Araç Kiralamada Son Dakika Kampanyası", categoryType: .bus, tag: [.bus], isUserCoupon: false),
        .init(image: "pro4", title: "Goldcar ile Tatil Keyfi %15 Daha Uygun", categoryType: .bus, tag: [.bus], isUserCoupon: false),
        .init(image: "pro0", title: "Otobüs Biletlerinde Hafta Sonu %10 İndirim!", categoryType: .bus, tag: [.bus], isUserCoupon: false),
        .init(image: "pro1", title: "Banka Kampanyalarıyla Daha Avantajlı Tatil", categoryType: .featured, tag: [.featured], isUserCoupon: false),
        .init(image: "pro2", title: "Burger King Tatil Kampanyası – Sınırlı Süre", categoryType: .featured, tag: [.featured], isUserCoupon: false),
        .init(image: "pro3", title: "Araç Kiralamada Ekim Ayına Özel İndirim", categoryType: .bus, tag: [.bus], isUserCoupon: false),
        .init(image: "pro4", title: "Goldcar Seçenekleri ile Ekstra Tasarruf", categoryType: .bus, tag: [.bus], isUserCoupon: false),
        .init(image: "pro0", title: "Uçak Biletlerinde Hafta İçi %5 İndirim", categoryType: .flight, tag: [.flight], isUserCoupon: false),
        .init(image: "pro1", title: "Banka Kampanyalarıyla Daha Avantajlı Tatil", categoryType: .featured, tag: [.featured], isUserCoupon: false),
        .init(image: "pro2", title: "Kahve ve Tatlı Siparişlerinde Ekstra İndirim", categoryType: .featured, tag: [.featured], isUserCoupon: false),
        .init(image: "pro3", title: "Araç Kiralamada Ekim Sonu Kampanyası", categoryType: .bus, tag: [.bus], isUserCoupon: false),
        .init(image: "pro4", title: "Goldcar ile Ekstra Tatil Fırsatları", categoryType: .bus, tag: [.bus], isUserCoupon: true)
    ]
}

enum PromotionCategoryType: CaseIterable, Identifiable {
    case all
    case mine

    func title(count: Int) -> String {
        switch self {
        case .all: return "Tüm Kampanyalar(\(count))"
        case .mine: return "Kupon Kazandıklarım(\(count))"
        }
    }

    var id: String {
        switch self {
        case .all: return "all"
        case .mine: return "mine"
        }
    }
}
