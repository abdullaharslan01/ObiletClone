//
//  PromotionCardView.swift
//  ObiletClone
//
//  Created by abdullah on 14.09.2025.
//

import SwiftUI

struct PromotionCardView: View {
    let category: PromotionCategoryModel

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 16) {
                PromotionImageView(imageName: category.image)

                VStack(spacing: 12) {
                    PromotionTagsView(tags: category.tag)

                    PromotionTitleView(title: category.title)

                    Rectangle()
                        .fill(.oGray.opacity(0.3))
                        .frame(height: 1)
                        .padding(.vertical)

                    PromotionInfoView()
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(
                color: .black.opacity(0.06),
                radius: 8,
                x: 0,
                y: 2
            )
        }
    }
}

struct PromotionImageView: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(height: 180)
            .clipped()
    }
}

struct PromotionTagsView: View {
    let tags: [PromotionCategory]

    var body: some View {
        HStack {
            ForEach(tags, id: \.self) { tag in
                CategoryTag(category: tag)
            }
            Spacer()
        }
    }
}

struct PromotionTitleView: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.oBlack)
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
}

struct PromotionInfoView: View {
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: AppIcons.infoCircle)
                .foregroundColor(.oGray)
                .font(.system(size: 14))

            Button {} label: {
                Text("İndirim kodunu nasıl kullanabilirim?")
                    .font(.system(size: 14))
                    .foregroundColor(.oGray)
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .fill(.oGray.opacity(0.3))
                            .frame(height: 1)
                            .offset(y: 2)
                    }
            }

            Spacer()
        }
    }
}
