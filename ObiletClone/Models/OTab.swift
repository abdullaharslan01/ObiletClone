//
//  OTab.swift
//  ObiletClone
//
//  Created by abdullah on 06.09.2025.
//

import SwiftUI

enum OTab: String, Identifiable {
    case search
    case myTrips
    case promotions
    case help
    case account

    var id: String { rawValue }

    var title: String {
        switch self {
        case .search: return "Ara"
        case .myTrips: return "Seyehatlerim"
        case .promotions: return "Kampanyalar"
        case .help: return "Yardım"
        case .account: return "Hesabım"
        }
    }

    var symbol: String {
        switch self {
        case .search: return AppIcons.search
        case .myTrips: return AppIcons.myTrips
        case .promotions: return AppIcons.promotions
        case .help: return AppIcons.help
        case .account: return AppIcons.account
        }
    }
}
