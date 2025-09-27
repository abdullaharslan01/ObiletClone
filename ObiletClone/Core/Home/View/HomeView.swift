//
//  HomeView.swift
//  ObiletClone
//
//  Created by abdullah on 07.09.2025.
//

import SwiftUI

enum CitySelectionType {
    case busFrom, busTo
    case planeFrom, planeTo
    case ferryFrom, ferryTo
    case hotelTo
    case carPickup, carDropoff
}

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var showCitySelection = false
    @State private var citySelectionType: CitySelectionType = .busFrom

    var body: some View {
        ZStack {
            Color.oMain.ignoresSafeArea()
            
            ScrollView {
                Rectangle()
                    .fill(Color.oMain)
                    .frame(height: 100)
                
                VStack {
                    logoSection
                    searchSection
                    promotionSection
                    dividerSection
                    languageInfoSection
                }
                .offset(y: -130)
            }
            .background(Color.oBackground)
            .clipped()
            .ignoresSafeArea(edges: [.bottom])
        }
        .sheet(isPresented: $showCitySelection) {
            citySelectionSheet
        }
    }
}

private extension HomeView {
    var logoSection: some View {
        Image(AppImages.logoWhite)
            .resizable()
            .scaledToFit()
            .frame(height: 75)
    }
    
    var searchSection: some View {
        LazyVStack(alignment: .leading, spacing: 20, pinnedViews: [.sectionHeaders]) {
            Section {
                VStack {
                    selectedCategorySearchView
                }
            } header: {
                TransitCategoryView(selectedCategory: $viewModel.selectedCategory)
                    .background(Color.white)
                    .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 2)
                    .clipped()
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
        .oCardBackground(lineWidth: 0)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    var selectedCategorySearchView: some View {
        switch viewModel.selectedCategory {
        case .bus:
            BusSearchView(
                searchModel: $viewModel.busSearch,
                onFromLocationTap: { openCitySelection(.busFrom) },
                onToLocationTap: { openCitySelection(.busTo) },
                onDateTap: {},
                onTodayTap: { viewModel.setBusSearchToToday() },
                onTomorrowTap: { viewModel.setBusSearchToTomorrow() },
                onSearchBusTap: {}
            )
            
        case .plane:
            PlaneSearchView(
                searchModel: $viewModel.planeSearch,
                onFromLocationTap: { openCitySelection(.planeFrom) },
                onToLocationTap: { openCitySelection(.planeTo) },
                onDepartureDateTap: {},
                onReturnDateTap: {},
                onPassengerTap: {},
                onSearchTap: {}
            )
            
        case .hotel:
            HotelSearchView(
                searchModel: $viewModel.hotelSearch,
                onToLocationTap: { openCitySelection(.hotelTo) },
                onCheckInDateTap: {},
                onCheckOutDateTap: {},
                onGuestTap: {},
                onSearchTap: {}
            )
            
        case .car:
            CarSearchView(
                searchModel: $viewModel.carSearch,
                onPickupLocationTap: { openCitySelection(.carPickup) },
                onDropoffLocationTap: { openCitySelection(.carDropoff) },
                onPickupDateTap: {},
                onPickupTimeTap: {},
                onDropoffDateTap: {},
                onDropoffTimeTap: {},
                onSearchTap: {}
            )
            
        case .ferry:
            FerrySearchView(
                searchModel: $viewModel.ferrySearch,
                onFromLocationTap: { openCitySelection(.ferryFrom) },
                onToLocationTap: { openCitySelection(.ferryTo) },
                onDepartureDateTap: {},
                onReturnDateTap: {},
                onPassengerTap: {},
                onSearchTap: {}
            )
        }
    }
    
    var promotionSection: some View {
        HomePromotionView(promotions: viewModel.promotionData)
            .padding(.horizontal)
            .padding(.top)
    }
    
    var dividerSection: some View {
        Rectangle()
            .fill(.oGray.opacity(0.5))
            .frame(height: 1)
            .padding(.horizontal)
    }
    
    var languageInfoSection: some View {
        LanguageInfoView(
            flagImage: AppImages.tr,
            languageCode: "TR",
            currencySymbol: "₺",
            currencyCode: "TRY"
        )
    }
    
    var citySelectionSheet: some View {
        CitySelectionView(
            recentSearches: viewModel.dummyRecentSearches,
            popularStops: viewModel.dummyPopularStops,
            otherStops: viewModel.dummyOtherStops,
            onCitySelected: { city in
                viewModel.handleCitySelection(city, for: citySelectionType)
            },
            titleText: getTitleText(),
            placeholderText: getPlaceholderText()
        )
    }
}

private extension HomeView {
    func openCitySelection(_ type: CitySelectionType) {
        citySelectionType = type
        showCitySelection = true
    }
    
    func getTitleText() -> String {
        switch citySelectionType {
        case .busFrom, .planeFrom, .ferryFrom:
            return "Nereden"
        case .busTo, .planeTo, .ferryTo, .hotelTo:
            return "Nereye"
        case .carPickup:
            return "Alış Yeri"
        case .carDropoff:
            return "Dönüş Yeri"
        }
    }
    
    func getPlaceholderText() -> String {
        switch citySelectionType {
        case .hotelTo:
            return "otel, il veya ilçe seçin"
        case .carPickup, .carDropoff:
            return "konum seçin"
        default:
            return "il veya ilçe yazın"
        }
    }
}

#Preview {
    HomeView()
}

