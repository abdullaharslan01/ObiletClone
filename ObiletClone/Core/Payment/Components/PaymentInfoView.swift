//
//  PaymentInfoView.swift
//  ObiletClone
//
//  Created by abdullah on 26.09.2025.
//

import SwiftUI



struct PaymentInfo {
    var cardNumber: String = ""
    var expiryDate: String = ""
    var cvc: String = ""
}

struct PaymentInfoView: View {
    @Binding var paymentInfo: PaymentInfo
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Banka / Kredi Kartı")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.oMain)
                .padding(.bottom,1)
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .fill(.oMain)
                        .frame(height: 1)
                }
            
            Image(AppImages.bankProvider)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("KART NUMARASI")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.oGray)
                
                TextField(".... .... .... .....", text: $paymentInfo.cardNumber)
                    .font(.system(size: 16))
                    .foregroundStyle(.oBlack)
                    .padding(.bottom)
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .fill(.oGray)
                            .frame(height: 1)
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("SKT")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(.oGray)
                    
                    TextField("AA/YY", text: $paymentInfo.expiryDate)
                        .font(.system(size: 16))
                        .foregroundStyle(.oBlack)
                        .padding(.bottom)
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .fill(.oGray)
                                .frame(height: 1)
                        }
                }
                
                Rectangle()
                    .fill(.oGray)
                    .frame(width: 1, height: 40)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("CVC")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(.oGray)
                    
                    TextField("***", text: $paymentInfo.cvc)
                        .font(.system(size: 16))
                        .foregroundStyle(.oBlack)
                        .padding(.bottom)
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .fill(.oGray)
                                .frame(height: 1)
                        }
                }
            }
            
            HStack {
                Text("TAKSİT SEÇİMİ")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.oGray)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Kartlara göre taksit seçenekleri")
                        .font(.system(size: 12))
                        .foregroundStyle(.oGray)
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .fill(.oGray)
                                .frame(height: 1)
                        }
                }
            }
            
            Text("Taksit seçenekleri kartın ilk 8 hanesi sonrası kart bilgileri girildikten sonra gösterilecektir.")
                .font(.system(size: 14))
                .foregroundStyle(.oGray.opacity(0.6))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct PaymentInfoParentView: View {
    @State private var paymentInfo = PaymentInfo()
    
    var body: some View {
        PaymentInfoView(paymentInfo: $paymentInfo)
    }
}

#Preview {
    PaymentInfoParentView()
}
