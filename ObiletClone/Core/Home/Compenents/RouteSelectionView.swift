//
//  RouteSelectionView.swift
//  ObiletClone
//
//  Created by abdullah on 08.09.2025.
//

import SwiftUI

struct RouteSelectionView: View {
    @Binding var fromCity: String
    @Binding var toCity: String
    let onFromLocationTap: () -> Void
    let onToLocationTap: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            LocationSelectionView(
                title: "NEREDEN",
                selectedLocation: fromCity,
                onTap: onFromLocationTap
            )

            ZStack(alignment: .trailing) {
                Divider()

                Button {
                    swapLocations()
                } label: {
                    Image(systemName: AppIcons.arrowUpDown)
                        .foregroundStyle(.oGray)
                        .font(.system(size: 14, weight: .semibold))
                        .padding(8)
                        .oCardBackground()
                        .offset(x: -15)
                }
            }

            LocationSelectionView(
                title: "NEREYE",
                selectedLocation: toCity,
                onTap: onToLocationTap
            )
        }
    }

    private func swapLocations() {
        let temp = fromCity
        fromCity = toCity
        toCity = temp
    }
}
