//
//  PlaneSearchView.swift
//  ObiletClone
//
//  Created by abdullah on 08.09.2025.
//

import SwiftUI

struct PlaneSearchView: View {
    @Binding var searchModel: PlaneSearchModel
    let onFromLocationTap: () -> Void
    let onToLocationTap: () -> Void
    let onDepartureDateTap: () -> Void
    let onReturnDateTap: () -> Void
    let onPassengerTap: () -> Void
    let onSearchTap: () -> Void

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter
    }()

    private func formatDate(_ date: Date) -> (day: String, month: String, weekday: String) {
        dateFormatter.dateFormat = "d"
        let day = dateFormatter.string(from: date)

        dateFormatter.dateFormat = "MMMM"
        let month = dateFormatter.string(from: date)

        dateFormatter.dateFormat = "EEEE"
        let weekday = dateFormatter.string(from: date)

        return (day, month, weekday)
    }

    var body: some View {
        VStack(spacing: 25) {
            HStack(spacing: 15) {
                LocationDartView()

                RouteSelectionView(
                    fromCity: $searchModel.fromCity,
                    toCity: $searchModel.toCity,
                    onFromLocationTap: onFromLocationTap,
                    onToLocationTap: onToLocationTap
                )
            }
            .padding(.horizontal)
            .padding(.vertical)
            .oCardBackground()

            HStack(spacing: 15) {
                Image(systemName: AppIcons.calendar)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15)
                    .foregroundStyle(.oGray.opacity(0.7))

                VStack(alignment: .leading, spacing: 15) {
                    Text("GİDİŞ TARİHİ")
                        .foregroundStyle(.oMain)
                        .font(.system(size: 14, weight: .bold))

                    if let departureDate = searchModel.departureDate {
                        let dateComponents = formatDate(departureDate)
                        HStack {
                            Text(dateComponents.day)
                                .font(.system(size: 35, weight: .semibold))
                                .foregroundStyle(.oBlack)
                            VStack(alignment: .leading) {
                                Text(dateComponents.month)
                                Text(dateComponents.weekday)
                            }
                            .font(.caption)
                            .foregroundStyle(.oGray.opacity(0.7))
                        }
                    } else {
                        Text("Tarih Seçiniz")
                            .foregroundStyle(.oGray.opacity(0.5))
                            .font(.system(size: 16, weight: .semibold))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    onDepartureDateTap()
                }

                Rectangle()
                    .fill(.oGray.opacity(0.5))
                    .frame(width: 1, height: 80)

                VStack(alignment: .leading, spacing: 15) {
                    Text("DÖNÜŞ TARİHİ")
                        .foregroundStyle(.oMain)
                        .font(.system(size: 14, weight: .bold))

                    if let returnDate = searchModel.returnDate {
                        let dateComponents = formatDate(returnDate)
                        HStack {
                            Text(dateComponents.day)
                                .font(.system(size: 35, weight: .semibold))
                                .foregroundStyle(.oBlack)
                            VStack(alignment: .leading) {
                                Text(dateComponents.month)
                                Text(dateComponents.weekday)
                            }
                            .font(.caption)
                            .foregroundStyle(.oGray.opacity(0.7))
                        }
                    } else {
                        HStack {
                            Text("Dönüş Ekle")
                                .foregroundStyle(.oGray.opacity(0.5))
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            Button {
                                if searchModel.returnDate != nil {
                                    searchModel.returnDate = nil
                                } else {
                                    onReturnDateTap()
                                }
                            } label: {
                                Image(systemName: searchModel.returnDate != nil ? "xmark.circle" : "plus.circle")
                                    .foregroundStyle(.oGray.opacity(0.5))
                                    .font(.system(size: 20))
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    onReturnDateTap()
                }

              
            }
            .padding(.horizontal)
            .padding(.vertical)
            .oCardBackground()

            Button {
                onPassengerTap()
            } label: {
                HStack {
                    HStack(spacing: 15) {
                        Image(systemName: AppIcons.accountFill)
                            .foregroundStyle(.oGray.opacity(0.5))

                        Text(searchModel.passengerSummary)
                            .foregroundStyle(.oBlack)
                            .font(.system(size: 13))
                            .lineLimit(1)
                    }

                    Text("Yolcu Ekle")
                        .foregroundStyle(.oGray.opacity(0.5))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.horizontal)
                .padding(.vertical)
                .oCardBackground()
            }

            HStack {
                Spacer()
                Text("Sadece aktarmasız uçuşları göster")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.oGray.opacity(0.5))

                Toggle("", isOn: $searchModel.directOnly)
                    .labelsHidden()
            }

            SearchButtonView(title: "Uçuş Ara") {
                onSearchTap()
            }
            .padding(.horizontal, 40)
        }
    }
}

#Preview {
    PlaneSearchView(
        searchModel: .constant(.init(
            fromCity: "İl, ilçe veya Havaalanı Seçiniz",
            toCity: "İl, ilçe veya Havaalanı Seçiniz",
            departureDate: nil,
            returnDate: nil
        )),
        onFromLocationTap: {},
        onToLocationTap: {},
        onDepartureDateTap: {},
        onReturnDateTap: {},
        onPassengerTap: {},
        onSearchTap: {}
    )
}
