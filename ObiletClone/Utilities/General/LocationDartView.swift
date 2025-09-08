//
//  LocationDartView.swift
//  ObiletClone
//
//  Created by abdullah on 08.09.2025.
//

import SwiftUI

struct LocationDartView: View {
    var body: some View {
        VStack {
            locationIcon

            ForEach(0 ..< 5) { _ in
                Circle()
                    .fill(.oGray.opacity(0.7))
                    .frame(width: 5)
            }

            locationIcon
        }
    }

    var locationIcon: some View {
        Image(AppImages.location)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: 15)
            .foregroundStyle(.oGray.opacity(0.7))
    }
}
