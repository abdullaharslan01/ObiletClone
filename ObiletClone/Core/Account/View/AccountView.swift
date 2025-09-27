//
//  AccountView.swift
//  ObiletClone
//
//  Created by abdullah on 17.09.2025.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var viewModel = AccountViewModel()
    
    var body: some View {
        ZStack {
            Color.oBackground.ignoresSafeArea()
            
            VStack(spacing: 20) {
                userGreetingSection
                
                ScrollView {
                    VStack(spacing: 20) {
                        menuItemsCard
                        logoutCard
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                }
            }
        }
        .navigationTitle("Hesabım")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension AccountView {
    var userGreetingSection: some View {
        HStack {
            Text("Merhaba")
            Text(viewModel.userName)
                .fontWeight(.bold)
        }
        .foregroundStyle(.oBlack)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .padding(.top, 20)
    }
    
    var menuItemsCard: some View {
        VStack(spacing: 0) {
            ForEach(Array(viewModel.menuItems.enumerated()), id: \.element.id) { index, menuItem in
                menuItemRow(menuItem: menuItem, isLast: index == viewModel.menuItems.count - 1)
            }
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
    
    var logoutCard: some View {
        SingleMenuCard(icon: AppIcons.logout, title: "Çıkış Yap") {
            viewModel.handleLogout()
        }
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
    
    func menuItemRow(menuItem: MenuItem, isLast: Bool) -> some View {
        VStack(spacing: 0) {
            SingleMenuCard(icon: menuItem.icon, title: menuItem.title) {
                viewModel.handleMenuItemTap(menuItem)
            }
            
            if !isLast {
                Divider()
                    .opacity(0.55)
            }
        }
    }
}

#Preview {
    NavigationView {
        AccountView()
    }
}
