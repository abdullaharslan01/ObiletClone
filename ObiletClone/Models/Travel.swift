//
//  Travel.swift
//  ObiletClone
//
//  Created by abdullah on 12.09.2025.
//

import Foundation

struct Passenger: Identifiable, Codable,Hashable {
    var id = UUID()
    let fullName: String
    let pnr: String
    let seatNumber: String
    let ticketPrice: Double
}

struct Travel: Identifiable, Codable, Hashable {
    var id = UUID()
    let brandIconName: String
    let brandName: String
    let departureCity: String
    let departureTerminal: String
    let arrivalCity: String
    let arrivalTerminal: String
    let travelDate: Date
    let passengers: [Passenger]

    var totalPrice: Double {
        passengers.reduce(0) {
            $0 + $1.ticketPrice
        }
    }
}

extension Travel {
    static var sampleTravels: [Travel] {
        [
            Travel(
                brandIconName: "benturizm",
                brandName: "Ben Turizm",
                departureCity: "İstanbul Avrupa",
                departureTerminal: "Esenler Otogarı",
                arrivalCity: "Gaziantep",
                arrivalTerminal: "Gaziantep Otogarı",
                travelDate: DateComponents(calendar: .current, year: 2025, month: 8, day: 31, hour: 21, minute: 0).date!,
                passengers: [
                    Passenger(fullName: "Abdullah Arslan", pnr: "PNR100001", seatNumber: "1", ticketPrice: 1600.0),
                ]
            ),
            Travel(
                brandIconName: "sec",
                brandName: "Seç",
                departureCity: "Ankara",
                departureTerminal: "AŞTİ",
                arrivalCity: "İzmir",
                arrivalTerminal: "İzmir Otogarı",
                travelDate: DateComponents(calendar: .current, year: 2025, month: 9, day: 2, hour: 9, minute: 30).date!,
                passengers: [
                    Passenger(fullName: "Abdullah Arslan", pnr: "PNR100002", seatNumber: "15", ticketPrice: 900.0),
                ]
            ),
            Travel(
                brandIconName: "metro",
                brandName: "Metro Turizm",
                departureCity: "Bursa",
                departureTerminal: "Bursa Otogarı",
                arrivalCity: "İstanbul Anadolu",
                arrivalTerminal: "Harem Otogarı",
                travelDate: DateComponents(calendar: .current, year: 2025, month: 9, day: 5, hour: 7, minute: 0).date!,
                passengers: [
                    Passenger(fullName: "Abdullah Arslan", pnr: "PNR100003", seatNumber: "22", ticketPrice: 500.0),
                    Passenger(fullName: "Mehmet Arslan", pnr: "PNR100004", seatNumber: "23", ticketPrice: 500.0),
                ]
            ),
            Travel(
                brandIconName: "kamilkoc",
                brandName: "Kamil Koç",
                departureCity: "Eskişehir",
                departureTerminal: "Eskişehir Otogarı",
                arrivalCity: "Ankara",
                arrivalTerminal: "AŞTİ",
                travelDate: DateComponents(calendar: .current, year: 2025, month: 9, day: 10, hour: 12, minute: 45).date!,
                passengers: [
                    Passenger(fullName: "Abdullah Arslan", pnr: "PNR100005", seatNumber: "5", ticketPrice: 400.0),
                ]
            ),
            Travel(
                brandIconName: "benturizm",
                brandName: "Ben Turizm",
                departureCity: "İzmir",
                departureTerminal: "İzmir Otogarı",
                arrivalCity: "İstanbul Avrupa",
                arrivalTerminal: "Esenler Otogarı",
                travelDate: DateComponents(calendar: .current, year: 2025, month: 9, day: 12, hour: 23, minute: 0).date!,
                passengers: [
                    Passenger(fullName: "Abdullah Arslan", pnr: "PNR100007", seatNumber: "13", ticketPrice: 750.0),
                ]
            ),
            Travel(
                brandIconName: "sec",
                brandName: "Seç",
                departureCity: "Konya",
                departureTerminal: "Konya Otogarı",
                arrivalCity: "Antalya",
                arrivalTerminal: "Antalya Otogarı",
                travelDate: DateComponents(calendar: .current, year: 2025, month: 9, day: 15, hour: 8, minute: 15).date!,
                passengers: [
                    Passenger(fullName: "Abdullah Arslan", pnr: "PNR100008", seatNumber: "9", ticketPrice: 600.0),
                ]
            ),
            Travel(
                brandIconName: "metro",
                brandName: "Metro Turizm",
                departureCity: "Gaziantep",
                departureTerminal: "Gaziantep Otogarı",
                arrivalCity: "Adana",
                arrivalTerminal: "Adana Otogarı",
                travelDate: DateComponents(calendar: .current, year: 2025, month: 9, day: 18, hour: 6, minute: 30).date!,
                passengers: [
                    Passenger(fullName: "Abdullah Arslan", pnr: "PNR100009", seatNumber: "30", ticketPrice: 350.0),
                ]
            ),
            Travel(
                brandIconName: "kamilkoc",
                brandName: "Kamil Koç",
                departureCity: "Trabzon",
                departureTerminal: "Trabzon Otogarı",
                arrivalCity: "Rize",
                arrivalTerminal: "Rize Otogarı",
                travelDate: DateComponents(calendar: .current, year: 2025, month: 9, day: 20, hour: 14, minute: 0).date!,
                passengers: [
                    Passenger(fullName: "Abdullah Arslan", pnr: "PNR100011", seatNumber: "8", ticketPrice: 200.0),
                ]
            ),
            Travel(
                brandIconName: "benturizm",
                brandName: "Ben Turizm",
                departureCity: "İstanbul Anadolu",
                departureTerminal: "Harem Otogarı",
                arrivalCity: "Bursa",
                arrivalTerminal: "Bursa Otogarı",
                travelDate: DateComponents(calendar: .current, year: 2025, month: 9, day: 22, hour: 18, minute: 45).date!,
                passengers: [
                    Passenger(fullName: "Abdullah Arslan", pnr: "PNR100012", seatNumber: "17", ticketPrice: 300.0),
                ]
            ),
            Travel(
                brandIconName: "benturizm",
                brandName: "Ben Turizm",
                departureCity: "İzmir",
                departureTerminal: "İzmir Otogarı",
                arrivalCity: "Bodrum",
                arrivalTerminal: "Bodrum Otogarı",
                travelDate: DateComponents(calendar: .current, year: 2025, month: 9, day: 25, hour: 11, minute: 20).date!,
                passengers: [
                    Passenger(fullName: "Abdullah Arslan", pnr: "PNR100014", seatNumber: "2", ticketPrice: 450.0),
                ]
            ),
        ]
    }
}
