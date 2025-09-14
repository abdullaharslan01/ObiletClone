//
//  PromotionListView.swift
//  ObiletClone
//
//  Created by abdullah on 14.09.2025.
//

import SwiftUI

struct PromotionListView: View {
    let categories: [PromotionCategoryModel]

    var body: some View {
        VStack(spacing: 25) {
            ForEach(categories) { category in
                PromotionCardView(category: category)
            }
        }
    }
}
