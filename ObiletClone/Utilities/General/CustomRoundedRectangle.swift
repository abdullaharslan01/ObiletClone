//
//  CustomRoundedRectangle.swift
//  ObiletClone
//
//  Created by abdullah on 14.09.2025.
//

import SwiftUI

struct TopRoundedRectangle: Shape {
    var radius: CGFloat = 20
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.size.width
        let height = rect.size.height
        let cornerRadius = min(radius, min(width/2, height/2))
        
        path.move(to: CGPoint(x: 0, y: cornerRadius))
        
        path.addQuadCurve(
            to: CGPoint(x: cornerRadius, y: 0),
            control: CGPoint(x: 0, y: 0)
        )
        
        path.addLine(to: CGPoint(x: width - cornerRadius, y: 0))
        
        path.addQuadCurve(
            to: CGPoint(x: width, y: cornerRadius),
            control: CGPoint(x: width, y: 0)
        )
        
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: cornerRadius))
        
        path.closeSubpath()
        return path
    }
}

extension View {
    func topRoundedBackground(radius: CGFloat = 20, color: Color = .white) -> some View {
        background(
            TopRoundedRectangle(radius: radius)
                .fill(color)
                .ignoresSafeArea()
        )
    }
}
