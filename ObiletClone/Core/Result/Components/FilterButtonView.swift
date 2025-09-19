//
//  FilterButtonView.swift
//  ObiletClone
//
//  Created by abdullah on 18.09.2025.
//

import SwiftUI

struct FilterButtonView: View {
    @State private var onTapped: Bool = false
    let text: String
    var icon: String?
    var filledBackground: Bool
    var withActionBorder: Bool
    let withUpperCase: Bool
    var font: Font
    var action: () -> Void

    init(
        text: String,
        icon: String? = nil,
        filledBackground: Bool = false,
        withActionBorder: Bool = true,
        withUpperCase: Bool = false,
        font: Font = .system(size: 16, weight: .bold),
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.icon = icon
        self.filledBackground = filledBackground
        self.withActionBorder = withActionBorder
        self.withUpperCase = withUpperCase
        self.font = font
        self.action = action
    }

    var body: some View {
        Button(action: {
            if withActionBorder {
                onTapped.toggle()
            }
            action()
        }) {
            HStack(spacing: 6) {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.oWhite)
                        .frame(width: 24, height: 24)
                }

                Text(withUpperCase ? text.uppercased() : text)
                    .font(font)
                    .foregroundColor(
                        filledBackground ? .oWhite :
                        (withActionBorder && onTapped ? .oMain : Color.oGray)
                    )
            }
            .padding(.vertical, 6)
            .padding(.horizontal, 10)
            .background(filledBackground ? Color.oMain : Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: AppRadius.card)
                    .stroke(
                        filledBackground ? Color.oWhite :
                        (withActionBorder && onTapped ? Color.oMain : Color.oGray),
                        lineWidth: 1
                    )
            )
            .clipShape(RoundedRectangle(cornerRadius: AppRadius.card))
        }
        .animation(.easeInOut(duration: 0.2), value: onTapped)
    }
}
