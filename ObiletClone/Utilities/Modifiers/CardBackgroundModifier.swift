//
//  CardBackgroundModifier.swift
//  ObiletClone
//
//  Created by abdullah on 07.09.2025.
//

import SwiftUI


struct CardBackgroundModifier: ViewModifier {
    var cornerRadius: CGFloat = 8
    var fill: Color = .oWhite
    var stroke: Color = .oGray
    var lineWidth: CGFloat = 0.5
    
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(fill)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(stroke, lineWidth: lineWidth)
                    )
            )
    }
}

extension View {
    func oCardBackground(cornerRadius: CGFloat = AppRadius.card,
                        fill: Color = .oWhite,
                        stroke: Color = .oGray,
                        lineWidth: CGFloat = 0.5) -> some View {
        self.modifier(
            CardBackgroundModifier(
                cornerRadius: cornerRadius,
                fill: fill,
                stroke: stroke,
                lineWidth: lineWidth
            )
        )
    }
}
