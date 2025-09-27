//
//  PaymentContactView.swift
//  ObiletClone
//
//  Created by abdullah on 24.09.2025.
//

import SwiftUI

struct PaymentContactView: View {
    @Binding var contactInfo: ContactInformation
    @Binding var phonCodeSelection:Bool

    var body: some View {
        PaymentCardView(title: "İLETİŞİM BİLGİLERİ") {
            VStack {
                VStack {
                    Text("CEP TELEFONU")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.oGray)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        

                    HStack {
                        Button {} label: {
                            HStack(spacing: 15) {
                                Text("\(contactInfo.phoneCode)")
                                    .foregroundStyle(.oBlack)
                                    .font(.system(size: 15))

                                Image(systemName: AppIcons.chevronDown)
                                    .foregroundStyle(.oGray)
                            }
                            .padding(5)
                            .background(
                                RoundedRectangle(cornerRadius: AppRadius.card)
                                    .fill(.oGray.opacity(0.2))
                            )
                        }

                        TextField("5xxxxxxxxx", text: $contactInfo.phoneNumber)
                        
                        Image(systemName: AppIcons.checkMarkCircle)
                            .foregroundStyle(.oGreen)
                            .font(.system(size: 20))
                    }
                }
                .padding(.bottom)
                
                Divider()
                
                VStack {
                    Text("E-MAİL")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.oGray)
                        .frame(maxWidth: .infinity,alignment: .leading)

                        

                    HStack {
                     

                        TextField("E-mail adresinizi giriniz.", text: $contactInfo.email)
                        
                        Image(systemName: AppIcons.checkMarkCircle)
                            .foregroundStyle(.oGreen)
                            .font(.system(size: 20))
                    }
                }
                .padding(.bottom)
                
                Divider()

                HStack(alignment: .top) {
                    Button {
                        
                        withAnimation {
                            contactInfo.smsPermission.toggle()
                        }
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 1)
                            .stroke(contactInfo.smsPermission ? Color.oGreen : Color.oGray)
                            .frame(width: 18,height: 18)
                            .overlay {
                                
                                if contactInfo.smsPermission {
                                    Image(systemName: AppIcons.check)
                                        .foregroundStyle(.oGreen)
                                        .font(.system(size: 10,weight: .semibold))

                                }
                                
                            }
                    }
                    
        
                   
                        Text("Biletimi ÜCRETSİZ SMS ile alıp, kampanya ve duyuruları ticari elektronik ileti ve WhatsApp üzerinden almayı ve kişisel pazarlama amacıyla işlenmesine")
                            .font(.system(size: 16))
                            +
                        Text(" onaylıyorum.")
                        .font(.system(size: 16,weight: .semibold))
                    
                    
                }
                

            }.frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
