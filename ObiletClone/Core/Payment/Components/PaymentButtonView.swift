//
//  PaymentButtonView.swift
//  ObiletClone
//
//  Created by abdullah on 27.09.2025.
//

import SwiftUI

struct PaymentButtonView: View {
    let amount: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 0) {
                Image(AppImages.shield)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 45)
                    .padding(.horizontal)

                Spacer()
                VStack(alignment: .center, spacing: 2) {
                    Text(amount)
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(.oWhite)

                    Text("Güvenli Ödeme Yap")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.oWhite)
                }

                Spacer()
                Image(systemName: AppIcons.chevronRight)
                    .font(.system(size: 25))
                    .foregroundColor(.oWhite)
                    .frame(width: 50)
                    .frame(maxHeight: .infinity)
                    .background(.oDarkGreen)
            }
            .frame(height: 65)
            .background(.oLightGreen)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

#Preview {
    PaymentButtonView(amount: "1.200 TL") {
        print("Ödeme butonuna tıklandı")
    }
    .padding()
}
