//
//  PromotionFilterBar.swift
//  ObiletClone
//
//  Created by abdullah on 14.09.2025.
//

import SwiftUI

struct PromotionFilterBar: View {
    @Binding var selectedPromotion: PromotionCategory

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(PromotionCategory.allCases) { category in
                    CategoryButton(
                        categoryType: .promotion,
                        category: category,
                        isSelected: category == selectedPromotion
                    ) {
                        selectedPromotion = category
                    }
                }
            }
            .padding(.top)
        }
    }
}
