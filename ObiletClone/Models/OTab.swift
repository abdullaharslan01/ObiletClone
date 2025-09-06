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

    var title: LocalizedStringKey {
        switch self {
        case .search: return LocaleKeys.Tab.search.rawValue
        case .myTrips: return LocaleKeys.Tab.myTrips.rawValue
        case .promotions: return LocaleKeys.Tab.promotions.rawValue
        case .help: return LocaleKeys.Tab.help.rawValue
        case .account: return LocaleKeys.Tab.account.rawValue
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
