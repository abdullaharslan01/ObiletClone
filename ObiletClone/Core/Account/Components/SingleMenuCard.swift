//
//  SingleMenuCard.swift
//  ObiletClone
//
//  Created by abdullah on 17.09.2025.
//

import SwiftUI

struct SingleMenuCard: View {
    let icon: String
    let title: String
    let titleColor: Color
    let action: () -> Void
    
    init(icon: String, title: String, titleColor: Color = .oBlack, action: @escaping () -> Void = {}) {
        self.icon = icon
        self.title = title
        self.titleColor = titleColor
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                HStack(spacing: 12) {
                    Image(systemName: icon)
                        .font(.system(size: 20, weight: .medium))
                        .frame(width: 24, height: 24)
                    
                    Text(title)
                        .font(.system(size: 16, weight: .medium))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: AppIcons.chevronRight)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.gray)
            }
            .foregroundStyle(titleColor)
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}
