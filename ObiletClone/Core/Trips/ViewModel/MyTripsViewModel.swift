//
//  MyTripsViewModel.swift
//  ObiletClone
//
//  Created by abdullah on 27.09.2025.
//

import Foundation

class MyTripsViewModel: ObservableObject {
    @Published var travels: [Travel] = []
    @Published var isLoading = true
    @Published var selectedCategory: TransitCategory = .bus
    
    func loadTravels(completion: @escaping () -> Void) {
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            self.fetchBusData()
            self.isLoading = false
            completion()
        }
    }
    
    func loadTravelsForCategory() {
        switch selectedCategory {
        case .bus:
            fetchBusData()
        case .plane:
            fetchFlightData()
        case .hotel:
            fetchHotelData()
        case .car:
            fetchCarData()
        default:
            break
        }
    }
    
    private func fetchBusData() {
        travels = Travel.sampleTravels
    }
    
    private func fetchFlightData() {
        travels = []
    }
    
    private func fetchHotelData() {
        travels = []
    }
    
    private func fetchCarData() {
        travels = []
    }
    
    func handleCategorySearch() {
        loadTravelsForCategory()
    }
    
    func handlePnrRequest() {
        print("PNR sorgu talebi")
    }

    func handleDownloadTicket(for passenger: Passenger) {
        print("E-bilet indiriliyor: \(passenger.fullName) - PNR: \(passenger.pnr)")
    }

    func handleTicketOperations(for passenger: Passenger) {
        print("Bilet işlemleri: \(passenger.fullName) - PNR: \(passenger.pnr)")
    }
}
