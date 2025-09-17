//
//  HelpView.swift
//  ObiletClone
//
//  Created by abdullah on 15.09.2025.
//

import SwiftUI

struct HelpView: View {
    @State private var searchText: String = ""
    @State private var currentLink: String = ""
    @State private var expandedCategories: Set<UUID> = []

    var body: some View {
        ZStack {
            Color.oMain.ignoresSafeArea()

            VStack {
                HelpHeaderView(currentLink: $currentLink)

                if !currentLink.isEmpty {
                    SafariWebView(currentLink: currentLink)
                } else {
                    MainContentView(
                        searchText: $searchText,
                        currentLink: $currentLink,
                        expandedCategories: $expandedCategories
                    )
                }
            }
        }
    }
}

struct MainContentView: View {
    @Binding var searchText: String
    @Binding var currentLink: String
    @Binding var expandedCategories: Set<UUID>

    var body: some View {
        ScrollView {
            SearchHeaderView(searchText: $searchText)

            HelpCategoriesView(
                currentLink: $currentLink,
                expandedCategories: $expandedCategories
            )

            CompanyInfoView()
        }
        .background(Color.oHelpBackground)
    }
}

#Preview {
    NavigationView {
        HelpView()

    }
}
