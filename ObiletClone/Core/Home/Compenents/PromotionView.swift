//
//  PromotionView.swift
//  ObiletClone
//
//  Created by abdullah on 09.09.2025.
//

import SwiftUI

struct PromotionView: View {
    let promotions: [PromotionCategory: [Promotion]]
    
    @State private var selectedCategory: PromotionCategory = .featured
    @State private var currentIndex = 0
    
    init(promotions: [PromotionCategory: [Promotion]]) {
        self.promotions = promotions
    }
    
    var body: some View {
        VStack(spacing: 16) {
            headerView
            
            categoryButtons
            
            promotionCards
            
            pageIndicator
        }
        .onChange(of: selectedCategory) { _ in
            currentIndex = 0
        }
    }
}

extension PromotionView {
    
    private var headerView: some View {
        Text("Obilet'e özel fırsatlar")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(.oGray)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var categoryButtons: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(PromotionCategory.allCases) { category in
                    CategoryButton(
                        category: category,
                        isSelected: category == selectedCategory
                    ) {
                        selectCategory(category)
                    }
                }
            }
        }
    }
    
    private var promotionCards: some View {
        TabView(selection: $currentIndex) {
            ForEach(Array(currentPromotions.enumerated()), id: \.element.id) { index, promotion in
                PromotionCard(promotion: promotion, category: selectedCategory)
                    .tag(index)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: 200)
    }
    
    private var pageIndicator: some View {
        HStack(spacing: 8) {
            ForEach(0..<currentPromotions.count, id: \.self) { index in
                PageDot(isActive: index == currentIndex)
            }
        }
        .padding(.top, 8)
    }
}

extension PromotionView {
    
    private var currentPromotions: [Promotion] {
        return promotions[selectedCategory] ?? []
    }
    
    private func selectCategory(_ category: PromotionCategory) {
        withAnimation(.spring()) {
            selectedCategory = category
            currentIndex = 0
        }
    }
}

struct CategoryButton: View {
    let category: PromotionCategory
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(category.title)
                .font(.caption)
                .fontWeight(isSelected ? .semibold : .regular)
                .foregroundColor(isSelected ? .oMain : .oGray)
                .padding(.vertical, 8)
                .padding(.horizontal, 14)
                .background(backgroundColor)
                .overlay(borderOverlay)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
    
    private var backgroundColor: Color {
        isSelected ? Color.oMain.opacity(0.15) : Color.clear
    }
    
    private var borderOverlay: some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(
                isSelected ? Color.oMain : Color.gray.opacity(0.5),
                lineWidth: 1
            )
    }
}

struct PromotionCard: View {
    let promotion: Promotion
    let category: PromotionCategory
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            cardHeader
            
            cardContent
            
            cardFooter
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 2)
        .frame(width: UIScreen.main.bounds.width - 60)
    }
}

extension PromotionCard {
    
    private var cardHeader: some View {
        HStack {
            CategoryTag(category: category)
            Spacer()
            Button {
                
            } label: {
                Image(systemName: AppIcons.infoCircle)
                    .foregroundColor(.gray)
                    .font(.system(size: 20,weight: .bold))
            }

        }
    }
    
    private var cardContent: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8) {
                DiscountView(discount: promotion.discount)
                
                Text(promotion.title)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            CategoryIcon(category: category, discount: promotion.discount)
        }
    }
    
    private var cardFooter: some View {
        Text(promotion.endDate)
            .font(.caption)
            .foregroundColor(.secondary)
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

struct CategoryTag: View {
    let category: PromotionCategory
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: category.icon)
                .font(.caption2)
                .foregroundStyle(.oMain)
            Text(category.title)
                .font(.caption2)
                .foregroundStyle(.oGray)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color.oGray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

struct DiscountView: View {
    let discount: Discount
    
    var body: some View {
        HStack(spacing: 5) {
            Text(discount.displayText)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.oMain)
            
            VStack(alignment: .leading) {
                Text("net")
                Text("indirim!")
            }
            .font(.system(size: 15,weight: .bold))
            .foregroundColor(.oMain)
        }
    }
}

struct CategoryIcon: View {
    let category: PromotionCategory
    let discount: Discount
    
    var body: some View {
        ZStack {
            Image(systemName: category.icon)
                .font(.largeTitle)
                .foregroundColor(.gray.opacity(0.3))
            
            VStack {
                HStack {
                    Spacer()
                    Text(discount.displayText)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.oMain)
                        .clipShape(Capsule())
                }
                Spacer()
            }
        }
        .frame(width: 60, height: 60)
    }
}

struct PageDot: View {
    let isActive: Bool
    
    var body: some View {
        Capsule()
            .fill(isActive ? Color.gray : Color.gray.opacity(0.3))
            .frame(width: isActive ? 24 : 8, height: 8)
            .animation(.spring(), value: isActive)
    }
}

extension PromotionCategory {
    var icon: String {
        switch self {
        case .featured: return AppIcons.star
        case .bus: return  AppIcons.bus
        case .flight: return AppIcons.plane
        case .hotel: return AppIcons.hotel
        case .ferry: return AppIcons.ferry
        }
    }
}

// MARK: - Usage Example
#Preview {
    let samplePromotions: [PromotionCategory: [Promotion]] = [
        .featured: [
            Promotion(
                title: "Sonbahar Tatil Fırsatları",
                discount: .percentage(35),
                endDate: "15 Kasım'a kadar",
                detail: "Tatil paketlerinde indirim"
            ),
            Promotion(
                title: "Erken Rezervasyon Kampanyası",
                discount: .amount(1000),
                endDate: "31 Mart'a kadar",
                detail: "Otel rezervasyonlarında tasarruf"
            ),
            Promotion(
                title: "Araç Kiralama İndirimi",
                discount: .percentage(20),
                endDate: "30 Eylül'e kadar",
                detail: "Günlük kiralama seçenekleri"
            )
        ],
        .bus: [
            Promotion(
                title: "Otobüs Biletlerinde İndirim",
                discount: .percentage(25),
                endDate: "20 Ekim'e kadar",
                detail: "Şehirlerarası seyahatlerde"
            )
        ],
        .flight: [
            Promotion(
                title: "Uçak Biletlerinde Fırsat",
                discount: .amount(500),
                endDate: "31 Aralık'a kadar",
                detail: "Yurtiçi uçuşlarda"
            )
        ],
        .hotel: [
            Promotion(
                title: "Otel Rezervasyonlarında İndirim",
                discount: .percentage(40),
                endDate: "15 Kasım'a kadar",
                detail: "Seçili otellerde geçerli"
            )
        ],
        .ferry: [
            Promotion(
                title: "Feribot Biletlerinde İndirim",
                discount: .percentage(15),
                endDate: "30 Eylül'e kadar",
                detail: "Ada seyahatleri için"
            )
        ]
    ]
    
    PromotionView(promotions: samplePromotions)
        .padding()
}
