//
//  ObiletCloneApp.swift
//  ObiletClone
//
//  Created by abdullah on 06.09.2025.
//

import SwiftUI

@main
struct ObiletCloneApp: App {
    @StateObject private var router = Router()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(router)
        }
    }
}
