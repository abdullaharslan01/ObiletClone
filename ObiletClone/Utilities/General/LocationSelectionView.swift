//
//  LocationSelectionView.swift
//  ObiletClone
//
//  Created by abdullah on 07.09.2025.
//

import SwiftUI

struct LocationSelectionView: View {
    let title: String
    let selectedLocation: String
    let onTap: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.oMain)
                .font(.system(size: 15, weight: .bold))

            Text(selectedLocation)
                .foregroundStyle(.oBlack)
                .font(.system(size: 17, weight: .regular))
                .onTapGesture {
                    onTap()
                }
        }
    }
}
