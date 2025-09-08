//
//  SearchButtonView.swift
//  ObiletClone
//
//  Created by abdullah on 07.09.2025.
//

import SwiftUI

struct SearchButtonView: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .padding(12)
                .font(.system(size: 16,weight: .bold))
                .foregroundStyle(.oWhite)
                .frame(maxWidth: .infinity)
                .background(.oGreen)
                .clipShape(RoundedRectangle(cornerRadius: AppRadius.card))
        }
    }
}

#Preview {
    SearchButtonView(title:"Otobüs Ara") {
        print("Button tapped!")
    }
    .padding(.horizontal)
}
