//
//  SeatStatusItemView.swift
//  ObiletClone
//
//  Created by abdullah on 18.09.2025.
//

import SwiftUI


struct SeatStatusItemView: View {
    var color: Color? = nil
    var isStroked: Bool = false   
    var text: String
    var textColor: Color = .oGray
    var rectangleSize: CGFloat = 20

    var body: some View {
        HStack(spacing: 6) {
            if let color = color {
                RoundedRectangle(cornerRadius: AppRadius.card)
                    .fill(color)
                    .frame(width: rectangleSize, height: rectangleSize)
            } else if isStroked {
                RoundedRectangle(cornerRadius: AppRadius.card)
                    .stroke(textColor, lineWidth: 1)
                    .frame(width: rectangleSize, height: rectangleSize)
            }

            Text(text)
                .foregroundColor(textColor)
                .font(.system(size: 12))
        }
        .frame(maxWidth: .infinity)
    }
}
