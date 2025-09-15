//
//  SearchHeaderView.swift
//  ObiletClone
//
//  Created by abdullah on 15.09.2025.
//

import SwiftUI

struct SearchHeaderView: View {
    @Binding var searchText: String

    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 100)
                .overlay {
                    Image(AppImages.searchHeadere)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 100)
                        .clipShape(Rectangle())
                }

            SearchTextField(searchText: $searchText)
        }
    }
}

struct SearchTextField: View {
    @Binding var searchText: String

    var body: some View {
        ZStack(alignment: .leading) {
            if searchText.isEmpty {
                Text("Nasıl yardımcı olabiliriz?")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.gray)
                    .padding(.leading, 15)
            }

            HStack {
                TextField("", text: $searchText)
                    .padding(10)
                    .foregroundColor(.black)

                Image(systemName: AppIcons.search)
                    .foregroundStyle(.oMain)
                    .font(.system(size: 18))
                    .padding(.trailing, 10)
            }
        }
        .padding(.horizontal, 6)
        .background(Color.oWhite)
        .clipShape(Capsule())
        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
        .padding(.horizontal, 30)
    }
}
