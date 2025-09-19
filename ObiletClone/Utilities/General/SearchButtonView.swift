//
//  SearchButtonView.swift
//  ObiletClone
//
//  Created by abdullah on 07.09.2025.
//

import SwiftUI

struct SearchButtonView: View {
    var title: String
    var isDisabled: Bool = false
    var maxWidth: CGFloat? = nil
    var horizontalPadding: CGFloat = 16
    var verticalPadding: CGFloat = 12
    var action: () -> Void
    
    var body: some View {
        Button {
            if !isDisabled {
                action()
            }
        } label: {
            Text(title)
                .padding(.vertical, verticalPadding)
                .padding(.horizontal, horizontalPadding)
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.oWhite)
                .frame(maxWidth: maxWidth)
                .background(isDisabled ? Color.oGray : Color.oGreen)
                .opacity(isDisabled ? 0.5 : 1)
                .clipShape(RoundedRectangle(cornerRadius: AppRadius.card))
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        SearchButtonView(title: "Otobüs Ara") {
            print("Button tapped!")
        }
        
        SearchButtonView(title: "Otobüs Ara", isDisabled: true) {}
        
        SearchButtonView(title: "Geniş Button", maxWidth: .infinity) {}
        
        SearchButtonView(title: "Özel Padding", horizontalPadding: 30, verticalPadding: 20) {}
    }
    .padding()
}
