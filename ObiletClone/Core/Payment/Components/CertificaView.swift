//
//  CertificaView.swift
//  ObiletClone
//
//  Created by abdullah on 27.09.2025.
//

import SwiftUI

struct CertificaView: View {
    var body: some View {
        HStack {
            Image(AppImages.certifica)
                .resizable()
                .scaledToFit()
                .frame(height: 50)
            
            Text("obilet üzerinden yapılan işlemler güvenlik sertifikalarıyl korunmaktadır.")
                .font(.system(size: 15))
                .foregroundStyle(.oBlack)
        }
    }
}

#Preview {
    CertificaView()
}
