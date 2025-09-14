//
//  LogCardView.swift
//  ObiletClone
//
//  Created by abdullah on 13.09.2025.
//

import SwiftUI

struct LogCardView: View {
    let data: Travel
    let onDownloadTicket: (Passenger) -> Void
    let onTicketOperations: (Passenger) -> Void
    
    var body: some View {
        VStack(spacing: 15) {
            Image(data.brandIconName)
                .resizable()
                .scaledToFit()
                .frame(height: 35)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            Rectangle()
                .fill(.oBackground)
                .frame(height: 1)
                .frame(maxWidth: .infinity)

            VStack(spacing: 10) {
                VStack(spacing: 0) {
                    Text("\(data.departureCity) (\(data.departureTerminal)) - \(data.arrivalCity)")
                    Text("(\(data.arrivalTerminal))")
                }.font(.system(size: 16))

                Text(data.travelDate.formattedForTravel())
                    .font(.system(size: 15))

            }
            .foregroundStyle(.oBlack)
            .padding(.bottom)

            VStack(spacing: 18) {
                ForEach(data.passengers) { passenger in
                    PassengerCardView(
                        passenger: passenger,
                        onDownloadTicket: onDownloadTicket,
                        onTicketOperations: onTicketOperations
                    )
                }
            }

            Rectangle()
                .fill(.oBackground)
                .frame(height: 1)
                .frame(maxWidth: .infinity)

            TotalPriceView(totalPrice: data.totalPrice)

            TripDetailsButton()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: AppRadius.card)
                .fill(.oGray.opacity(0.2))
        )
    }
}

struct PassengerCardView: View {
    let passenger: Passenger
    let onDownloadTicket: (Passenger) -> Void
    let onTicketOperations: (Passenger) -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            Text(passenger.fullName)
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.oBlack)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack {
                PassengerDetailItem(title: "PNR", value: passenger.pnr)
                PassengerDetailItem(title: "KOLTUK NO", value: passenger.seatNumber)
                PassengerDetailItem(title: "FİYAT", value: "\(passenger.ticketPrice.formatted(.number.grouping(.automatic))) TL")
            }

            HStack {
                ActionButton(
                    title: "E-BİLET İNDİR",
                    action: { onDownloadTicket(passenger) }
                )
                
                Spacer()
                
                ActionButton(
                    title: "BİLET İŞLEMLERİ",
                    action: { onTicketOperations(passenger) }
                )
            }
            .padding(.top)
        }
    }
}

struct PassengerDetailItem: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.system(size: 16))
                .foregroundStyle(.oGray)
            Text(value)
                .font(.system(size: 18))
                .foregroundStyle(.oBlack)
        }
        .frame(maxWidth: .infinity)
    }
}

struct ActionButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundStyle(.oGray)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: AppRadius.card)
                        .fill(.oWhite)
                )
        }
        .buttonStyle(.plain)
    }
}

struct TotalPriceView: View {
    let totalPrice: Double
    
    var body: some View {
        HStack {
            Text("Toplam Tutar:")
                .foregroundStyle(.oGray)

            Text("\(totalPrice.formatted(.number.grouping(.automatic))) TL")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.oBlack)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.horizontal)
        .overlay(alignment: .bottom) {
           OTripDivider()
        }
    }
}

struct OTripDivider: View {
    var body: some View {
        Rectangle()
            .fill(.oBackground)
            .frame(height: 1)
            .frame(maxWidth: .infinity)
    }
}

struct TripDetailsButton: View {
    var body: some View {
        Button {
            print("Sefer detayları gösteriliyor")
        } label: {
            Text("Sefer Detayları")
                .foregroundStyle(.oGray)
                .font(.system(size: 16, weight: .medium))
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .fill(.oGray)
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)
                }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.top)
        .buttonStyle(.plain)
    }
}

struct PnrRequestView: View {
    let onTapGesture: () -> Void

    var body: some View {
        Button(action: onTapGesture) {
            Text("PNR Numarasi ile Bilet Sorgula")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.oGray)
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.oGray)
                }.padding(.vertical)
        }
        .buttonStyle(.plain)
        .padding(.horizontal)
    }
}

