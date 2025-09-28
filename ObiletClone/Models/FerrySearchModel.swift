//
//  FerrySearchModel.swift
//  ObiletClone
//
//  Created by abdullah on 08.09.2025.
//

import Foundation

struct FerrySearchModel: Identifiable, Codable, Equatable,Hashable {
    var id = UUID()
    var fromCity: String
    var toCity: String
    var departureDate: Date?
    var returnDate: Date?
    var passengers: [PassengerSelection] = [
        .init(type: .adult, count: 1),
    ]

    var passengerSummary: String {
        let nonZeroPassengers = passengers.filter { $0.count > 0 }
        if nonZeroPassengers.isEmpty {
            return "Yolcu Seçiniz"
        }

        return nonZeroPassengers.map { "\($0.count) \($0.type.shortTitle)" }.joined(separator: ", ")
    }

    var totalPassengerCount: Int {
        passengers.reduce(0) { $0 + $1.count }
    }
}
