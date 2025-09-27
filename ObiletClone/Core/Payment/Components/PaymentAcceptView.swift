//
//  PaymentAcceptView.swift
//  ObiletClone
//
//  Created by abdullah on 27.09.2025.
//

import SwiftUI

struct PaymentAcceptView: View {
    @Binding var model: PaymentAcceptanceModel

    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top, spacing: 12) {
                Button(action: {
                    model.isTermsAccepted.toggle()
                }) {
                    Image(systemName: model.isTermsAccepted ? "checkmark.square.fill" : "square")
                        .font(.title2)
                        .foregroundColor(model.isTermsAccepted ? .oGreen : .oGray)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Group {
                        Text("**Ön Bilgilendirme Formu'nu, Mesafeli Satış Sözleşmesi'ni**") +
                            Text(" okudum ve onaylıyorum. Kişisel verilerin işlenmesine ilişkin ") +
                            Text("**Aydınlatma Metni'ni**") +
                            Text(" ve ") +
                            Text("**Çerez Politikası Metni'ni**") +
                            Text(" okudum. ") +
                            Text("**Kullanım Koşulları'nı kabul**") +
                            Text(" ediyorum.")
                    }
                    .font(.body)
                }

                Spacer()
            }
            .padding(.horizontal)

            HStack(alignment: .top, spacing: 12) {
                Button(action: {
                    model.isEasyCancellationAccepted.toggle()
                }) {
                    Image(systemName: model.isEasyCancellationAccepted ? AppIcons.checkMarkFill : AppIcons.square)
                        .font(.title2)
                        .foregroundColor(model.isEasyCancellationAccepted ? .oGreen : .oGray)
                }

                Text("Kolay İptal Hakkı (120 TL/1 Kişi)")
                    .font(.body)

                Spacer()
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(.top)
    }
}
