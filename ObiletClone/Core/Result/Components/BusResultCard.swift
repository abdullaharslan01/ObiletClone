//
//  BusResultCard.swift
//  ObiletClone
//
//  Created by abdullah on 22.09.2025.
//

import SwiftUI

struct BusResultCard: View {
    @State var isOppened: Bool = false
    let busResult: BusResult
    var onConfirm: (([SeatSelection]) -> Void)?

    @State private var occupiedSeats: [SeatSelection] = []
    @State private var selectedSeats: [SeatSelection] = []
    

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Image(busResult.companyIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(busResult.departureTime)
                    .foregroundStyle(.oBlack)
                    .font(.system(size: 20, weight: .semibold))
                    .frame(maxWidth: .infinity)

                Text("\(Int(busResult.price)) TL")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.oBlack)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }

            HStack(spacing: 5) {
                HStack {
                    Image(systemName: AppIcons.chair)
                    Text("2+1")
                }

                VStack(spacing: 15) {
                    HStack(spacing: 5) {
                        Image(systemName: AppIcons.clock)
                        Text(busResult.duration)
                            .font(.system(size: 13))
                    }

                    HStack {
                        Text(busResult.departureTerminal)
                        Image(systemName: AppIcons.chevronRight)
                        Text(busResult.arrivalTerminal)
                    }
                    .font(.system(size: 13))
                    .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(.oGray)

            Divider()

            if isOppened {
                VStack(spacing: 12) {
                    FilterButtonView(
                        text: "Sefer Detayları",
                        filledBackground: false,
                        withActionBorder: false,
                        font: .system(size: 12, weight: .semibold)
                    ) {}
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Divider()

                    VStack(spacing: 10) {
                        InfoRowView(icon: AppIcons.sun, iconColor: .orange, text: "Bu seferde çoğunlukla güneş sağ taraftan vuracaktır.")
                        InfoRowView(icon: AppIcons.clock, iconColor: .orange, text: "Otobüs Perşembe'yi Cuma'ya bağlayan gece kalkacaktır.")
                    }

                    HStack(spacing: 10) {
                        SeatStatusItemView(color: .oBlue, text: "Dolu - Erkek")
                        SeatStatusItemView(color: .oPink, text: "Dolu - Kadın")
                        SeatStatusItemView(isStroked: true, text: "Boş Koltuk")
                    }

                    SeatSelectionView(
                        occupiedSeats: occupiedSeats,
                        onSeatSelected: { selection in
                            if let index = selectedSeats.firstIndex(where: { $0.seatNumber == selection.seatNumber }) {
                                selectedSeats[index] = selection
                            } else {
                                selectedSeats.append(selection)
                            }
                        },
                        onSeatDeselected: { seatNumber in
                            selectedSeats.removeAll { $0.seatNumber == seatNumber }
                        }
                    )
                    .frame(height: 250)
                    .padding(.vertical)

                    if !selectedSeats.isEmpty {
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Text("Seçtiginiz koltuklar:")
                                    .font(.system(size: 13))
                                    .foregroundStyle(.oBlack)

                                HStack(spacing: 5) {
                                    ForEach(selectedSeats, id: \.seatNumber) { seat in
                                        SelectedSeatView(number: "\(seat.seatNumber)")
                                    }
                                }
                            }

                            HStack {
                                Text("Toplam Fiyat")
                                    .font(.system(size: 13))
                                    .foregroundStyle(.oBlack)
                                Text("\(selectedSeats.count * Int(busResult.price)) TL")
                                    .font(.system(size: 16, weight: .bold))
                            }
                        }
                    } else {
                        Text("Lütfen Yukardan koluk seçin")
                            .font(.system(size: 13))
                            .foregroundStyle(.oGray)
                    }

                    SearchButtonView(
                        title: "Onayla ve Devam Et",
                        isDisabled: selectedSeats.isEmpty
                    ) {
                        onConfirm?(selectedSeats) 

                    }
                }
            }

            if isOppened {
                Divider()
                    .padding(.top, 40)
            }

            Button {
                withAnimation {
                    isOppened.toggle()
                }
            } label: {
                HStack {
                    Image(systemName: AppIcons.chevronDown)
                        .font(.system(size: 10))
                        .foregroundStyle(.oGray)
                        .padding(5)
                        .overlay {
                            Circle()
                                .stroke(Color.oGray, lineWidth: 1)
                        }
                    Text(isOppened ? "Kapat" : "İncele")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.oGray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
        .background(Color.oBackground)
        .clipShape(RoundedRectangle(cornerRadius: AppRadius.card))
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
        .onAppear {
            self.occupiedSeats = busResult.seatConfiguration.seats
                .filter { $0.isOccupied }
                .compactMap { seat in
                    if let gender = seat.gender {
                        return SeatSelection(seatNumber: seat.number, gender: gender)
                    }
                    return nil
                }
        }
    }
}
