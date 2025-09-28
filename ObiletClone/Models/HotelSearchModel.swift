//
//  HotelSearchModel.swift
//  ObiletClone
//
//  Created by abdullah on 08.09.2025.
//

import Foundation

struct HotelRoom: Identifiable, Codable, Equatable,Hashable {
    var id = UUID()
    var adults: Int
    var children: Int
}

struct HotelSearchModel: Identifiable, Codable, Equatable,Hashable {
    var id = UUID()
    var toCity: String
    var checkInDate: Date?
    var checkOutDate: Date?
    var rooms: [HotelRoom] = [
        HotelRoom(adults: 2, children: 0),
    ]
    var isBusinessTrip: Bool = false

    var guestSummary: String {
        let totalAdults = rooms.reduce(0) { $0 + $1.adults }
        let totalChildren = rooms.reduce(0) { $0 + $1.children }
        let roomCount = rooms.count

        if totalChildren > 0 {
            return "\(totalAdults) Yetişkin, \(totalChildren) Çocuk, \(roomCount) Oda"
        } else {
            return "\(totalAdults) Yetişkin, \(roomCount) Oda"
        }
    }
}
