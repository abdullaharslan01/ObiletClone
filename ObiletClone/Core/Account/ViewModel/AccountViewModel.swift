//
//  AccountViewModel.swift
//  ObiletClone
//
//  Created by abdullah on 27.09.2025.
//

import Foundation

class AccountViewModel: ObservableObject {
    let userName: String = "Abdullah Arslan"
    let menuItems = MenuItem.allMenuItems

    func handleMenuItemTap(_ menuItem: MenuItem) {
        print("Tapped: \(menuItem.title)")
    }

    func handleLogout() {
        print("Logout tapped")
    }
}
