//
//  TripCategoryView.swift
//  ObiletClone
//
//  Created by abdullah on 13.09.2025.
//

import SwiftUI

struct TripCategoryView: View {
    @Binding var selectedCategory: TransitCategory
    @Namespace private var underlineNamespace
    let onFerryTapped: () -> Void

    var body: some View {
        HStack(spacing: 0) {
            ForEach(TransitCategory.allCases) { category in
                Button {
                    if category == .ferry {
                        onFerryTapped()
                    } else {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                            selectedCategory = category
                        }
                    }
                } label: {
                    VStack(spacing: 8) {
                        Text(category.title)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(selectedCategory == category ? .oMain : .oGray)
                            .animation(.easeInOut(duration: 0.2), value: selectedCategory)

                        ZStack {
                            Rectangle()
                                .frame(height: 2)
                                .foregroundStyle(.clear)

                            if selectedCategory == category && category != .ferry {
                                Rectangle()
                                    .frame(height: 3)
                                    .foregroundStyle(.oMain)
                                    .matchedGeometryEffect(
                                        id: "underline",
                                        in: underlineNamespace
                                    )
                                    .shadow(color: .oMain.opacity(0.3), radius: 2, x: 0, y: 1)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 40)
        .padding(.bottom, 8)
        .padding(.top)
        .background(.oBackground)
    }
}

