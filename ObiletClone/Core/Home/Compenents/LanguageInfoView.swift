//
//  LanguageInfoView.swift
//  ObiletClone
//
//  Created by abdullah on 11.09.2025.
//

import SwiftUI

struct LanguageInfoView: View {
    let flagImage: String
    let languageCode: String
    let currencySymbol: String
    let currencyCode: String
    
    var body: some View {
        HStack(spacing: 50) {
            HStack {
                Image(flagImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                
                Text(languageCode)
                    .font(.title2)
                    .foregroundStyle(.oBlack)
            }
            
            HStack {
                Text(currencySymbol)
                    .font(.title2)
                    .padding(8)
                    .background(
                        Circle()
                            .stroke(Color.oBlack, lineWidth: 1)
                    )
                
                Text(currencyCode)
                    .font(.title2)
                    .foregroundStyle(.oBlack)
            }.foregroundStyle(.oBlack)
        }
    }
}

#Preview {
    LanguageInfoView(
        flagImage: AppImages.tr,
        languageCode: "TR",
        currencySymbol: "₺",
        currencyCode: "TRY"
    )
}
