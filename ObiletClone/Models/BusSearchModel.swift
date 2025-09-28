//
//  BusSearchModel.swift
//  ObiletClone
//
//  Created by abdullah on 07.09.2025.
//

import Foundation

struct BusSearchModel: Identifiable, Codable, Equatable,Hashable {
    var id = UUID()
    var fromCity: String
    var toCity: String
    var departureDate: Date
}
