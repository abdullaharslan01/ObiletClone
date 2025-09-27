//
//  ResultView.swift
//  ObiletClone
//
//  Created by abdullah on 17.09.2025.
//

import SwiftUI

// MARK: - Data Models


class FilterManager: ObservableObject {
    @Published var selectedFilters: [String: Int] = [:]

    func selectFilter(_ filterName: String) {
        selectedFilters[filterName] = (selectedFilters[filterName] ?? 0) + 1
    }

    func deselectFilter(_ filterName: String) {
        selectedFilters.removeValue(forKey: filterName)
    }

    func getFilterCount(_ filterName: String) -> Int {
        return selectedFilters[filterName] ?? 0
    }

    func isFilterSelected(_ filterName: String) -> Bool {
        return selectedFilters[filterName] != nil
    }
}


struct ResultView: View {
    @StateObject private var filterManager = FilterManager()

    let busResults = [
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

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                NavigationButtonView(text: "Önceki", icon: "chevron.left") {}
                NavigationButtonView(text: "19 Eylül Cuma", icon: "calendar", maxWidth: .infinity) {}
                NavigationButtonView(text: "Sonraki", icon: "chevron.right", iconPosition: .trailing) {}
            }
            .padding()
            .background(Color.oMain)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    FilterButtonView(text: "SIRALA", icon: AppIcons.arrowUpDown, filledBackground: true) {}
                    FilterButtonView(text: "FİLTRE", icon: AppIcons.filter, filledBackground: true) {}
                    FilterButtonView(text: "2+1") {}
                    FilterButtonView(text: "SABAHA KARŞI") {}
                    FilterButtonView(text: "SABAH") {}
                    FilterButtonView(text: "ÖĞLEN") {}
                    FilterButtonView(text: "AKŞAM") {}
                    FilterButtonView(text: "BAĞLAYAN GECE") {}
                }
                .padding(.horizontal)
            }
            .frame(height: 60)

            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(busResults) { busResult in
                        BusResultCard(busResult: busResult) {onConformation in  }
                    }
                }
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Gaziantep")
                    Button {} label: {
                        Image(systemName: AppIcons.changeArrow)
                    }
                    Text("İstanbul Avrupa")
                }
                .foregroundStyle(.oWhite)
            }
        }.navigationBarTitleDisplayMode(.inline)
    }
}




func generateSampleSeats() -> [Seat] {
    var seats: [Seat] = []

    for i in 1 ... 38 {
        let seatType: SeatType = (i % 3 == 0) ? .single : .double
        let isOccupied = Bool.random()
        let gender: Gender? = isOccupied ? (Bool.random() ? .male : .female) : nil
        seats.append(Seat(number: i, type: seatType, isOccupied: isOccupied, gender: gender))
    }

    return seats
}

#Preview {
    NavigationView {
        ResultView()
    }
}
