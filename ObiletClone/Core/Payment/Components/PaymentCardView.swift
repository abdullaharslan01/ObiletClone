//
//  PaymentCardView.swift
//  ObiletClone
//
//  Created by abdullah on 23.09.2025.
//

import SwiftUI

struct PaymentCardView<Content: View>: View {
    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack {
            content
                .padding()
                .padding(.top)
        }
        .overlay {
            RoundedRectangle(cornerRadius: AppRadius.card)
                .stroke(Color.oGray.opacity(0.3), lineWidth: 1)
                .overlay(alignment: .top) {
                    Text(title)
                        .foregroundStyle(.oWhite)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(10)
                        .background(Color.oMain)
                        .clipShape(RoundedRectangle(cornerRadius: AppRadius.card))
                        .offset(y: -18)
                }
        }
    }
}
