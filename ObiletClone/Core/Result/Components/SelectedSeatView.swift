//
//  SelectedSeatView.swift
//  ObiletClone
//
//  Created by abdullah on 18.09.2025.
//

import SwiftUI

struct SelectedSeatView: View {
    var number: String
    var color: Color = .oBlue
    var size: CGFloat = 25
    var font: Font = .system(size: 12)
    var textColor: Color = .oWhite

    var body: some View {
        RoundedRectangle(cornerRadius: AppRadius.card)
            .fill(color)
            .frame(width: size, height: size)
            .overlay {
                Text(number)
                    .font(font)
                    .foregroundColor(textColor)
            }
    }
}
