//
//  ResultView.swift
//  ObiletClone
//
//  Created by abdullah on 17.09.2025.
//

import SwiftUI

// MARK: - Data Models

struct BusResult: Identifiable {
    let id = UUID()
    let companyName: String
    let companyIcon: String
    let departureTime: String
    let arrivalTime: String
    let duration: String
    let price: Double
    let departureTerminal: String
    let arrivalTerminal: String
    let seatConfiguration: SeatConfiguration
}

struct SeatConfiguration {
    let seats: [Seat]

    var availableSeats: Int {
        seats.filter { !$0.isOccupied }.count
    }

    var totalSeats: Int {
        seats.count
    }
}

struct Seat {
    let number: Int
    let type: SeatType
    let isOccupied: Bool
    let gender: Gender?
}

enum SeatType {
    case single
    case double
}

enum Gender {
    case male
    case female
}

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

// MARK: - Main ResultView

struct ResultView: View {
    @StateObject private var filterManager = FilterManager()

    // Sample data
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
            seatConfiguration: SeatConfiguration(seats: generateSampleSeats())
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
            seatConfiguration: SeatConfiguration(seats: generateSampleSeats())
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
            seatConfiguration: SeatConfiguration(seats: generateSampleSeats())
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
            seatConfiguration: SeatConfiguration(seats: generateSampleSeats())
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
            seatConfiguration: SeatConfiguration(seats: generateSampleSeats())
        ),
    ]

    var body: some View {
        VStack(spacing: 0) {
            // Top Navigation Buttons
            HStack {
                NavigationButtonView(text: "Önceki", icon: "chevron.left") {}
                NavigationButtonView(text: "19 Eylül Cuma", icon: "calendar", maxWidth: .infinity) {}
                NavigationButtonView(text: "Sonraki", icon: "chevron.right", iconPosition: .trailing) {}
            }
            .padding()
            .background(Color.oMain)

            // Filters Scroll
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

            // Bus Results List
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(busResults) { busResult in
                        BusResultCard(busResult: busResult)
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
        }
    }
}

// MARK: - BusResultCard

struct BusResultCard: View {
    @State var isOppened: Bool = true
    let busResult: BusResult

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

                    
                    
                    
                    
                    
                    
                    
                    // Buraya koltuk seçme gelecek 
                    
                    
                    
                    
                    
                    
                    
                    
                    // Sadece koltuk seçimi olursa burası görenecek ve kullanıncnı seçtiği koltuklar burda görenecek.
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("Seçtiginiz koltuklar:")
                                .font(.system(size: 13))
                                .foregroundStyle(.oBlack)

                            HStack(spacing: 5) {
                                SelectedSeatView(number: "5")
                                SelectedSeatView(number: "6")
                                SelectedSeatView(number: "11")
                                SelectedSeatView(number: "12")
                            }
                        }

                        HStack {
                            Text("Toplam Fiyat")
                                .font(.system(size: 13))
                                .foregroundStyle(.oBlack)
                            Text("3.900 TL")
                                .font(.system(size: 16, weight: .bold))
                        }
                    }

                    // Eğer hiç koltuk seçilmezse görünecek yoksa bu gizli olacak
                    Text("Lütfen Yukardan koluk seçin")
                        .font(.system(size: 13))
                        .foregroundStyle(.oGray)

                    // Koltuk seçme durumuda göre isDisabled durumu değişecek.
                    SearchButtonView(title: "Onayla ve Devam Et", isDisabled: true) {}
                }
                .disabled(true)
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
    }
}

// MARK: - Sample Seat Generator

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

// MARK: - Preview

#Preview {
    NavigationView {
        ResultView()
    }
}
