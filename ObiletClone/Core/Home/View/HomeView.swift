//
//  HomeView.swift
//  ObiletClone
//
//  Created by abdullah on 07.09.2025.
//

import SwiftUI

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

    var body: some View {
        ScrollView {
            Rectangle()
                .fill(Color.oMain)
                .frame(height: 180)
                .overlay {
                    Image(AppImages.logoWhite)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 75)
                }

            LazyVStack(alignment: .leading, spacing: 20, pinnedViews: [.sectionHeaders]) {
                Section {
                    switch selectedCategory {
                    case .bus:
                        BusSearchView(
                            searchModel: $busSearch,
                            onFromLocationTap: {},
                            onToLocationTap: {},
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
                            onFromLocationTap: {},
                            onToLocationTap: {},
                            onDepartureDateTap: {},
                            onReturnDateTap: {},
                            onPassengerTap: {},
                            onSearchTap: {}
                        )

                    case .hotel:
                        HotelSearchView(
                            searchModel: $hotelSearch,
                            onToLocationTap: {},
                            onCheckInDateTap: {},
                            onCheckOutDateTap: {},
                            onGuestTap: {},
                            onSearchTap: {}
                        )

                    case .car:
                        CarSearchView(
                            searchModel: $carSearch,
                            onPickupLocationTap: {},
                            onDropoffLocationTap: {},
                            onPickupDateTap: {},
                            onPickupTimeTap: {},
                            onDropoffDateTap: {},
                            onDropoffTimeTap: {},
                            onSearchTap: {}
                        )

                    case .ferry:
                        FerrySearchView(
                            searchModel: $ferrySearch,
                            onFromLocationTap: {},
                            onToLocationTap: {},
                            onDepartureDateTap: {},
                            onReturnDateTap: {},
                            onPassengerTap: {},
                            onSearchTap: {}
                        )
                    }
                } header: {
                    TransitCategoryView(selectedCategory: $selectedCategory)
                        .background(Color.white)
                        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 2)
                }
            }
            .padding(.horizontal)
            .padding(.vertical)
            .oCardBackground(lineWidth: 0)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            .padding(.horizontal)
            .offset(y: -50)
            
            PromotionView(promotions: promotionData)
                .padding(.horizontal)
                .padding(.bottom,50)
        }
        .background(Color.oBackground)
        .clipped()
    }
    
    private var promotionData: [PromotionCategory: [Promotion]] {
        return [
            .featured: Promotion.featured,
            .bus: Promotion.bus,
            .flight: Promotion.flight,
            .hotel: Promotion.hotel,
            .ferry: Promotion.ferry
        ]
    }
}

#Preview {
    HomeView()
}
