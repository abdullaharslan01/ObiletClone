//
//  BusSearchView.swift
//  ObiletClone
//
//  Created by abdullah on 07.09.2025.
//

import SwiftUI

struct BusSearchView: View {
    @Binding var searchModel: BusSearchModel
    let onFromLocationTap: () -> Void
    let onToLocationTap: () -> Void
    let onDateTap: () -> Void
    let onTodayTap: () -> Void
    let onTomorrowTap: () -> Void
    let onSearchBusTap:()->Void

    var body: some View {
        VStack(spacing: 25) {
            HStack(spacing: 15) {
                LocationDartView()
                
                RouteSelectionView(
                    fromCity: $searchModel.fromCity,
                    toCity: $searchModel.toCity,
                    onFromLocationTap: onFromLocationTap,
                    onToLocationTap: onToLocationTap
                )
            }.padding(.horizontal)
                .padding(.vertical)
                .oCardBackground()

            DepartureDateView(
                searchModel: $searchModel,
                onDateTap: onDateTap,
                onTodayTap: onTodayTap,
                onTomorrowTap: onTomorrowTap
            )
            .padding(.horizontal)
            .padding(.vertical)
            .oCardBackground()
            
            SearchButtonView(title: "Otobüs Ara") {
                onSearchBusTap()
            }.padding(.horizontal,40)
            
            Text("Kesintisiz İade Hakkı ve 0 Komisyon")
                .font(.system(size: 12,weight: .regular))
                .foregroundStyle(.oGray.opacity(0.5))
        }
    }
}


