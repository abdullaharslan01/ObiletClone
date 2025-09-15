//
//  CompanyInfoView.swift
//  ObiletClone
//
//  Created by abdullah on 15.09.2025.
//

import SwiftUI

struct CompanyInfo: Identifiable {
    let id = UUID()
    let title: String
}

struct CompanyInfoData {
    static let defaultInfos: [CompanyInfo] = [
        CompanyInfo(title: "Obilet Bilişim Sistemleri A.Ş.: TÜRSAB A Grubu Seyahat Acentesi, Belge No: 9883"),
        CompanyInfo(title: "Biletal İç ve Dış Ticaret A.Ş.: TÜRSAB A Grubu Seyahat Acentesi, Belge No: 4443 | IATA üyelik no: 88214125")
    ]
}

struct CompanyInfoView: View {
    var infos: [CompanyInfo] = CompanyInfoData.defaultInfos

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(infos) { info in
                HStack(alignment: .top, spacing: 5) {
                    Text("●")
                        .font(.system(size: 8))
                        .padding(.top, 5)

                    Text(info.title)
                        .font(.system(size: 15))
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.oWhite)
        .padding(.top, 50)
        .padding(.vertical)
    }
}
