//
//  HotelSearchView.swift
//  ObiletClone
//
//  Created by abdullah on 08.09.2025.
//

import SwiftUI


struct HotelSearchView: View {
    @Binding var searchModel: HotelSearchModel
    let onToLocationTap: () -> Void
    let onCheckInDateTap: () -> Void
    let onCheckOutDateTap: () -> Void
    let onGuestTap: () -> Void
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
                Image(AppImages.location)

                LocationSelectionView(title: "Nereye", selectedLocation: searchModel.toCity) {
                    onToLocationTap()
                }

            }.frame(maxWidth: .infinity, alignment: .leading)
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
                    Text("GİRİŞ TARİHİ")
                        .foregroundStyle(.oMain)
                        .font(.system(size: 14, weight: .bold))

                    if let checkInDate = searchModel.checkInDate {
                        let dateComponents = formatDate(checkInDate)
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
                    onCheckInDateTap()
                }

                Rectangle()
                    .fill(.oGray.opacity(0.5))
                    .frame(width: 1, height: 80)

                VStack(alignment: .leading, spacing: 15) {
                    Text("ÇIKIŞ TARİHİ")
                        .foregroundStyle(.oMain)
                        .font(.system(size: 14, weight: .bold))

                    if let checkOutDate = searchModel.checkOutDate {
                        let dateComponents = formatDate(checkOutDate)
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
                            .font(.system(size: 16, weight: .regular))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    onCheckOutDateTap()
                }
            }
            .padding(.horizontal)
            .padding(.vertical)
            .oCardBackground()

            Button {
                onGuestTap()
            } label: {
                HStack {
                    HStack(spacing: 15) {
                        Image(systemName: AppIcons.accountFill)
                            .foregroundStyle(.oGray.opacity(0.5))

                        Text(searchModel.guestSummary)
                            .foregroundStyle(.oBlack)
                            .font(.system(size: 13))
                            .lineLimit(1)
                    }

                    Text("Misafir Ekle")
                        .foregroundStyle(.oGray.opacity(0.5))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.horizontal)
                .padding(.vertical)
                .oCardBackground()
            }

            HStack {
                Button {
                    searchModel.isBusinessTrip.toggle()
                } label: {
                    Image(systemName: searchModel.isBusinessTrip ? "checkmark.square.fill" : "square")
                        .foregroundStyle(searchModel.isBusinessTrip ? .oGreen : .gray)
                        .font(.system(size: 20))
                }
                .buttonStyle(.plain)
                
                Text("İş için seyahat ediyorum")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.oGray.opacity(0.5))
                
                Spacer()
            }

            SearchButtonView(title: "Otel Ara") {
                onSearchTap()
            }
            .padding(.horizontal, 40)
        }
    }
}

#Preview {
    HotelSearchView(
        searchModel: .constant(.init(
            toCity: "İl, ilçe veya Otel Seçiniz",
            checkInDate: nil,
            checkOutDate: nil
        )),
        onToLocationTap: {},
        onCheckInDateTap: {},
        onCheckOutDateTap: {},
        onGuestTap: {},
        onSearchTap: {}
    )
}
