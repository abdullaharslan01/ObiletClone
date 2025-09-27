//
//  PromotionViewModel.swift
//  ObiletClone
//
//  Created by abdullah on 27.09.2025.
//

import Foundation

class PromotionViewModel: ObservableObject {
    @Published var selectedCategory: PromotionCategoryType = .all
    @Published var selectedPromotion: PromotionCategory = .featured
    @Published var allPromotions: [PromotionCategoryModel] = PromotionCategoryModel.demo

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
}
