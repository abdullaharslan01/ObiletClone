//
//  TransitCategory.swift
//  ObiletClone
//
//  Created by abdullah on 07.09.2025.
//

import Foundation

enum TransitCategory: CaseIterable, Identifiable {
    case bus
    case plane
    case hotel
    case car
    case ferry

    var id: Self { self }

    var title: String {
        switch self {
        case .bus: return "Otobüs"
        case .plane: return "Uçak"
        case .hotel: return "Otel"
        case .car: return "Araç"
        case .ferry: return "Feribot"
        }
    }

    var symbol: String {
        switch self {
        case .bus: return AppIcons.bus
        case .plane: return AppIcons.plane
        case .hotel: return AppIcons.hotel
        case .car: return AppIcons.car
        case .ferry: return AppIcons.ferry
        }
    }

    var logTitle: String {
        switch self {
        case .bus: return "GELECEK TARİHLİ BİLETLERİM"
        case .plane: return "GELECEK TARİHLİ BİLETLERİM"
        case .hotel: return "GELECEK TARİHLİ REZARVASYONLARIM"
        case .car: return "GELECEK TARİHLİ REZARVASYONLARIM"
        case .ferry: return ""
        }
    }

    var emtyText: String {
        switch self {
        case .bus: return "Satın alınmış otobüs biletiniz bulunmamaktadır."
        case .plane: return "Satın alınmış uçuk biletiniz bulunmamaktadır."
        case .hotel: return "Rezarvasyonunuz bulunmamaktadır."
        case .car: return "Rezarvasyonunuz bulunmamaktadır."
        case .ferry: return ""
        }
    }
}
