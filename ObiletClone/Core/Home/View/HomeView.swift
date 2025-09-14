//
//  HomeView.swift
//  ObiletClone
//
//  Created by abdullah on 07.09.2025.
//

import SwiftUI

// MARK: - City Selection Type
enum CitySelectionType {
    case busFrom, busTo
    case planeFrom, planeTo
    case ferryFrom, ferryTo
    case hotelTo
    case carPickup, carDropoff
}

struct HomeView: View {
    @State var selectedCategory: TransitCategory = .bus
    @State var busSearch: BusSearchModel = .init(fromCity: "İstanbul Avrupa", toCity: "Gaziantep", departureDate: Date())

    @State var planeSearch: PlaneSearchModel = .init(fromCity: "İstanbul", toCity: "Gaziantep")

    @State var ferrySearch: FerrySearchModel = .init(fromCity: "İstanbul", toCity: "İstanbul")

    @State var hotelSearch: HotelSearchModel = .init(
        toCity: "İl, ilçe veya Otel Seçiniz",
        checkInDate: nil,
        checkOutDate: nil
    )

    @State var carSearch: CarRentalSearchModel = .init(pickupLocation: "Gaziantep", dropoffLocation: "İstanbul", pickupDate: .now, pickupTime: .now, dropoffDate: .now, dropoffTime: .now)
    
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
                    Image(AppImages.logoWhite)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 75)
                    
                    LazyVStack(alignment: .leading, spacing: 20, pinnedViews: [.sectionHeaders]) {
                        Section {
                            VStack {
                                switch selectedCategory {
                                case .bus:
                                    BusSearchView(
                                        searchModel: $busSearch,
                                        onFromLocationTap: {
                                            citySelectionType = .busFrom
                                            showCitySelection = true
                                        },
                                        onToLocationTap: {
                                            citySelectionType = .busTo
                                            showCitySelection = true
                                        },
                                        onDateTap: {},
                                        onTodayTap: {
                                            busSearch.departureDate = Date()
                                        },
                                        onTomorrowTap: {
                                            busSearch.departureDate = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
                                        }, onSearchBusTap: {}
                                    )
                                    
                                case .plane:
                                    PlaneSearchView(
                                        searchModel: $planeSearch,
                                        onFromLocationTap: {
                                            citySelectionType = .planeFrom
                                            showCitySelection = true
                                        },
                                        onToLocationTap: {
                                            citySelectionType = .planeTo
                                            showCitySelection = true
                                        },
                                        onDepartureDateTap: {},
                                        onReturnDateTap: {},
                                        onPassengerTap: {},
                                        onSearchTap: {}
                                    )
                                    
                                case .hotel:
                                    HotelSearchView(
                                        searchModel: $hotelSearch,
                                        onToLocationTap: {
                                            citySelectionType = .hotelTo
                                            showCitySelection = true
                                        },
                                        onCheckInDateTap: {},
                                        onCheckOutDateTap: {},
                                        onGuestTap: {},
                                        onSearchTap: {}
                                    )
                                    
                                case .car:
                                    CarSearchView(
                                        searchModel: $carSearch,
                                        onPickupLocationTap: {
                                            citySelectionType = .carPickup
                                            showCitySelection = true
                                        },
                                        onDropoffLocationTap: {
                                            citySelectionType = .carDropoff
                                            showCitySelection = true
                                        },
                                        onPickupDateTap: {},
                                        onPickupTimeTap: {},
                                        onDropoffDateTap: {},
                                        onDropoffTimeTap: {},
                                        onSearchTap: {}
                                    )
                                    
                                case .ferry:
                                    FerrySearchView(
                                        searchModel: $ferrySearch,
                                        onFromLocationTap: {
                                            citySelectionType = .ferryFrom
                                            showCitySelection = true
                                        },
                                        onToLocationTap: {
                                            citySelectionType = .ferryTo
                                            showCitySelection = true
                                        },
                                        onDepartureDateTap: {},
                                        onReturnDateTap: {},
                                        onPassengerTap: {},
                                        onSearchTap: {}
                                    )
                                }
                            }
                        } header: {
                            TransitCategoryView(selectedCategory: $selectedCategory)
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
                    
                    HomePromotionView(promotions: promotionData)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    Rectangle()
                        .fill(.oGray.opacity(0.5))
                        .frame(height: 1)
                        .padding(.horizontal)
                    
                    LanguageInfoView(
                        flagImage: AppImages.tr,
                        languageCode: "TR",
                        currencySymbol: "₺",
                        currencyCode: "TRY"
                    )
                    
                }.offset(y: -130)
                
                
            }
            .background(Color.oBackground)
            .clipped()
            .ignoresSafeArea(edges:[.bottom])
        }
        .sheet(isPresented: $showCitySelection) {
            CitySelectionView(
                recentSearches: dummyRecentSearches,
                popularStops: dummyPopularStops,
                otherStops: dummyOtherStops,
                onCitySelected: handleCitySelection,
                titleText: getTitleText(),
                placeholderText: getPlaceholderText()
            )
        }
    }
    
    private func handleCitySelection(_ city: CityModel) {
        switch citySelectionType {
        case .busFrom:
            busSearch.fromCity = city.name
        case .busTo:
            busSearch.toCity = city.name
        case .planeFrom:
            planeSearch.fromCity = city.name
        case .planeTo:
            planeSearch.toCity = city.name
        case .ferryFrom:
            ferrySearch.fromCity = city.name
        case .ferryTo:
            ferrySearch.toCity = city.name
        case .hotelTo:
            hotelSearch.toCity = city.name
        case .carPickup:
            carSearch.pickupLocation = city.name
        case .carDropoff:
            carSearch.dropoffLocation = city.name
        }
    }
    
    private func getTitleText() -> String {
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
    
    private func getPlaceholderText() -> String {
        switch citySelectionType {
        case .hotelTo:
            return "otel, il veya ilçe seçin"
        case .carPickup, .carDropoff:
            return "konum seçin"
        default:
            return "il veya ilçe yazın"
        }
    }
    
    private var dummyRecentSearches: [CityModel] {
        [
            CityModel(name: "İstanbul"),
            CityModel(name: "Ankara"),
            CityModel(name: "Gaziantep")
        ]
    }
    
    private var dummyPopularStops: [CityModel] {
        [
            CityModel(name: "İstanbul Avrupa - İstanbul"),
            CityModel(name: "İstanbul Anadolu - İstanbul"),
            CityModel(name: "Ankara"),
            CityModel(name: "İzmir"),
            CityModel(name: "Adana"),
            CityModel(name: "Bursa"),
            CityModel(name: "Antalya"),
            CityModel(name: "Eskişehir"),
            CityModel(name: "Konya"),
            CityModel(name: "Samsun")
        ]
    }
    
    private var dummyOtherStops: [CityModel] {
        [
            CityModel(name: "Gaziantep"),
            CityModel(name: "Kayseri"),
            CityModel(name: "Trabzon"),
            CityModel(name: "Diyarbakır"),
            CityModel(name: "Malatya"),
            CityModel(name: "Van"),
            CityModel(name: "Batman"),
            CityModel(name: "Şanlıurfa")
        ]
    }

    private var promotionData: [PromotionCategory: [Promotion]] {
        return [
            .featured: Promotion.featured,
            .bus: Promotion.bus,
            .flight: Promotion.flight,
            .hotel: Promotion.hotel,
            .ferry: Promotion.ferry,
        ]
    }
}

#Preview {
    HomeView()
}
