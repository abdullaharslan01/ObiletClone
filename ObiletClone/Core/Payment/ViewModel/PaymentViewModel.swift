//
//  PaymentViewModel.swift
//  ObiletClone
//
//  Created by abdullah on 27.09.2025.
//

import Foundation

class PaymentViewModel: ObservableObject {
    @Published var paymentInfo = PaymentInfo()
    @Published var paymentAcceptance = PaymentAcceptanceModel(isTermsAccepted: true, isEasyCancellationAccepted: false)
    @Published var selectedSupport: SupportType = .standard
    @Published var isRefundSelected: Bool = false
    @Published var passengerInfos: [PassengerInfo]
    @Published var couponCode: String = ""
    @Published var contactInformation: ContactInformation = .init(
        phoneNumber: "5361235361",
        phoneCode: "TR +90",
        email: "test@example.com",
        smsPermission: true
    )

    let savedPassengers: [SavedPassenger] = [
        SavedPassenger(id: "1", name: "Abdullah Arslan", tcNumber: "12345678901"),
        SavedPassenger(id: "2", name: "Ali Arslan", tcNumber: "98765432109"),
        SavedPassenger(id: "3", name: "Burak Arslan", tcNumber: "55566677788"),
    ]

    let busResult: BusResult = .init(
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
    )

    init(seatCount: Int) {
        passengerInfos = Array(repeating: PassengerInfo(), count: seatCount)
    }

    // MARK: - Actions

    func selectSavedPassenger(_ passenger: SavedPassenger, at index: Int) {
        passengerInfos[index].name = passenger.name
        passengerInfos[index].tcNumber = passenger.tcNumber
    }

    func handleRefundDetailsTap() {
        print("Details tapped")
    }

    func handlePayment() {
        print("Payment processing...")
    }

    func passengerSeatedNumbers(for selectionSeated: [SeatSelection]) -> String {
        var seatedNumber = ""

        for (index, passengerInfo) in selectionSeated.enumerated() {
            if index > 0 {
                seatedNumber += ", "
            }
            seatedNumber += passengerInfo.seatNumber.description
        }
        return seatedNumber
    }
}
