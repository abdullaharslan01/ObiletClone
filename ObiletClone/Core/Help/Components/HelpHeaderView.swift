//
//  HelpHeaderView.swift
//  ObiletClone
//
//  Created by abdullah on 15.09.2025.
//

import SwiftUI

struct HelpHeaderView: View {
    @Binding var currentLink: String

    var body: some View {
        ZStack(alignment: .leading) {
            if !currentLink.isEmpty {
                Button {
                    currentLink = ""
                } label: {
                    Image(systemName: AppIcons.chevronLeft)
                        .font(.system(size: 25))
                        .foregroundStyle(.oWhite)
                        .padding(.leading)
                }
            }

            Text("Yardım")
                .makeHeaderView(font: .system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity)
        }
    }
}
