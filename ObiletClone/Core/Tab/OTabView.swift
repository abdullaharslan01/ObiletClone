//
//  ObiletCloneApp.swift
//  ObiletClone
//
//  Created by abdullah on 06.09.2025.
//

import SwiftUI

struct OTabView: View {
    @State private var selectedTab: OTab = .search

    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.oTabBackground
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView(content: {
                HomeView()
            })

            .tabItem {
                Image(systemName: OTab.search.symbol)
                Text(OTab.search.title)
            }
            .tag(OTab.search)

            NavigationView(content: {
                MyTripsView()
            })

            .tabItem {
                Image(systemName: OTab.myTrips.symbol)
                Text(OTab.myTrips.title)
            }
            .tag(OTab.myTrips)

            NavigationView(content: {
                PromotionView()
            })

            .tabItem {
                Image(systemName: OTab.promotions.symbol)
                Text(OTab.promotions.title)
            }
            .tag(OTab.promotions)

            NavigationView(content: {
                HelpView()
            })

            .tabItem {
                Image(systemName: OTab.help.symbol)
                Text(OTab.help.title)
            }
            .tag(OTab.help)

            NavigationView {
                AccountView()
            }

            .tabItem {
                Image(systemName: OTab.account.symbol)
                Text(OTab.account.title)
            }
            .tag(OTab.account)
        }
        .tint(.oMain)
    }
}

#Preview {
    OTabView()
        .environment(\.locale, Locale(identifier: "en"))
}
