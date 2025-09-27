//
//  PaymentBusResultView.swift
//  ObiletClone
//
//  Created by abdullah on 24.09.2025.
//

import SwiftUI

struct PaymentBusResultView: View {
    let busResult: BusResult
    let seatedSelection: [SeatSelection]

    let onSelectStandard: () -> Void
    let onChangePackage: () -> Void

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(busResult.companyIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text(busResult.departureTime)
                        .foregroundStyle(.oBlack)
                        .font(.system(size: 16, weight: .semibold))

                    Text(busResult.departureDate.formattedForPayment())
                        .foregroundStyle(.oBlack)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }

                HStack {
                    Text(busResult.departureTerminal)
                    Text(">")
                        .foregroundStyle(.oGray)
                    Text(busResult.arrivalTerminal)
                }
                .font(.system(size: 14))
                .foregroundStyle(.oBlack)

                HStack(spacing: 20) {
                    Text("Paket Seçimi")
                        .foregroundStyle(.oBlack)

                    Button(action: onSelectStandard) {
                        ZStack {
                            Text("Standart")
                                .foregroundStyle(.oMain)
                                .overlay(alignment: .bottom) {
                                    Rectangle()
                                        .fill(.oMain)
                                        .frame(height: 1)
                                }
                        }
                        .padding(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: AppRadius.card)
                                .fill(.oMain.opacity(0.2))
                                .overlay {
                                    RoundedRectangle(cornerRadius: AppRadius.card)
                                        .stroke(.oGray.opacity(0.3), lineWidth: 1)
                                }
                        }
                    }

                    Button(action: onChangePackage) {
                        Text("Değiştir")
                            .foregroundStyle(.oGray)
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .fill(.oGray)
                                    .frame(height: 1)
                            }
                    }
                }
                .font(.system(size: 16, weight: .semibold))
                .padding(.vertical)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Bilet İşlemleri: ")
                        .font(.system(size: 16, weight: .semibold))
                    + Text("Seferin 6 saat öncesine kadar biletinizi açığa alabilir, değiştirebilir ya da iptal edebilirsiniz.")
                        .font(.system(size: 16, weight: .regular))

                    HStack(alignment: .top) {
                        Image(systemName: AppIcons.infoCircle)
                        Text("Sefer Çarşamba'yı Perşembeye'ye bağlayan gece gerçekleşecektir")
                    }
                    .foregroundStyle(.oMain)
                    .font(.system(size: 16, weight: .semibold))
                }
            }

            Divider()

            HStack {
                Image(systemName: AppIcons.personFill)
                    .foregroundStyle(.oGray)

                Text("\(seatedSelection.count) Yolcu")
                    .foregroundStyle(.oBlack)
                    .font(.system(size: 20))

                Text("(Koltuk No: \(passengerSeatedNumbers()))")
                    .foregroundStyle(.oGray)
                    .font(.system(size: 16))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: AppRadius.card)
                .fill(.white)
                .shadow(color: .black.opacity(0.1), radius: 8)
        )
    }

    private func passengerSeatedNumbers() -> String {
        seatedSelection
            .map { $0.seatNumber.description}
            .joined(separator: ", ")
    }
}
