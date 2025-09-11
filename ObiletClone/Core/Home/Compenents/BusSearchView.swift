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
    
    let searchButtonTitle: String
    let bottomInfoText: String
    
    init(
        searchModel: Binding<BusSearchModel>,
        onFromLocationTap: @escaping () -> Void,
        onToLocationTap: @escaping () -> Void,
        onDateTap: @escaping () -> Void,
        onTodayTap: @escaping () -> Void,
        onTomorrowTap: @escaping () -> Void,
        onSearchBusTap: @escaping () -> Void,
        searchButtonTitle: String = "Otobüs Ara",
        bottomInfoText: String = "Kesintisiz İade Hakkı ve 0 Komisyon"
    ) {
        self._searchModel = searchModel
        self.onFromLocationTap = onFromLocationTap
        self.onToLocationTap = onToLocationTap
        self.onDateTap = onDateTap
        self.onTodayTap = onTodayTap
        self.onTomorrowTap = onTomorrowTap
        self.onSearchBusTap = onSearchBusTap
        self.searchButtonTitle = searchButtonTitle
        self.bottomInfoText = bottomInfoText
    }

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
            
            SearchButtonView(title: searchButtonTitle) {
                onSearchBusTap()
            }.padding(.horizontal,40)
            
            Text(bottomInfoText)
                .font(.system(size: 12,weight: .regular))
                .foregroundStyle(.oGray.opacity(0.5))
        }
    }
}
