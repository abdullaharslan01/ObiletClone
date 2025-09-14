//
//  CategoryTabView.swift
//  ObiletClone
//
//  Created by abdullah on 14.09.2025.
//

import SwiftUI

struct CategoryTabView: View {
    @Binding var selectedCategory: PromotionCategoryType
    let allCount: Int
    let mineCount: Int

    private func getCount(for category: PromotionCategoryType) -> Int {
        switch category {
        case .all: return allCount
        case .mine: return mineCount
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(PromotionCategoryType.allCases) { category in
                    Button {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            selectedCategory = category
                        }
                    } label: {
                        Text(category.title(count: getCount(for: category)))
                            .font(.system(size: 16))
                            .foregroundStyle(selectedCategory == category ? .oMain : .oGray)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                    }
                    .buttonStyle(.plain)
                }
            }
            
            HStack(spacing: 0) {
                ForEach(PromotionCategoryType.allCases) { category in
                    Rectangle()
                        .frame(height: 3)
                        .foregroundStyle(selectedCategory == category ? .oMain : .clear)
                        .frame(maxWidth: .infinity)
                }
            }
            .animation(.easeInOut(duration: 0.25), value: selectedCategory)
        }
        .padding(.top)
    }
}
