//
//  SeatedSelectionView.swift
//  ObiletClone
//
//  Created by abdullah on 22.09.2025.
//

import SwiftUI

struct SeatSelection:Hashable {
    let seatNumber: Int
    let gender: Gender
}

enum SeatStatus {
    case available
    case occupiedMale
    case occupiedFemale
    case selected
}

struct SeatSelectionView: View {
    let occupiedSeats: [SeatSelection]
    let onSeatSelected: (SeatSelection) -> Void
    let onSeatDeselected: (Int) -> Void

    @State private var userSelectedSeats: [SeatSelection] = []
    @State private var showGenderPickerForSeat: Int? = nil
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var seatPositions: [Int: CGRect] = [:]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                Image("bus_skeleton")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 270)

                VStack {
                    HStack {
                        HStack {
                            VStack {
                                seatViewWithPicker(number: 3)
                                seatViewWithPicker(number: 2)
                            }

                            VStack {
                                seatViewWithPicker(number: 6)
                                seatViewWithPicker(number: 5)
                            }

                            VStack {
                                seatViewWithPicker(number: 9)
                                seatViewWithPicker(number: 8)
                            }

                            VStack {
                                seatViewWithPicker(number: 12)
                                seatViewWithPicker(number: 11)
                            }

                            VStack {
                                seatViewWithPicker(number: 15)
                                seatViewWithPicker(number: 14)
                            }

                            VStack {
                                seatViewWithPicker(number: 18)
                                seatViewWithPicker(number: 17)
                            }
                        }.padding(.trailing, 40)

                        HStack {
                            VStack {
                                seatViewWithPicker(number: 21)
                                seatViewWithPicker(number: 20)
                            }
                            VStack {
                                seatViewWithPicker(number: 24)
                                seatViewWithPicker(number: 23)
                            }
                            VStack {
                                seatViewWithPicker(number: 27)
                                seatViewWithPicker(number: 26)
                            }
                            VStack {
                                seatViewWithPicker(number: 30)
                                seatViewWithPicker(number: 29)
                            }
                            VStack {
                                seatViewWithPicker(number: 33)
                                seatViewWithPicker(number: 32)
                            }
                            VStack {
                                seatViewWithPicker(number: 36)
                                seatViewWithPicker(number: 35)
                            }
                            VStack {
                                seatViewWithPicker(number: 40)
                                seatViewWithPicker(number: 39)
                            }
                        }
                    }
                    .padding(.bottom, 50)

                    HStack(alignment: .bottom) {
                        SeatView(
                            number: 0,
                            status: .available,
                            selection: nil,
                            action: { _, _ in }
                        ).opacity(0)

                        seatViewWithPicker(number: 1)
                        seatViewWithPicker(number: 4)
                        seatViewWithPicker(number: 7)
                        seatViewWithPicker(number: 10)
                        seatViewWithPicker(number: 13)
                        seatViewWithPicker(number: 16)
                        seatViewWithPicker(number: 19)
                        seatViewWithPicker(number: 22)
                        seatViewWithPicker(number: 25)
                        seatViewWithPicker(number: 28)
                        seatViewWithPicker(number: 31)
                        seatViewWithPicker(number: 34)

                        VStack {
                            seatViewWithPicker(number: 38)
                            seatViewWithPicker(number: 37)
                        }
                    }
                }
                .offset(x: -80)
                .overlay(alignment: .leading) {
                    GeometryReader { geometry in
                        Path { path in
                            let rect = CGRect(
                                x: 0,
                                y: -19,
                                width: geometry.size.width - 50,
                                height: geometry.size.height + 36
                            )

                            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
                            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
                            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
                            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
                            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
                            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
                        }
                        .stroke(Color.gray.opacity(0.8), lineWidth: 1)
                    }
                }
            }
        }
        .coordinateSpace(name: "SeatContainer")
        .clipped()
        .contentShape(Rectangle())
        .onTapGesture {
            showGenderPickerForSeat = nil
        }
        .overlay(alignment: .topLeading) {
            if let selectedSeat = showGenderPickerForSeat,
               let seatRect = seatPositions[selectedSeat]
            {
                GenderPickerOverlayView(
                    onGenderSelected: { gender in
                        handleGenderSelection(gender, for: selectedSeat)
                    },
                    onCancel: {
                        showGenderPickerForSeat = nil
                    }
                )
                .offset(x: seatRect.midX - 80, y: seatRect.minY - 105)
                .zIndex(1000)
            }
        }
        .alert("Uyarı", isPresented: $showAlert) {
            Button("Tamam", role: .cancel) {}
        } message: {
            Text(alertMessage)
        }
    }

    private func seatViewWithPicker(number: Int) -> some View {
        seatView(number: number)
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            let globalFrame = geometry.frame(in: .named("SeatContainer"))
                            seatPositions[number] = globalFrame
                        }
                        .onChange(of: geometry.frame(in: .named("SeatContainer"))) { newFrame in
                            seatPositions[number] = newFrame
                        }
                }
            )
    }

    private func seatView(number: Int) -> some View {
        let status = getSeatStatus(number: number)
        let selection = userSelectedSeats.first { $0.seatNumber == number }

        return SeatView(
            number: number,
            status: status,
            selection: selection,
            action: { seatNumber, _ in
                handleSeatTap(number: seatNumber)
            }
        )
    }

    private func getSeatStatus(number: Int) -> SeatStatus {
        if let occupiedSeat = occupiedSeats.first(where: { $0.seatNumber == number }) {
            return occupiedSeat.gender == .male ? .occupiedMale : .occupiedFemale
        } else if userSelectedSeats.contains(where: { $0.seatNumber == number }) {
            return .selected
        } else {
            return .available
        }
    }

    private func handleSeatTap(number: Int) {
        let status = getSeatStatus(number: number)

        switch status {
        case .occupiedMale, .occupiedFemale:
            alertMessage = "Seçtiğiniz koltuk zaten alınmış, lütfen boş (beyaz renkli) koltukların birini seçin."
            showAlert = true

        case .selected:
            userSelectedSeats.removeAll { $0.seatNumber == number }
            onSeatDeselected(number)

        case .available:
            if userSelectedSeats.count >= 4 {
                alertMessage = "Firma tek seferde en fazla 4 koltuğun satılmasına izin veriyor."
                showAlert = true
                return
            }

            showGenderPickerForSeat = number
        }
    }

    private func handleGenderSelection(_ gender: Gender, for seatNumber: Int) {
        let selection = SeatSelection(seatNumber: seatNumber, gender: gender)
        userSelectedSeats.append(selection)

        onSeatSelected(selection)

        showGenderPickerForSeat = nil
    }
}

struct ContentView: View {
    @State private var occupiedSeats: [SeatSelection] = [
        SeatSelection(seatNumber: 3, gender: .male),
        SeatSelection(seatNumber: 5, gender: .female),
        SeatSelection(seatNumber: 8, gender: .male),
        SeatSelection(seatNumber: 12, gender: .female),
        SeatSelection(seatNumber: 15, gender: .male),
    ]
    @State private var selectedSeats: [SeatSelection] = []

    var body: some View {
        VStack {
            SeatSelectionView(
                occupiedSeats: occupiedSeats,
                onSeatSelected: { selection in
                    print("Seçilen koltuk: \(selection.seatNumber), Cinsiyet: \(selection.gender)")

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

            if !selectedSeats.isEmpty {
                VStack {
                    Text("Seçilen Koltuklar:")
                        .font(.headline)

                    ForEach(selectedSeats.indices, id: \.self) { index in
                        let selection = selectedSeats[index]
                        Text("Koltuk \(selection.seatNumber) - \(selection.gender == .male ? "Erkek" : "Kadın")")
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
