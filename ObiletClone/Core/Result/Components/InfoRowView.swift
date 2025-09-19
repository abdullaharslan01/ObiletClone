//
//  InfoRowView.swift
//  ObiletClone
//
//  Created by abdullah on 18.09.2025.
//

import SwiftUI

struct InfoRowView: View {
    let icon: String
    let iconColor: Color
    let text: String
    var font: Font = .system(size: 12)
    var textColor: Color = .oGray

    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            Image(systemName: icon)
                .foregroundStyle(iconColor)

            Text(text)
                .font(font)
                .foregroundColor(textColor)
                .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
