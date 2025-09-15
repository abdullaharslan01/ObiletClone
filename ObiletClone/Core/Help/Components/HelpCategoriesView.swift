//
//  HelpCategoriesView.swift
//  ObiletClone
//
//  Created by abdullah on 15.09.2025.
//

import SwiftUI

struct HelpCategoriesView: View {
    @Binding var currentLink: String
    @Binding var expandedCategories: Set<UUID>

    var body: some View {
        VStack {
            ForEach(HelpData.categories) { helpCategory in
                HelpCategoryCard(
                    category: helpCategory,
                    currentLink: $currentLink,
                    expandedCategories: $expandedCategories
                )
                .padding(.top)
                .padding(.horizontal)
            }
        }
    }
}

struct HelpCategoryCard: View {
    let category: HelpCategory
    @Binding var currentLink: String
    @Binding var expandedCategories: Set<UUID>

    private var isExpanded: Bool {
        expandedCategories.contains(category.id)
    }

    var body: some View {
        VStack {
            CategoryHeaderButton(
                category: category,
                isExpanded: isExpanded,
                onToggle: toggleCategory
            )

            if isExpanded {
                CategoryTopicsList(
                    topics: category.topics,
                    currentLink: $currentLink
                )
            }
        }
    }

    private func toggleCategory() {
        withAnimation(.bouncy) {
            if isExpanded {
                expandedCategories.remove(category.id)
            } else {
                expandedCategories.insert(category.id)
            }
        }
    }
}

struct CategoryHeaderButton: View {
    let category: HelpCategory
    let isExpanded: Bool
    let onToggle: () -> Void

    var body: some View {
        Button(action: onToggle) {
            HStack {
                HStack(spacing: 15) {
                    Image(category.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)

                    Text(category.title)
                        .foregroundStyle(.oGray)
                        .font(.system(size: 16, weight: .semibold))
                }.frame(maxWidth: .infinity, alignment: .leading)

                Image(systemName: AppIcons.chevronRight)
                    .foregroundStyle(.oGray)
                    .font(.system(size: 20, weight: .semibold))
                    .rotationEffect(.degrees(isExpanded ? 90 : 0))
            }
            .padding()
            .background(.oWhite)
            .clipShape(RoundedRectangle(cornerRadius: AppRadius.card))
            .shadow(color: .oBlack.opacity(0.1), radius: 1, y: 5)
        }
    }
}

struct CategoryTopicsList: View {
    let topics: [HelpTopic]
    @Binding var currentLink: String

    var body: some View {
        LazyVStack {
            ForEach(topics) { topic in
                TopicButton(
                    topic: topic,
                    currentLink: $currentLink
                )
            }
        }
    }
}

struct TopicButton: View {
    let topic: HelpTopic
    @Binding var currentLink: String

    var body: some View {
        Button {
            currentLink = topic.link
        } label: {
            HStack {
                Text(topic.title)
                    .foregroundStyle(.oGray)
                    .font(.system(size: 14, weight: .regular))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, 5)

                Image(systemName: AppIcons.chevronRight)
                    .foregroundStyle(.oGray)
                    .font(.system(size: 20, weight: .semibold))
            }
            .padding()
            .background(.oWhite)
            .clipShape(RoundedRectangle(cornerRadius: AppRadius.card))
            .shadow(color: .oBlack.opacity(0.1), radius: 1, y: 5)
            .padding(.horizontal)
        }
    }
}
