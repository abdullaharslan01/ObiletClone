//
//  PromotionView.swift
//  ObiletClone
//
//  Created by abdullah on 14.09.2025.
//

import SwiftUI

struct PromotionView: View {
    @State private var selectedCategory: PromotionCategoryType = .all
    @State private var selectedPromotion: PromotionCategory = .featured
    @State var allPromotions: [PromotionCategoryModel] = PromotionCategoryModel.demo

    var filteredPromotions: [PromotionCategoryModel] {
        let categoryFiltered = selectedCategory == .all ?
            allPromotions : allPromotions.filter { $0.isUserCoupon }

        if selectedPromotion == .featured {
            return categoryFiltered
        }

        return categoryFiltered.filter { promotion in
            promotion.categoryType == selectedPromotion ||
                promotion.tag.contains(selectedPromotion)
        }
    }

    var allCount: Int {
        allPromotions.count
    }

    var mineCount: Int {
        allPromotions.filter { $0.isUserCoupon }.count
    }

    var body: some View {
        ZStack {
            Color.oMain.ignoresSafeArea()

            VStack(spacing: 0) {
                CategoryTabView(
                    selectedCategory: $selectedCategory,
                    allCount: allCount,
                    mineCount: mineCount
                )

                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        PromotionFilterBar(
                            selectedPromotion: $selectedPromotion
                        ).padding(.bottom)

                        PromotionListView(categories: filteredPromotions)
                            .padding(.bottom)
                    }
                    .padding(.horizontal)
                }
                .ignoresSafeArea()
            }
            .background(.oBackground)
            .topRoundedBackground(radius: 20, color: .oBackground)
        }
        .navigationTitle("Kampanyalar")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        PromotionView()
    }
}
