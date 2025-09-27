//
//  BusResult.swift
//  ObiletClone
//
//  Created by abdullah on 22.09.2025.
//

import SwiftUI

struct BusResult: Identifiable {
    let id = UUID()
    let companyName: String
    let companyIcon: String
    let departureTime: String
    let arrivalTime: String
    let duration: String
    let price: Double
    let departureTerminal: String
    let arrivalTerminal: String
    let seatConfiguration: SeatConfiguration
    let departureDate:Date
}

struct SeatConfiguration {
    let seats: [Seat]

    var availableSeats: Int {
        seats.filter { !$0.isOccupied }.count
    }

    var totalSeats: Int {
        seats.count
    }
}

struct Seat {
    let number: Int
    let type: SeatType
    let isOccupied: Bool
    let gender: Gender?
}

enum SeatType {
    case single
    case double
}

enum Gender {
    case male
    case female
    
    var color:Color {
        switch self {
        case .male:
            return Color.oBlue
        case .female:
            return Color.oPink
        }
    }
    
    var genderSelectionColor:Color {
        switch self {
        case .male:
            return Color.man
        case .female:
            return Color.woman
        }
    }
    
    var icon:String {
        switch self {
        case .male:
            return AppImages.man
        case .female:
            return AppImages.woman
        }
    }
    
    var title:String {
        switch self {
        case .male:
            return "Erkek"
        case .female:
            return "Kadın"
        }
    }
}
