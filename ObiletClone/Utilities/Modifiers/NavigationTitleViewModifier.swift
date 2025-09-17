//
//  NavigationTitleViewModifier.swift
//  ObiletClone
//
//  Created by abdullah on 14.09.2025.
//

import SwiftUI

struct NavigationTitleViewModifier: ViewModifier {
    var font: Font = .system(size: 25, weight: .semibold)
    var verticalPadding: CGFloat = 16

    func body(content: Content) -> some View {
        content
            .font(font)
            .padding(.vertical, verticalPadding)
            .foregroundStyle(.oWhite)
    }
}

extension View {
    func makeHeaderView(font: Font = .system(size: 20, weight: .semibold),
                        verticalPadding: CGFloat = 16) -> some View
    {
        modifier(NavigationTitleViewModifier(font: font, verticalPadding: verticalPadding))
    }
}
