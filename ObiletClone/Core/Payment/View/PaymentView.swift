//
//  PaymentView.swift
//  ObiletClone
//
//  Created by abdullah on 23.09.2025.
//

import SwiftUI

struct PaymentView: View {
    let selectionSeated: [SeatSelection]

    @State private var paymentInfo = PaymentInfo()
    @State var paymentAcceptance = PaymentAcceptanceModel(isTermsAccepted: true, isEasyCancellationAccepted: false)

    @State private var selectedSupport: SupportType = .standard
    @State private var isRefundSelected: Bool = false
    @State private var phoneCodeSelection: Bool = false
    @State private var selectedPassengerIndex: Int = 0
    @State private var passengerInfos: [PassengerInfo]
    @State private var selectedSavedPassenger: String? = nil
    @State private var couponCode: String = ""
    @State private var savedPassengers: [SavedPassenger] = [
        SavedPassenger(id: "1", name: "Abdullah Arslan", tcNumber: "12345678901"),
        SavedPassenger(id: "2", name: "Ali Arslan", tcNumber: "98765432109"),
        SavedPassenger(id: "3", name: "Burak Arslan", tcNumber: "55566677788"),
    ]

    init(selectionSeated: [SeatSelection]) {
        self.selectionSeated = selectionSeated
        _passengerInfos = State(initialValue: Array(repeating: PassengerInfo(), count: selectionSeated.count))
    }

    @State var contactInformation: ContactInformation = .init(
        phoneNumber: "5361235361",
        phoneCode: "TR +90",
        email: "test@example.com",
        smsPermission: true
    )

    @State var busResult: BusResult = .init(
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

    var body: some View {
        ScrollView {
            VStack {
                Rectangle()
                    .fill(.oMain)
                    .frame(height: 100)
                    .overlay {
                        ZStack {
                            Image(AppImages.logoWhite)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                            
                            HStack {
                                Button {} label: {
                                    Image(systemName: AppIcons.chevronLeft)
                                        .font(.system(size: 28))
                                        .foregroundStyle(.oWhite)
                                        .padding(.leading)
                                }
                                
                                Spacer()
                            }
                        }
                    }

                VStack {
                    PaymentBusResultView(busResult: busResult, seatedSelection: selectionSeated) {} onChangePackage: {}

                    PaymentPriceInformationView(couponCode: $couponCode, passengerNumber: selectionSeated.count, totalPrice: 2500) {}
                        .padding(.vertical, 40)

                    PaymentContactView(contactInfo: $contactInformation, phonCodeSelection: $phoneCodeSelection)

                    passengerInfoView
                        .padding(.vertical, 40)

                    SupportSelectionView(selectedSupport: $selectedSupport) {}
                    RefundOptionView(
                        isSelected: $isRefundSelected,
                        onDetailsTapped: {
                            print("Details tapped")
                        }
                    )

                    PaymentCardView(title: "ÖDEME BİLGİLERİ") {
                        VStack {
                            PaymentInfoView(paymentInfo: $paymentInfo)
                                .padding(.top, 5)

                        }.frame(maxWidth: .infinity, alignment: .leading)
                    }.padding(.vertical, 40)

                    PaymentAcceptView(model: $paymentAcceptance)

                    PaymentButtonView(amount: "1.200 TL") {}
                    Divider()

                    CertificaView()
                }.padding(.horizontal).offset(y:-30)
            }
        }
    }

    private func selectSavedPassenger(_ passenger: SavedPassenger) {
        passengerInfos[selectedPassengerIndex].name = passenger.name
        passengerInfos[selectedPassengerIndex].tcNumber = passenger.tcNumber
        selectedSavedPassenger = passenger.id
    }

    private func passengerSeatedNumbers() -> String {
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

extension PaymentView {
    @ViewBuilder
    var passengerInfoView: some View {
        PaymentCardView(title: "YOLCU BİLGİLERİ") {
            VStack(spacing: 20) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Array(selectionSeated.enumerated()), id: \.offset) { index, seat in
                            Button {
                                selectedPassengerIndex = index
                            } label: {
                                HStack {
                                    Text("\(index + 1). Yolcu")
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundStyle(selectedPassengerIndex == index ? .oMain : .oBlack)

                                    Text("(Koltuk No: \(seat.seatNumber))")
                                        .foregroundStyle(selectedPassengerIndex == index ? .oMain : .oGray)
                                        .font(.system(size: 12, weight: .regular))
                                }
                                .padding(8)
                                .overlay {
                                    RoundedRectangle(cornerRadius: AppRadius.card)
                                        .stroke(selectedPassengerIndex == index ? Color.oMain : Color.oBlack)
                                }
                            }
                        }
                    }.padding(3)
                }

                VStack {
                    Text("KAYITLI YOLCULAR")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.oGray)
                        .font(.system(size: 15, weight: .semibold))

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(savedPassengers, id: \.id) { passenger in
                                Button {
                                    selectSavedPassenger(passenger)
                                } label: {
                                    Text(passenger.name)
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundStyle(selectedSavedPassenger == passenger.id ? .oMain : .oBlack)
                                        .frame(minWidth: 75)
                                        .padding(8)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: AppRadius.card)
                                                .stroke(selectedSavedPassenger == passenger.id ? Color.oMain : Color.oBlack)
                                        }
                                }
                            }
                        }.padding(3)
                    }
                }

                VStack {
                    Text("AD SOYAD")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.oGray)
                        .font(.system(size: 15, weight: .semibold))

                    HStack {
                        TextField("AD SOYAD", text: Binding(
                            get: { passengerInfos[selectedPassengerIndex].name },
                            set: { passengerInfos[selectedPassengerIndex].name = $0 }
                        ))

                        if !passengerInfos[selectedPassengerIndex].name.isEmpty {
                            Image(systemName: AppIcons.checkMarkCircle)
                                .font(.system(size: 23, weight: .regular))
                                .foregroundStyle(.oGreen)
                        }
                    }

                    Divider().padding(.vertical, 5)
                }

                VStack {
                    HStack {
                        HStack {
                            Text("T.C. KİMLİK NO")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(.oGray)
                                .font(.system(size: 15, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text("T.C Vatandaşı değilim.")
                                .foregroundStyle(.oGray)
                                .font(.system(size: 12, weight: .regular))

                            Button {} label: {
                                Image(systemName: AppIcons.square)
                                    .font(.system(size: 23, weight: .regular))
                                    .foregroundStyle(.oGray.opacity(0.5))
                            }
                        }
                    }

                    HStack {
                        TextField("T.C. KİMLİK NO", text: Binding(
                            get: { passengerInfos[selectedPassengerIndex].tcNumber },
                            set: { passengerInfos[selectedPassengerIndex].tcNumber = $0 }
                        ))
                        .keyboardType(.numberPad)

                        if !passengerInfos[selectedPassengerIndex].tcNumber.isEmpty {
                            Image(systemName: AppIcons.checkMarkCircle)
                                .font(.system(size: 23, weight: .regular))
                                .foregroundStyle(.oGreen)
                        }
                    }

                    Divider().padding(.vertical, 5)
                }
            }
        }
    }
}

#Preview {
    let sampleSeats = [
        SeatSelection(seatNumber: 20, gender: .male),
        SeatSelection(seatNumber: 21, gender: .female),
    ]

    NavigationView {
        PaymentView(selectionSeated: sampleSeats)
    }
}
