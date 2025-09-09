//
//  Promotion.swift
//  ObiletClone
//
//  Created by abdullah on 09.09.2025.
//

import Foundation

struct Promotion: Identifiable {
    let id = UUID()
    let title: String
    let discount: Discount
    let endDate: String
    let detail: String
}

enum Discount {
    case percentage(Int)
    case amount(Int)
    
    var displayText: String {
        switch self {
        case .percentage(let value):
            return "%\(value)"
        case .amount(let value):
            return value >= 1000 ? "\(value/1000)K₺" : "\(value)₺"
        }
    }
}

enum PromotionCategory: String, CaseIterable, Identifiable {
    case featured = "featured"
    case bus = "bus"
    case flight = "flight"
    case hotel = "hotel"
    case ferry = "ferry"
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .featured: return "Öne Çıkan"
        case .bus: return "Otobüs"
        case .flight: return "Uçak"
        case .hotel: return "Otel"
        case .ferry: return "Feribot"
        }
    }
}

extension Promotion {
    
    static let featured: [Promotion] = [
        Promotion(
            title: "Sonbahar Tatil Fırsatları",
            discount: .percentage(35),
            endDate: "15 Kasım'a kadar",
            detail: "Tatil paketlerinde indirim"
        ),
        Promotion(
            title: "Erken Rezervasyon Kampanyası",
            discount: .amount(1000),
            endDate: "31 Mart'a kadar",
            detail: "Otel rezervasyonlarında tasarruf"
        ),
        Promotion(
            title: "Araç Kiralama İndirimi",
            discount: .percentage(20),
            endDate: "30 Eylül'e kadar",
            detail: "Günlük kiralama seçenekleri"
        )
    ]
    
    static let bus: [Promotion] = [
        Promotion(
            title: "Otobüs Yolculuklarında İndirim",
            discount: .percentage(10),
            endDate: "15 Ekim'e kadar",
            detail: "Şehirlerarası seferlerde"
        ),
        Promotion(
            title: "Öğrenci Bilet İndirimi",
            discount: .percentage(12),
            endDate: "31 Aralık'a kadar",
            detail: "Öğrenci belgesi ile"
        ),
        Promotion(
            title: "Hafta Sonu Özel Kampanya",
            discount: .percentage(15),
            endDate: "Her hafta Pazar'a kadar",
            detail: "Hafta sonu seferlerinde geçerli"
        ),
        Promotion(
            title: "Erken Rezervasyon İndirimi",
            discount: .percentage(20),
            endDate: "30 Eylül'e kadar",
            detail: "Sefer tarihinden 2 hafta önce alınan biletler"
        ),
        Promotion(
            title: "Grup Biletlerinde Avantaj",
            discount: .percentage(18),
            endDate: "31 Aralık'a kadar",
            detail: "5 kişi ve üzeri grup biletleri için"
        ),
        Promotion(
            title: "Akşam Seferi İndirimi",
            discount: .percentage(8),
            endDate: "Her gün",
            detail: "19:00 sonrası seferlerde geçerli"
        ),
        Promotion(
            title: "Bayram Özel Kampanyası",
            discount: .percentage(25),
            endDate: "20 Ekim'e kadar",
            detail: "Bayram dönemindeki tüm otobüs seferlerinde"
        )
    ]
    
    static let flight: [Promotion] = [
        Promotion(
            title: "Son Dakika Uçak Bileti",
            discount: .percentage(20),
            endDate: "5 Ekim'e kadar",
            detail: "48 saat öncesi rezervasyon"
        ),
        Promotion(
            title: "Yurt Dışı Uçuş Kampanyası",
            discount: .amount(750),
            endDate: "31 Aralık'a kadar",
            detail: "Avrupa destinasyonları"
        )
    ]
    
    static let hotel: [Promotion] = [
        Promotion(
            title: "Otel Bahar İndirimi",
            discount: .percentage(30),
            endDate: "1 Mayıs'a kadar",
            detail: "3 gece ve üzeri"
        ),
        Promotion(
            title: "Balayı Özel Fırsatı",
            discount: .amount(1500),
            endDate: "31 Aralık'a kadar",
            detail: "Romantik tatil paketleri"
        )
    ]
    
    static let ferry: [Promotion] = [
        Promotion(
            title: "Yunan Adaları Feribot",
            discount: .percentage(15),
            endDate: "31 Aralık'a kadar",
            detail: "Çeşme-Sakız arası"
        ),
        Promotion(
            title: "Hafta Sonu Feribot",
            discount: .percentage(20),
            endDate: "5 Ekim'e kadar",
            detail: "Cumartesi-Pazar seferleri"
        )
    ]
}
