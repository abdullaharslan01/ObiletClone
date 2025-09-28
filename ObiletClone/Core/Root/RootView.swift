//
//  RootView.swift
//  ObiletClone
//
//  Created by abdullah on 06.09.2025.
//

import SwiftUI

struct RootView: View {
    
    init() {
        UIScrollView.appearance().bounces = false

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()

        if let navBarColor = UIColor(named: "oMain") {
            appearance.backgroundColor = navBarColor
        }

        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "oWhite") ?? .white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "oWhite") ?? .white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    
    @State var router = Router()
    
    var body: some View {
        OTabView()
            .environmentObject(router)
    }
}

#Preview {
    RootView()
}
