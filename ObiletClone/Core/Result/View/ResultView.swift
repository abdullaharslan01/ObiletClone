//
//  ResultView.swift
//  ObiletClone
//
//  Created by abdullah on 17.09.2025.
//

import SwiftUI

struct ResultView: View {
    @StateObject private var viewModel = ResultViewModel()
    @StateObject private var filterManager = FilterManager()

    var body: some View {
        VStack(spacing: 0) {
            dateNavigationSection
            filterSection
            busResultsSection
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                routeDisplaySection
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension ResultView {
    var dateNavigationSection: some View {
        HStack {
            NavigationButtonView(text: "Önceki", icon: "chevron.left") {
                viewModel.handlePreviousDate()
            }
            
            NavigationButtonView(text: viewModel.currentDateText, icon: "calendar", maxWidth: .infinity) {
                viewModel.handleDateSelection()
            }
            
            NavigationButtonView(text: "Sonraki", icon: "chevron.right", iconPosition: .trailing) {
                viewModel.handleNextDate()
            }
        }
        .padding()
        .background(Color.oMain)
    }
    
    var filterSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                FilterButtonView(text: "SIRALA", icon: AppIcons.arrowUpDown, filledBackground: true) {
                    viewModel.handleSort()
                }
                
                FilterButtonView(text: "FİLTRE", icon: AppIcons.filter, filledBackground: true) {
                    viewModel.handleFilter()
                }
                
                ForEach(viewModel.timeFilters, id: \.self) { filter in
                    FilterButtonView(text: filter) {
                        viewModel.handleTimeFilter(filter)
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 60)
    }
    
    var busResultsSection: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(viewModel.busResults) { busResult in
                    BusResultCard(busResult: busResult) { onConformation in
                        viewModel.handleBusSelection(busResult)
                    }
                }
            }
            .padding()
        }
    }
    
    var routeDisplaySection: some View {
        HStack {
            Text(viewModel.fromCity)
            Button {
                viewModel.handleRouteSwap()
            } label: {
                Image(systemName: AppIcons.changeArrow)
            }
            Text(viewModel.toCity)
        }
        .foregroundStyle(.oWhite)
    }
}

#Preview {
    NavigationView {
        ResultView()
    }
}


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
