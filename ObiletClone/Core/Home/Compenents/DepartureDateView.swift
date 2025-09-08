//
//  DepartureDateView.swift
//  ObiletClone
//
//  Created by abdullah on 08.09.2025.
//

import SwiftUI

struct DepartureDateView: View {
    @Binding var searchModel: BusSearchModel
    let onDateTap: () -> Void
    let onTodayTap: () -> Void
    let onTomorrowTap: () -> Void

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "tr_TR")
        formatter.dateFormat = "d MMMM EEEE"
        return formatter
    }

    private var isToday: Bool {
        Calendar.current.isDate(searchModel.departureDate, inSameDayAs: Date())
    }

    private var isTomorrow: Bool {
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
        return Calendar.current.isDate(searchModel.departureDate, inSameDayAs: tomorrow)
    }

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: AppIcons.calendar)
                .resizable()
                .scaledToFit()
                .frame(width: 15)
                .foregroundStyle(.oGray.opacity(0.7))

            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading) {
                    Text("Gidiş Tarihi")
                        .foregroundStyle(.oMain)
                        .font(.system(size: 18, weight: .bold))

                    Text(dateFormatter.string(from: searchModel.departureDate))
                        .foregroundStyle(.oBlack)
                        .font(.system(size: 20, weight: .regular))
                        .onTapGesture {
                            onDateTap()
                        }
                }

                HStack {
                    Button {
                        onTodayTap()
                    } label: {
                        Text("Bugün")
                            .foregroundStyle(isToday ? .oWhite : .oBlack)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .background(
                                RoundedRectangle(cornerRadius: AppRadius.card)
                                    .fill(isToday ? .oMain : Color.clear)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: AppRadius.card)
                                    .stroke(.oGray.opacity(0.3), lineWidth: isToday ? 0 : 1)
                            )
                    }

                    Button {
                        onTomorrowTap()
                    } label: {
                        Text("Yarın")
                            .foregroundStyle(isTomorrow ? .oWhite : .oBlack)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .background(
                                RoundedRectangle(cornerRadius: AppRadius.card)
                                    .fill(isTomorrow ? .oMain : Color.clear)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: AppRadius.card)
                                    .stroke(.oGray.opacity(0.3), lineWidth: isTomorrow ? 0 : 1)
                            )
                    }
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
