//
//  TransitCategoryView.swift
//  ObiletClone
//
//  Created by abdullah on 07.09.2025.
//

import SwiftUI


struct TransitCategoryView: View {
    @Binding var selectedCategory: TransitCategory
    @Namespace var animation

    var body: some View {
        HStack {
            ForEach(TransitCategory.allCases) { category in
                categoryButton(for: category)
            }
        }
        .padding(.horizontal, 3)
        .padding(.vertical, 3)
        .oCardBackground()
    }
}

extension TransitCategoryView {
    @ViewBuilder
    private func categoryButton(for category: TransitCategory) -> some View {
        Button {
            withAnimation(.bouncy) {
                selectedCategory = category
            }
        } label: {
            VStack(spacing: 8) {
                Image(systemName: category.symbol)
                    .font(.title3)
                    .foregroundStyle(category == selectedCategory ? .oBackground : .oGray)

                Text(category.title)
                    .foregroundStyle(category == selectedCategory ? .oWhite : .oGray)
                    .font(.system(size: 12))
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 5)
            .padding(.vertical, 5)
            .background(
                ZStack {
                    if category == selectedCategory {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.oMain)
                            .matchedGeometryEffect(id: "category", in: animation)
                    }
                }
            )
        }
    }
}

#Preview {
    TransitCategoryView(selectedCategory: .constant(.bus))
        .padding()
}
