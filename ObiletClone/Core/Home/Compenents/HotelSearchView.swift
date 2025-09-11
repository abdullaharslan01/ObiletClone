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

    var toLocationTitle: String
    var checkInTitle: String
    var checkOutTitle: String
    var selectDateText: String
    var addGuestText: String
    var businessTripText: String
    var searchButtonText: String

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

    init(
        searchModel: Binding<HotelSearchModel>,
        onToLocationTap: @escaping () -> Void,
        onCheckInDateTap: @escaping () -> Void,
        onCheckOutDateTap: @escaping () -> Void,
        onGuestTap: @escaping () -> Void,
        onSearchTap: @escaping () -> Void,
        toLocationTitle: String = "Nereye",
        checkInTitle: String = "GİRİŞ TARİHİ",
        checkOutTitle: String = "ÇIKIŞ TARİHİ",
        selectDateText: String = "Tarih Seçiniz",
        addGuestText: String = "Misafir Ekle",
        businessTripText: String = "İş için seyahat ediyorum",
        searchButtonText: String = "Otel Ara"
    ) {
        _searchModel = searchModel
        self.onToLocationTap = onToLocationTap
        self.onCheckInDateTap = onCheckInDateTap
        self.onCheckOutDateTap = onCheckOutDateTap
        self.onGuestTap = onGuestTap
        self.onSearchTap = onSearchTap
        self.toLocationTitle = toLocationTitle
        self.checkInTitle = checkInTitle
        self.checkOutTitle = checkOutTitle
        self.selectDateText = selectDateText
        self.addGuestText = addGuestText
        self.businessTripText = businessTripText
        self.searchButtonText = searchButtonText
    }

    var body: some View {
        VStack(spacing: 25) {
            HStack(spacing: 15) {
                Image(AppImages.location)

                LocationSelectionView(title: toLocationTitle, selectedLocation: searchModel.toCity) {
                    onToLocationTap()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
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
                    Text(checkInTitle)
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
                        Text(selectDateText)
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
                    Text(checkOutTitle)
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
                        Text(selectDateText)
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

                    Text(addGuestText)
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
                    Image(systemName: searchModel.isBusinessTrip ? AppIcons.checkMarkFill: AppIcons.square)
                        .foregroundStyle(searchModel.isBusinessTrip ? .oGreen : .gray)
                        .font(.system(size: 20))
                }
                .buttonStyle(.plain)

                Text(businessTripText)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.oGray.opacity(0.5))

                Spacer()
            }

            SearchButtonView(title: searchButtonText) {
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
