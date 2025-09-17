//
//  MainMenuType.swift
//  ObiletClone
//
//  Created by abdullah on 17.09.2025.
//

import Foundation

enum MainMenuType: String, CaseIterable {
    case travels = "Seyahatlerim"
    case promotions = "Kampanyalarım"
    case alarms = "Alarmlarım"
    case profile = "Profilim"
    case favorites = "Favorilerim"
    case help = "Yardım"
    case settings = "Ayarlar"
    case about = "Hakkımızda"
    
    var icon: String {
        switch self {
        case .travels: return AppIcons.travels
        case .promotions: return AppIcons.promotionsMenu
        case .alarms: return AppIcons.alarms
        case .profile: return AppIcons.profile
        case .favorites: return AppIcons.favorites
        case .help: return AppIcons.helpMenu
        case .settings: return AppIcons.settings
        case .about: return AppIcons.about
        }
    }
    
    var subMenuItems: [SubMenuType] {
        switch self {
        case .profile: return SubMenuType.allCases
        default: return []
        }
    }
}

enum SubMenuType: String, CaseIterable {
    case userInfo = "Kullanıcı Bilgilerim"
    case paymentInfo = "Ödeme Bilgilerim"
    case savedPassengers = "Kayıtlı Yolcularım"
    
    var icon: String {
        switch self {
        case .userInfo: return "person.text.rectangle"
        case .paymentInfo: return "creditcard.fill"
        case .savedPassengers: return "person.2.fill"
        }
    }
}

struct MenuItem: Identifiable {
    let id = UUID()
    let type: MainMenuType
    let title: String
    let icon: String
    let hasSubMenu: Bool
    let subMenuItems: [SubMenuItem]
    
    init(type: MainMenuType) {
        self.type = type
        self.title = type.rawValue
        self.icon = type.icon
        self.hasSubMenu = !type.subMenuItems.isEmpty
        self.subMenuItems = type.subMenuItems.map { SubMenuItem(type: $0) }
    }
}

struct SubMenuItem: Identifiable {
    let id = UUID()
    let type: SubMenuType
    let title: String
    let icon: String
    
    init(type: SubMenuType) {
        self.type = type
        self.title = type.rawValue
        self.icon = type.icon
    }
}

extension MenuItem {
    static let allMenuItems: [MenuItem] = MainMenuType.allCases.map { MenuItem(type: $0) }
}
