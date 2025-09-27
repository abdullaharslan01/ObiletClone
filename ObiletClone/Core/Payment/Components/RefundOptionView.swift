//
//  RefundOptionView.swift
//  ObiletClone
//
//  Created by abdullah on 26.09.2025.
//

import SwiftUI

struct RefundOptionView: View {
    @Binding var isSelected: Bool
    let onDetailsTapped: () -> Void

    var body: some View {
        VStack {
            HStack {
                Text("Son Dakika İade Hakkı")
                    .foregroundStyle(.oWhite)
                    .font(.system(size: 20, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)

                Image(systemName: AppIcons.umbrella)
                    .foregroundStyle(.oWhite)
                    .font(.system(size: 20))
                    .padding(5)
                    .overlay {
                        Circle()
                            .stroke(Color.oWhite, lineWidth: 2)
                    }
            }
            .padding(.top)
            .padding(.horizontal)

            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Son Dakika İade Hakkı")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.oBlack)

                    Text("ile ödemeniz güvence altında! Biletinizi sebebi ne olursa olsun sefer kalkış saatinden önce iptal etmeniz durumunda, bilet ücretinizin tamamı kesintisiz iade edilir.")
                        .font(.system(size: 14))
                        .foregroundStyle(.oBlack)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

                Button {
                    onDetailsTapped()
                } label: {
                    Text("Detaylı Bilgi")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.oGray)
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .fill(.oGray)
                                .frame(height: 1)
                        }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom)

                HStack {
                    Button {
                        isSelected.toggle()
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                                .foregroundStyle(isSelected ? .oGreen : .oGray)
                                .font(.system(size: 20))

                            Text("Satın almak istiyorum")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(.oBlack)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())

                    Spacer()

                    Text("119.99/1 Kişi")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.oGreen)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: AppRadius.card))
            .padding(5)
        }
        .background(Color.oGreen)
        .clipShape(RoundedRectangle(cornerRadius: AppRadius.card))
    }
}

struct RefundOptionViewDemo: View {
    @State private var isRefundSelected: Bool = false

    var body: some View {
        RefundOptionView(
            isSelected: $isRefundSelected,
            onDetailsTapped: {
                print("Details tapped")
            }
        )
        .padding()
    }
}

#Preview {
    RefundOptionViewDemo()
}
