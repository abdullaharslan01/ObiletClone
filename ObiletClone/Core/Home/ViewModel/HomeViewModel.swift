//
//  HomeViewModel.swift
//  ObiletClone
//
//  Created by abdullah on 27.09.2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var selectedCategory: TransitCategory = .bus
    @Published var busSearch: BusSearchModel = .init(fromCity: "İstanbul Avrupa", toCity: "Gaziantep", departureDate: Date())
    @Published var planeSearch: PlaneSearchModel = .init(fromCity: "İstanbul", toCity: "Gaziantep")
    @Published var ferrySearch: FerrySearchModel = .init(fromCity: "İstanbul", toCity: "İstanbul")
    @Published var hotelSearch: HotelSearchModel = .init(
        toCity: "İl, ilçe veya Otel Seçiniz",
        checkInDate: nil,
        checkOutDate: nil
    )
    @Published var carSearch: CarRentalSearchModel = .init(
        pickupLocation: "Gaziantep",
        dropoffLocation: "İstanbul",
        pickupDate: .now,
        pickupTime: .now,
        dropoffDate: .now,
        dropoffTime: .now
    )

    func setBusSearchToToday() {
        busSearch.departureDate = Date()
    }

    func setBusSearchToTomorrow() {
        busSearch.departureDate = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    }

    func handleCitySelection(_ city: CityModel, for type: CitySelectionType) {
        switch type {
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

    var dummyRecentSearches: [CityModel] {
        [
            CityModel(name: "İstanbul"),
            CityModel(name: "Ankara"),
            CityModel(name: "Gaziantep"),
        ]
    }

    var dummyPopularStops: [CityModel] {
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
            CityModel(name: "Samsun"),
        ]
    }

    var dummyOtherStops: [CityModel] {
        [
            CityModel(name: "Gaziantep"),
            CityModel(name: "Kayseri"),
            CityModel(name: "Trabzon"),
            CityModel(name: "Diyarbakır"),
            CityModel(name: "Malatya"),
            CityModel(name: "Van"),
            CityModel(name: "Batman"),
            CityModel(name: "Şanlıurfa"),
        ]
    }

    var promotionData: [PromotionCategory: [Promotion]] {
        return [
            .featured: Promotion.featured,
            .bus: Promotion.bus,
            .flight: Promotion.flight,
            .hotel: Promotion.hotel,
            .ferry: Promotion.ferry,
        ]
    }
}
