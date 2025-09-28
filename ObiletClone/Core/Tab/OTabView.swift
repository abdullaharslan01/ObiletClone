//
//  ObiletCloneApp.swift
//  ObiletClone
//
//  Created by abdullah on 06.09.2025.
//

import SwiftUI

struct OTabView: View {
    @State private var selectedTab: OTab = .search
    @EnvironmentObject var router: Router

    @State private var hideTabBar = false

    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.oTabBackground
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack(path: $router.homePath) {
                HomeView()

                    .tag(OTab.search)
                    .navigationDestination(for: Destination.self) { destination in
                        router.build(page: destination)
                    }
                    .sheet(item: $router.sheet) { sheet in
                        router.buildSheet(sheet: sheet)
                    }.toolbar(selectedTab == .search && hideTabBar ? .hidden : .visible, for: .tabBar)
                    .onAppear {
                        if selectedTab == .search {
                            hideTabBar = false
                        }
                    }
                    .onDisappear {
                        if selectedTab == .search {
                            hideTabBar = true
                        }
                    }
            }.tabItem {
                Image(systemName: OTab.search.symbol)
                Text(OTab.search.title)
            }

            MyTripsView()

                .tabItem {
                    Image(systemName: OTab.myTrips.symbol)
                    Text(OTab.myTrips.title)
                }
                .tag(OTab.myTrips)

            PromotionView()

                .tabItem {
                    Image(systemName: OTab.promotions.symbol)
                    Text(OTab.promotions.title)
                }
                .tag(OTab.promotions)

            HelpView()

                .tabItem {
                    Image(systemName: OTab.help.symbol)
                    Text(OTab.help.title)
                }
                .tag(OTab.help)

            AccountView()

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
