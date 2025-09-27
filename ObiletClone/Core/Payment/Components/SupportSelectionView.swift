//
//  SupportSelectionView.swift
//  ObiletClone
//
//  Created by abdullah on 26.09.2025.
//

import SwiftUI

enum SupportType: CaseIterable {
    case vip
    case standard

    var icon: String {
        switch self {
        case .vip:
            return AppIcons.check
        case .standard:
            return AppIcons.circleFill
        }
    }

    var color: Color {
        switch self {
        case .vip:
            return Color.oGreen
        case .standard:
            return Color.oGray.opacity(0.5)
        }
    }
    
    var iconSize: CGFloat {
        switch self {
        case .vip:
            return 20
        case .standard:
            return 10
        }
    }
    
    var title: String {
        switch self {
        case .vip:
            return "ÖNCELİKLİ VIP DESTEK"
        case .standard:
            return "Standart Destek"
        }
    }
    
    var price: String {
        switch self {
        case .vip:
            return "+37 TL"
        case .standard:
            return "Ücretsiz"
        }
    }
    
    var features: [String] {
        switch self {
        case .vip:
            return [
                "7/24 Canlı Destek",
                "Çağrı Merkezinde sıra beklemeden işlem",
                "Seferin 10 gün sonrasına kadar VIP hizmet",
                "Bilet iptal ve değişiminde öncelikli destek"
            ]
        case .standard:
            return [
                "7/24 Canlı Destek ve Çağrı Merkezi",
                "Bilet iptal ve değişimi"
            ]
        }
    }
}

struct SupportSelectionView: View {
    @Binding var selectedSupport: SupportType
    let onDetailsTapped: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text("ÖNCELİKLİ VIP DESTEK")
                    .foregroundStyle(.oWhite)
                    .font(.system(size: 20, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)

                Image(AppImages.badge)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 34)
                    .padding(5)
                    .overlay {
                        Circle()
                            .stroke(Color.oWhite, lineWidth: 2)
                    }
            }
            .padding(.top)
            .padding(.horizontal)

            VStack(spacing: 0) {
                ForEach(SupportType.allCases, id: \.self) { supportType in
                    SupportCardView(
                        supportType: supportType,
                        isSelected: selectedSupport == supportType,
                        onTap: {
                            selectedSupport = supportType
                        }
                    )
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
                
                Button {
                    onDetailsTapped()
                } label: {
                    Text("Detaylı Bilgi")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.oGray)
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .fill(.oGray)
                                .frame(height: 1)
                        }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
                .padding(.horizontal)
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: AppRadius.card))
            .padding(5)
        }
        .background(Color.oGreen)
        .clipShape(RoundedRectangle(cornerRadius: AppRadius.card))
    }
}

struct SupportCardView: View {
    let supportType: SupportType
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack {
                HStack {
                    if supportType == .vip {
                        HStack {
                            Image(systemName: AppIcons.crown)
                            Text(supportType.title)
                                .font(.system(size: 15, weight: .semibold))
                        }
                        .foregroundStyle(.oWhite)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 10)
                        .background(
                            RightCapsule()
                                .fill(.oGreen)
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    } else {
                        Text(supportType.title)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.oWhite)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 10)
                            .background(
                                RightCapsule()
                                    .fill(.oGray.opacity(0.6))
                            )
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    Text(supportType.price)
                        .foregroundStyle(.oGreen)
                }
                .padding(.top)

                HStack {
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(supportType.features, id: \.self) { feature in
                            SupportRowView(text: feature, supportType: supportType)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    
                    Circle()
                        .stroke(isSelected ? Color.black : Color.gray, lineWidth: 2)
                        .frame(height: 25)
                        .overlay {
                            if isSelected {
                                Image(systemName: AppIcons.circleFill)
                                    .foregroundStyle(.oGreen)
                                    .font(.system(size: 17))
                                    .padding(5)
                            }
                        }
                }
                .padding(.top)
            }
            .padding(.bottom)
            .padding(.trailing, 5)
            .background(
                RoundedRectangle(cornerRadius: AppRadius.card)
                    .stroke(
                        isSelected ? Color.black.opacity(0.5) : Color.oGray.opacity(0.3),
                        lineWidth: isSelected ? 2 : 1
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SupportRowView: View {
    let text: String
    let supportType: SupportType

    var body: some View {
        HStack {
            Image(systemName: supportType.icon)
                .foregroundStyle(supportType.color)
                .font(.system(size: supportType.iconSize, weight: .bold))

            Text(text)
                .foregroundStyle(.oBlack)
                .font(.system(size: 14))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct RightCapsule: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let radius = rect.height / 2

        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width - radius, y: 0))
        path.addArc(center: CGPoint(x: rect.width - radius, y: rect.height / 2),
                    radius: radius,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()

        return path
    }
}

