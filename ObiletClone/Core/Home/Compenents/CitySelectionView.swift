//
//  CitySelectionView.swift
//  ObiletClone
//
//  Created by abdullah on 11.09.2025.
//

import SwiftUI

struct CitySelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @State var searchText: String = ""

    let recentSearches: [CityModel]
    let popularStops: [CityModel]
    let otherStops: [CityModel]
    let onCitySelected: (CityModel) -> Void

    let titleText: String
    let placeholderText: String

    init(
        recentSearches: [CityModel],
        popularStops: [CityModel],
        otherStops: [CityModel],
        onCitySelected: @escaping (CityModel) -> Void,
        titleText: String = "Nereden",
        placeholderText: String = "il veya ilçe yazın"
    ) {
        self.recentSearches = recentSearches
        self.popularStops = popularStops
        self.otherStops = otherStops
        self.onCitySelected = onCitySelected
        self.titleText = titleText
        self.placeholderText = placeholderText
    }

    var body: some View {
        ZStack {
            Color.oMain.ignoresSafeArea()

            VStack {
                VStack {
                    HStack {
                        Image(AppImages.location)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 18)

                        Text(titleText)
                            .font(.system(size: 18, weight: .bold))

                        Spacer()

                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: AppIcons.xmark)
                                .font(.system(size: 25, weight: .semibold))
                                .padding()
                        }
                    }.foregroundStyle(.oWhite)

                    HStack {
                        ZStack(alignment: .leading) {
                            if searchText.isEmpty {
                                Text(placeholderText)
                                    .foregroundStyle(.oGray)
                                    .allowsHitTesting(false)
                            }

                            TextField("", text: $searchText)
                                .foregroundStyle(.oBlack)
                        }

                        Button {
                            searchText = ""
                        } label: {
                            if searchText.isEmpty {
                                Image(systemName: AppIcons.search)
                                    .foregroundStyle(.oMain)
                                    .font(.system(size: 20, weight: .semibold))
                                    .frame(width: 30, height: 30)
                            } else {
                                Image(systemName: AppIcons.xmarkCircleFill)
                                    .foregroundStyle(.oGray)
                                    .font(.system(size: 20, weight: .semibold))
                                    .frame(width: 30, height: 30)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(.oWhite)
                    .clipShape(RoundedRectangle(cornerRadius: AppRadius.card))
                }.padding(.horizontal)

                ScrollView {
                    ZStack {
                        Color.oBackground.ignoresSafeArea()
                        VStack {
                            if searchText.isEmpty {
                                if !recentSearches.isEmpty {
                                    CityListSection(
                                        title: "Son Aramalar",
                                        cities: recentSearches,
                                        onCitySelected: { city in
                                            onCitySelected(city)
                                            dismiss()
                                        }
                                    )
                                }

                                if !popularStops.isEmpty {
                                    CityListSection(
                                        title: "Popüler duraklar",
                                        cities: popularStops,
                                        onCitySelected: { city in
                                            onCitySelected(city)
                                            dismiss()
                                        }
                                    )
                                }
                            }

                            let filteredOtherStops = searchText.isEmpty
                                ? otherStops
                                : otherStops.filter { $0.name.localizedCaseInsensitiveContains(searchText) }

                            if !filteredOtherStops.isEmpty {
                                CityListSection(
                                    title: "Diğer duraklar",
                                    cities: filteredOtherStops,
                                    onCitySelected: { city in
                                        onCitySelected(city)
                                        dismiss()
                                    }
                                )
                            }
                        }
                    }
                }.background(.oBackground)
            }
        }.hideKeyboardOnTap()
    }
}

struct CityListSection: View {
    let title: String
    let cities: [CityModel]
    let onCitySelected: (CityModel) -> Void

    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.oGray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 5)

            Rectangle()
                .fill(.oGray.opacity(0.55))
                .frame(height: 1)

            ForEach(cities) { city in
                CitySelectionButtonView(city: city) {
                    onCitySelected(city)
                }
                if city.id != cities.last?.id {
                    Divider()
                }
            }
        }
    }
}

struct CitySelectionButtonView: View {
    let city: CityModel
    let onTapGesture: () -> Void

    var body: some View {
        Button {
            onTapGesture()
        } label: {
            HStack {
                Image(AppImages.location)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 18)

                Text(city.name)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(.oGray)
            .frame(maxWidth: .infinity, alignment: .leading)
        }.padding(.horizontal)
    }
}

#Preview {
    let sampleRecentSearches = [
        CityModel(name: "Gaziantep"),
        CityModel(name: "İstanbul"),
    ]

    let samplePopularStops = [
        CityModel(name: "İstanbul Avrupa - İstanbul"),
        CityModel(name: "İstanbul Anadolu - İstanbul"),
        CityModel(name: "Ankara"),
        CityModel(name: "İzmir"),
        CityModel(name: "Adana"),
        CityModel(name: "Bursa"),
        CityModel(name: "Antalya"),
        CityModel(name: "Eskişehir"),
        CityModel(name: "Konya"),
    ]

    let sampleOtherStops = [
        CityModel(name: "Gaziantep"),
        CityModel(name: "İstanbul"),
        CityModel(name: "Adana"),
        CityModel(name: "Bursa"),
        CityModel(name: "Eskişehir"),
    ]

    CitySelectionView(
        recentSearches: sampleRecentSearches,
        popularStops: samplePopularStops,
        otherStops: sampleOtherStops,
        onCitySelected: { city in
            print("Selected city: \(city.name)")
        },
        titleText: "Nereden",
        placeholderText: "il veya ilçe yazın"
    )
}
