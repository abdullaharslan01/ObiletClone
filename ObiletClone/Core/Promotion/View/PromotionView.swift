//
//  PromotionView.swift
//  ObiletClone
//
//  Created by abdullah on 14.09.2025.
//

import SwiftUI

struct PromotionView: View {
    @StateObject private var viewModel = PromotionViewModel()

    var body: some View {
        ZStack {
            Color.oMain.ignoresSafeArea()

            VStack(spacing: 0) {
                categoryTabSection
                promotionContentSection
            }
            .background(.oBackground)
            .topRoundedBackground(radius: 20, color: .oBackground)
        }
        .navigationTitle("Kampanyalar")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension PromotionView {
    var categoryTabSection: some View {
        CategoryTabView(
            selectedCategory: $viewModel.selectedCategory,
            allCount: viewModel.allCount,
            mineCount: viewModel.mineCount
        )
    }
    
    var promotionContentSection: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                filterBarSection
                promotionListSection
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea()
    }
    
    var filterBarSection: some View {
        PromotionFilterBar(selectedPromotion: $viewModel.selectedPromotion)
            .padding(.bottom)
    }
    
    var promotionListSection: some View {
        PromotionListView(categories: viewModel.filteredPromotions)
            .padding(.bottom)
    }
}

#Preview {
    NavigationView {
        PromotionView()
    }
}

