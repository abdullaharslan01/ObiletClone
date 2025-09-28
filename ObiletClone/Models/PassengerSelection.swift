//
//  PassengerSelection.swift
//  ObiletClone
//
//  Created by abdullah on 08.09.2025.
//

import SwiftUI

enum PassengerType: String, Codable, CaseIterable, Identifiable,Hashable {
    case adult
    case student
    case child
    case infant
    case senior

    var id: String { rawValue }

    struct PlaneRouteSelectionView: View {
        @Binding var searchModel: PlaneSearchModel
        let onFromLocationTap: () -> Void
        let onToLocationTap: () -> Void

        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                LocationSelectionView(
                    title: "NEREDEN",
                    selectedLocation: searchModel.fromCity,
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
                    selectedLocation: searchModel.toCity,
                    onTap: onToLocationTap
                )
            }
        }

        private func swapLocations() {
            let temp = searchModel.fromCity
            searchModel.fromCity = searchModel.toCity
            searchModel.toCity = temp
        }
    }

    var title: String {
        switch self {
        case .adult: return "Yetişkin"
        case .student: return "Öğrenci (12-24 Yaş)"
        case .child: return "Çocuk (2-12 Yaş)"
        case .infant: return "Bebek (0-2 Yaş)"
        case .senior: return "65 Yaş Üzeri"
        }
    }

    var shortTitle: String {
        switch self {
        case .adult: return "Yetişkin"
        case .student: return "Öğrenci"
        case .child: return "Çocuk"
        case .infant: return "Bebek"
        case .senior: return "65+ Yaş"
        }
    }
}

struct PassengerSelection: Codable, Equatable, Identifiable,Hashable {
    var id = UUID()
    var type: PassengerType
    var count: Int
}
