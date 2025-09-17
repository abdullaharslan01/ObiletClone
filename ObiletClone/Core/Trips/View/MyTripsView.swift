//
//  MyTripsView.swift
//  ObiletClone
//
//  Created by abdullah on 12.09.2025.
//

import SwiftUI

struct MyTripsView: View {
    @State private var travels: [Travel] = []
    @State private var isLoading = true
    @State private var selectedCategory: TransitCategory = .bus
    @State private var showFerryView: Bool = false

    var body: some View {
        ZStack {
            Color.oMain.ignoresSafeArea()

            VStack(spacing: 0) {
              

                TripCategoryView(selectedCategory: $selectedCategory) {
                    showFerryView = true
                }

                ScrollView {
                    VStack {
                        PnrRequestView {
                            handlePnrRequest()
                        }.padding(.bottom)

                        LazyVStack(spacing: 15) {
                            if travels.isEmpty {
                                VStack(content: {
                                    HStack(spacing: 2) {
                                        Image(systemName: AppIcons.infoCircle)

                                        Text(selectedCategory.emtyText)
                                            .font(.system(size: 15))
                                    }
                                    .frame(maxWidth:.infinity)
                                    .foregroundStyle(.oGray)
                                    .padding()
                                    .padding(.top)
                                    .background(
                                        RoundedRectangle(cornerRadius: AppRadius.card)
                                            .stroke(.oGray.opacity(0.2), lineWidth: 1)
                                    )
                                    
                                    Button {
                                        handleCategorySearch()
                                    } label: {
                                        Text(selectedCategory.title + " Ara")
                                            .foregroundStyle(.oWhite)
                                            .font(.system(size: 15, weight: .semibold))
                                            .padding()
                                            .padding(.horizontal)
                                            .background(
                                                RoundedRectangle(cornerRadius: AppRadius.card)
                                                    .fill(.oGreen)
                                                
                                            )
                                    }
                                })

                                .frame(maxWidth: .infinity)
                            } else {
                                ForEach(travels) { travel in
                                    LogCardView(
                                        data: travel,
                                        onDownloadTicket: { passenger in
                                            handleDownloadTicket(for: passenger)
                                        },
                                        onTicketOperations: { passenger in
                                            handleTicketOperations(for: passenger)
                                        }
                                    )
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                        .overlay(alignment: .top) {
                            CategoryLabel(title: selectedCategory.logTitle)
                                .offset(y: -15)
                        }

                    }.frame(maxWidth: .infinity)

                }.background(.oBackground)
                    .fullScreenCover(isPresented: $showFerryView, content: {
                        FerryWebView()
                    })
            }
            .navigationTitle("Seyehatlerim")
            .navigationBarTitleDisplayMode(.inline)

        }.overlay(content: {
            if isLoading {
                Rectangle()

                    .fill(.oBlack.opacity(0.25))
                    .overlay {
                        OLoadingView()
                            .padding(.top, 50)
                    }
            }
        })
        .onAppear {
            loadTravels()
        }
        .onChange(of: selectedCategory) { _ in
            loadTravelsForCategory()
        }
    }

    private func loadTravels() {
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            withAnimation(.easeInOut(duration: 0.5)) {
                fetchBusData()
                isLoading = false
            }
        }
    }
    
    private func loadTravelsForCategory() {
        switch selectedCategory {
        case .bus:
            fetchBusData()
        case .plane:
            fetchFlightData()
        case .hotel:
            fetchHotelData()
        case .car:
            fetchCarData()
        default:
            break
        }
    }
    
    private func handleCategorySearch() {
        loadTravelsForCategory()
    }
    
    private func fetchBusData() {
        travels = Travel.sampleTravels
    }
    
    private func fetchFlightData() {
        travels = []
    }
    
    private func fetchHotelData() {
        travels = []
    }
    
    private func fetchCarData() {
        travels = []
    }

    private func handlePnrRequest() {
        print("PNR sorgu talebi")
    }

    private func handleDownloadTicket(for passenger: Passenger) {
        print("E-bilet indiriliyor: \(passenger.fullName) - PNR: \(passenger.pnr)")
    }

    private func handleTicketOperations(for passenger: Passenger) {
        print("Bilet işlemleri: \(passenger.fullName) - PNR: \(passenger.pnr)")
    }
}

struct CategoryLabel: View {
    let title: String

    var body: some View {
        Text(title)
            .padding(5)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: AppRadius.card)
                    .fill(.oMain)
            ).foregroundStyle(.oWhite)
    }
}

#Preview {
    
    NavigationView {
        MyTripsView()

    }
}
