//
//  NavigationButtonView.swift
//  ObiletClone
//
//  Created by abdullah on 18.09.2025.
//

import SwiftUI

enum IconPosition {
    case leading
    case trailing
}

struct NavigationButtonView: View {
    let text: String
    let icon: String
    var iconPosition: IconPosition = .leading
    var maxWidth: CGFloat? = nil
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            HStack {
                if iconPosition == .leading {
                    Image(systemName: icon)
                    Text(text)
                } else {
                    Text(text)
                    Image(systemName: icon)
                }
            }
            .padding(8)
            .frame(maxWidth: maxWidth)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.oWhite, lineWidth: 1)
            )
        }
        .foregroundColor(.oBackground)
    }
}
