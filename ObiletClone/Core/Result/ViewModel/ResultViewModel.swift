//
//  ResultViewModel.swift
//  ObiletClone
//
//  Created by abdullah on 27.09.2025.
//

import Foundation

class ResultViewModel: ObservableObject {
    @Published var busResults: [BusResult] = []
    @Published var currentDateText: String = "19 Eylül Cuma"
    @Published var fromCity: String = "Gaziantep"
    @Published var toCity: String = "İstanbul Avrupa"

    let timeFilters = ["2+1", "SABAHA KARŞI", "SABAH", "ÖĞLEN", "AKŞAM", "BAĞLAYAN GECE"]

    init() {
        loadBusResults()
    }


    private func loadBusResults() {
        busResults = [
            BusResult(
                companyName: "Metro Turizm",
                companyIcon: "metro",
                departureTime: "08:30",
                arrivalTime: "16:45",
                duration: "8s 15dk",
                price: 250.0,
                departureTerminal: "Gaziantep Otogarı",
                arrivalTerminal: "İstanbul Esenler",
                seatConfiguration: SeatConfiguration(seats: generateSampleSeats()),
                departureDate: Date()
            ),
            BusResult(
                companyName: "Kamil Koç",
                companyIcon: "kamilkoc",
                departureTime: "10:15",
                arrivalTime: "18:30",
                duration: "8s 15dk",
                price: 275.0,
                departureTerminal: "Gaziantep Merkez",
                arrivalTerminal: "İstanbul Bayrampaşa",
                seatConfiguration: SeatConfiguration(seats: generateSampleSeats()),
                departureDate: Date()
            ),
            BusResult(
                companyName: "Ben Turizm",
                companyIcon: "benturizm",
                departureTime: "10:15",
                arrivalTime: "18:30",
                duration: "8s 15dk",
                price: 275.0,
                departureTerminal: "Gaziantep Merkez",
                arrivalTerminal: "İstanbul Bayrampaşa",
                seatConfiguration: SeatConfiguration(seats: generateSampleSeats()),
                departureDate: Date()
            ),
            BusResult(
                companyName: "Seç Turizm",
                companyIcon: "sec",
                departureTime: "10:15",
                arrivalTime: "18:30",
                duration: "8s 15dk",
                price: 275.0,
                departureTerminal: "Gaziantep Merkez",
                arrivalTerminal: "İstanbul Bayrampaşa",
                seatConfiguration: SeatConfiguration(seats: generateSampleSeats()),
                departureDate: Date()
            ),
            BusResult(
                companyName: "Metro",
                companyIcon: "metro",
                departureTime: "14:00",
                arrivalTime: "22:15",
                duration: "8s 15dk",
                price: 300.0,
                departureTerminal: "Gaziantep Otogarı",
                arrivalTerminal: "İstanbul Avrupa",
                seatConfiguration: SeatConfiguration(seats: generateSampleSeats()),
                departureDate: Date()
            ),
        ]
    }

    func handlePreviousDate() {
        print("Previous date tapped")
    }

    func handleNextDate() {
        print("Next date tapped")
    }

    func handleDateSelection() {
        print("Date selection tapped")
    }

    func handleSort() {
        print("Sort tapped")
    }

    func handleFilter() {
        print("Filter tapped")
    }

    func handleTimeFilter(_ filter: String) {
        print("Time filter tapped: \(filter)")
    }



    func handleRouteSwap() {
        print("Route swap tapped")
        let temp = fromCity
        fromCity = toCity
        toCity = temp
    }
}
