//
//  PaymentView.swift
//  ObiletClone
//
//  Created by abdullah on 23.09.2025.
//

import SwiftUI

struct PaymentView: View {
    let selectionSeated: [SeatSelection]
    @StateObject private var viewModel: PaymentViewModel

    @State private var phoneCodeSelection: Bool = false
    @State private var selectedPassengerIndex: Int = 0
    @State private var selectedSavedPassenger: String? = nil

    init(selectionSeated: [SeatSelection]) {
        self.selectionSeated = selectionSeated
        _viewModel = StateObject(wrappedValue: PaymentViewModel(seatCount: selectionSeated.count))
    }

    var body: some View {
        ScrollView {
            VStack {
                contentSection
            }
        }.toolbar {
            ToolbarItem(placement: .title) {
                Image(AppImages.logoWhite)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
            }
        }
    }
}

private extension PaymentView {
    var contentSection: some View {
        VStack {
            busResultSection
            priceInformationSection
            contactSection
            passengerInfoSection
            supportAndRefundSection
            paymentInfoSection
            acceptanceSection
            paymentButtonSection
            certificateSection
        }
        .padding(.horizontal)
        .offset(y: -30)
    }

    var busResultSection: some View {
        PaymentBusResultView(
            busResult: viewModel.busResult,
            seatedSelection: selectionSeated
        ) {} onChangePackage: {}
    }

    var priceInformationSection: some View {
        PaymentPriceInformationView(
            couponCode: $viewModel.couponCode,
            passengerNumber: selectionSeated.count,
            totalPrice: 2500
        ) {}
            .padding(.vertical, 40)
    }

    var contactSection: some View {
        PaymentContactView(
            contactInfo: $viewModel.contactInformation,
            phonCodeSelection: $phoneCodeSelection
        )
    }

    var passengerInfoSection: some View {
        passengerInfoView
            .padding(.vertical, 40)
    }

    var supportAndRefundSection: some View {
        VStack {
            SupportSelectionView(selectedSupport: $viewModel.selectedSupport) {}

            RefundOptionView(
                isSelected: $viewModel.isRefundSelected,
                onDetailsTapped: {
                    viewModel.handleRefundDetailsTap()
                }
            )
        }
    }

    var paymentInfoSection: some View {
        PaymentCardView(title: "ÖDEME BİLGİLERİ") {
            VStack {
                PaymentInfoView(paymentInfo: $viewModel.paymentInfo)
                    .padding(.top, 5)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 40)
    }

    var acceptanceSection: some View {
        PaymentAcceptView(model: $viewModel.paymentAcceptance)
    }

    var paymentButtonSection: some View {
        VStack {
            PaymentButtonView(amount: "1.200 TL") {
                viewModel.handlePayment()
            }
            Divider()
        }
    }

    var certificateSection: some View {
        CertificaView()
    }
}

extension PaymentView {
    @ViewBuilder
    var passengerInfoView: some View {
        PaymentCardView(title: "YOLCU BİLGİLERİ") {
            VStack(spacing: 20) {
                passengerSelectionRow
                savedPassengersSection
                passengerNameSection
                passengerTCSection
            }
        }
    }

    var passengerSelectionRow: some View {
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
            }
            .padding(3)
        }
    }

    var savedPassengersSection: some View {
        VStack {
            Text("KAYITLI YOLCULAR")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.oGray)
                .font(.system(size: 15, weight: .semibold))

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.savedPassengers, id: \.id) { passenger in
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
                }
                .padding(3)
            }
        }
    }

    var passengerNameSection: some View {
        VStack {
            Text("AD SOYAD")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.oGray)
                .font(.system(size: 15, weight: .semibold))

            HStack {
                TextField("AD SOYAD", text: Binding(
                    get: { viewModel.passengerInfos[selectedPassengerIndex].name },
                    set: { viewModel.passengerInfos[selectedPassengerIndex].name = $0 }
                ))

                if !viewModel.passengerInfos[selectedPassengerIndex].name.isEmpty {
                    Image(systemName: AppIcons.checkMarkCircle)
                        .font(.system(size: 23, weight: .regular))
                        .foregroundStyle(.oGreen)
                }
            }

            Divider().padding(.vertical, 5)
        }
    }

    var passengerTCSection: some View {
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
                    get: { viewModel.passengerInfos[selectedPassengerIndex].tcNumber },
                    set: { viewModel.passengerInfos[selectedPassengerIndex].tcNumber = $0 }
                ))
                .keyboardType(.numberPad)

                if !viewModel.passengerInfos[selectedPassengerIndex].tcNumber.isEmpty {
                    Image(systemName: AppIcons.checkMarkCircle)
                        .font(.system(size: 23, weight: .regular))
                        .foregroundStyle(.oGreen)
                }
            }

            Divider().padding(.vertical, 5)
        }
    }
}

private extension PaymentView {
    func selectSavedPassenger(_ passenger: SavedPassenger) {
        viewModel.selectSavedPassenger(passenger, at: selectedPassengerIndex)
        selectedSavedPassenger = passenger.id
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
