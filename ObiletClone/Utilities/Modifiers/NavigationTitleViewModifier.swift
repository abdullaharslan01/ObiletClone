//
//  NavigationTitleViewModifier.swift
//  ObiletClone
//
//  Created by abdullah on 14.09.2025.
//

import SwiftUI

struct NavigationTitleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25, weight: .semibold))
            .padding(.vertical)
            .foregroundStyle(.oWhite)
    }
}

extension View {
    func makeHeaderView() -> some View {
        self.modifier(NavigationTitleViewModifier())
    }
}
