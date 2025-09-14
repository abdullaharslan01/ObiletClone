//
//  OLoadingView.swift
//  ObiletClone
//
//  Created by abdullah on 13.09.2025.
//

import SwiftUI

struct OLoadingView: View {
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(.oMain, lineWidth: 4)
                .frame(width: 40, height: 40)
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
                .onAppear {
                    isAnimating = true
                }
            
            Text("Seyahatleriniz yükleniyor...")
                .font(.system(size: 16))
                .foregroundStyle(.oGray)
        }
    }
}
