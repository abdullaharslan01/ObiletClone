//
//  CarSearchView.swift
//  ObiletClone
//
//  Created by abdullah on 08.09.2025.
//

import SwiftUI

struct CarRentalSearchModel: Identifiable, Codable, Equatable {
    var id = UUID()
    var pickupLocation: String
    var dropoffLocation: String
    var isDropoffAtPickupLocation: Bool = true
    var pickupDate: Date?
    var pickupTime: Date?
    var dropoffDate: Date?
    var dropoffTime: Date?
}

struct CarSearchView: View {
    @Binding var searchModel: CarRentalSearchModel
    let onPickupLocationTap: () -> Void
    let onDropoffLocationTap: () -> Void
    let onPickupDateTap: () -> Void
    let onPickupTimeTap: () -> Void
    let onDropoffDateTap: () -> Void
    let onDropoffTimeTap: () -> Void
    let onSearchTap: () -> Void

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter
    }()
    
    private let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
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

                LocationSelectionView(title: "ALIŞ YERİ", selectedLocation: searchModel.pickupLocation) {
                    onPickupLocationTap()
                }

            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.vertical)
                .oCardBackground()
            
            HStack {
                Button {
                    searchModel.isDropoffAtPickupLocation.toggle()
                } label: {
                    Image(systemName: searchModel.isDropoffAtPickupLocation ? "checkmark.square.fill" : "square")
                        .foregroundStyle(searchModel.isDropoffAtPickupLocation ? .oGreen : .gray)
                        .font(.system(size: 20))
                }
                .buttonStyle(.plain)
                
                Text("Alış yerinde teslim edilecek")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.oBlack)
                
                Spacer()
            }

            if !searchModel.isDropoffAtPickupLocation {
                HStack(spacing: 15) {
                    Image(AppImages.location)

                    LocationSelectionView(title: "TESLİM YERİ", selectedLocation: searchModel.dropoffLocation) {
                        onDropoffLocationTap()
                    }

                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.vertical)
                    .oCardBackground()
            }

            HStack(spacing: 15) {
                Image(systemName: AppIcons.calendar)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15)
                    .foregroundStyle(.oGray.opacity(0.7))

                VStack(alignment: .leading, spacing: 15) {
                    Text("ALIŞ TARİHİ")
                        .foregroundStyle(.oMain)
                        .font(.system(size: 14, weight: .bold))

                    if let pickupDate = searchModel.pickupDate {
                        let dateComponents = formatDate(pickupDate)
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
                    onPickupDateTap()
                }

                Rectangle()
                    .fill(.oGray.opacity(0.5))
                    .frame(width: 1, height: 80)

                VStack(alignment: .leading, spacing: 15) {
                    Text("ALIŞ SAATİ")
                        .foregroundStyle(.oMain)
                        .font(.system(size: 14, weight: .bold))

                    if let pickupTime = searchModel.pickupTime {
                        HStack {
                            Image(systemName: "clock")
                                .font(.system(size: 15))
                                .foregroundStyle(.oGray.opacity(0.7))
                            
                            Text(timeFormatter.string(from: pickupTime))
                                .foregroundStyle(.oBlack)
                                .font(.system(size: 20))
                        }
                    } else {
                        Text("Saat Seçiniz")
                            .foregroundStyle(.oGray.opacity(0.5))
                            .font(.system(size: 16, weight: .semibold))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    onPickupTimeTap()
                }
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
                    Text("TESLİM TARİHİ")
                        .foregroundStyle(.oMain)
                        .font(.system(size: 14, weight: .bold))

                    if let dropoffDate = searchModel.dropoffDate {
                        let dateComponents = formatDate(dropoffDate)
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
                    onDropoffDateTap()
                }

                Rectangle()
                    .fill(.oGray.opacity(0.5))
                    .frame(width: 1, height: 80)

                VStack(alignment: .leading, spacing: 15) {
                    Text("TESLİM SAATİ")
                        .foregroundStyle(.oMain)
                        .font(.system(size: 14, weight: .bold))

                    if let dropoffTime = searchModel.dropoffTime {
                        HStack {
                            Image(systemName: "clock")
                                .font(.system(size: 15))
                                .foregroundStyle(.oGray.opacity(0.7))
                            
                            Text(timeFormatter.string(from: dropoffTime))
                                .foregroundStyle(.oBlack)
                                .font(.system(size: 20))
                        }
                    } else {
                        Text("Saat Seçiniz")
                            .foregroundStyle(.oGray.opacity(0.5))
                            .font(.system(size: 16, weight: .semibold))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    onDropoffTimeTap()
                }
            }
            .padding(.horizontal)
            .padding(.vertical)
            .oCardBackground()

            SearchButtonView(title: "Kiralık Araç Ara") {
                onSearchTap()
            }
            .padding(.horizontal, 40)
        }
    }
}

#Preview {
    CarSearchView(
        searchModel: .constant(.init(
            pickupLocation: "Şehir veya Havalimanı seçiniz",
            dropoffLocation: "Şehir veya Havalimanı seçiniz",
            pickupDate: nil,
            pickupTime: nil,
            dropoffDate: nil,
            dropoffTime: nil
        )),
        onPickupLocationTap: {},
        onDropoffLocationTap: {},
        onPickupDateTap: {},
        onPickupTimeTap: {},
        onDropoffDateTap: {},
        onDropoffTimeTap: {},
        onSearchTap: {}
    )
}
