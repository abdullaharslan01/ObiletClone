//
//  PaymentPriceInformationView.swift
//  ObiletClone
//
//  Created by abdullah on 24.09.2025.
//

import SwiftUI

struct PaymentPriceInformationView: View {
    @State var totalDetail: Bool = false
    @State var couponDetail: Bool = false
    
    @Binding var couponCode: String
    var passengerNumber: Int
    var totalPrice: Int
    
    var onCouponAdd: () -> Void
    
    var body: some View {
        PaymentCardView(title: "FİYAT BİLGİLERİ") {
            VStack {
                VStack {
                    Button {
                        withAnimation {
                            totalDetail.toggle()
                        }
                    } label: {
                        VStack {
                            HStack {
                                HStack {
                                    Text("Toplam Tutar")
                                    Image(systemName: AppIcons.chevronDown)
                                        .rotationEffect(.degrees(totalDetail ? 180 : 0))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("\(totalPrice) TL")
                            }
                            .font(.system(size: 18, weight: .semibold))
                            
                            Divider()
                        }
                    }
                    .foregroundStyle(.oGray)
                }
                
                if totalDetail {
                    VStack {
                        HStack {
                            HStack {
                                Text("Bilet Tutarı: ")
                                    .font(.system(size: 14, weight: .semibold))
                                
                                Text("(\(passengerNumber) Yolcu)")
                                    .font(.system(size: 14, weight: .regular))
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("\(totalPrice) TL")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .padding(.horizontal)
                        .foregroundStyle(.oGray)
                        
                        Divider()
                        
                        HStack {
                            Text("Toplam Tutar")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("\(totalPrice) TL")
                        }
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.oGreen)
                    }
                    .padding(.bottom, 10)
                }
                
                Button {
                    withAnimation {
                        couponDetail.toggle()
                    }
                } label: {
                    HStack {
                        Text("Kupon Kodu")
                            .font(.system(size: 18, weight: .semibold))
                        
                        Image(systemName: AppIcons.chevronDown)
                            .padding(5)
                            .overlay {
                                Circle()
                                    .stroke(.oGray)
                            }
                            .font(.system(size: 14, weight: .semibold))
                            .rotationEffect(.degrees(couponDetail ? 180 : 0))

                    }
                    .foregroundStyle(.oGray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                if couponDetail {
                    HStack {
                        ZStack(alignment: .leading) {
                            if couponCode.isEmpty {
                                Text("Kupon kodunuzu yazınız.")
                                    .font(.system(size: 18,weight: .semibold))
                                    .foregroundStyle(.oGray)
                            }

                            TextField("", text: $couponCode)
                                .font(.system(size: 18))
                               
                        }
                        
                        Button {
                            onCouponAdd()
                        } label: {
                            Text("Ekle")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.oGreen)
                                .padding(5)
                                .padding(.horizontal)
                                .overlay {
                                    RoundedRectangle(cornerRadius: AppRadius.card)
                                        .stroke(Color.oGreen, lineWidth: 1)
                                }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
