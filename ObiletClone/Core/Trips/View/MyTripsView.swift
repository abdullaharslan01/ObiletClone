//
//  MyTripsView.swift
//  ObiletClone
//
//  Created by abdullah on 12.09.2025.
//

import SwiftUI

struct MyTripsView: View {
    @StateObject private var viewModel = MyTripsViewModel()
    @State private var showFerryView: Bool = false

    var body: some View {
        ZStack {
            Color.oMain.ignoresSafeArea()

            VStack(spacing: 0) {
                categorySection
                contentSection
            }
            .navigationTitle("Seyehatlerim")
            .navigationBarTitleDisplayMode(.inline)
        }
        .overlay {
            loadingOverlay
        }
        .onAppear {
            viewModel.loadTravels {
                withAnimation(.easeInOut(duration: 0.5)) {
                }
            }
        }
        .onChange(of: viewModel.selectedCategory) { _ in
            viewModel.loadTravelsForCategory()
        }
        .fullScreenCover(isPresented: $showFerryView) {
            FerryWebView()
        }
    }
}

private extension MyTripsView {
    var categorySection: some View {
        TripCategoryView(selectedCategory: $viewModel.selectedCategory) {
            showFerryView = true
        }
    }
    
    var contentSection: some View {
        ScrollView {
            VStack {
                pnrRequestSection
                tripsListSection
            }
            .frame(maxWidth: .infinity)
        }
        .background(.oBackground)
    }
    
    var pnrRequestSection: some View {
        PnrRequestView {
            viewModel.handlePnrRequest()
        }
        .padding(.bottom)
    }
    
    var tripsListSection: some View {
        LazyVStack(spacing: 15) {
            if viewModel.travels.isEmpty {
                emptyStateView
            } else {
                tripsListView
            }
        }
        .padding(.horizontal, 10)
        .overlay(alignment: .top) {
            CategoryLabel(title: viewModel.selectedCategory.logTitle)
                .offset(y: -15)
        }
    }
    
    var emptyStateView: some View {
        VStack {
            emptyStateInfoCard
            searchButton
        }
        .frame(maxWidth: .infinity)
    }
    
    var emptyStateInfoCard: some View {
        HStack(spacing: 2) {
            Image(systemName: AppIcons.infoCircle)
            Text(viewModel.selectedCategory.emtyText)
                .font(.system(size: 15))
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(.oGray)
        .padding()
        .padding(.top)
        .background(
            RoundedRectangle(cornerRadius: AppRadius.card)
                .stroke(.oGray.opacity(0.2), lineWidth: 1)
        )
    }
    
    var searchButton: some View {
        Button {
            viewModel.handleCategorySearch()
        } label: {
            Text(viewModel.selectedCategory.title + " Ara")
                .foregroundStyle(.oWhite)
                .font(.system(size: 15, weight: .semibold))
                .padding()
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: AppRadius.card)
                        .fill(.oGreen)
                )
        }
    }
    
    var tripsListView: some View {
        ForEach(viewModel.travels) { travel in
            LogCardView(
                data: travel,
                onDownloadTicket: { passenger in
                    viewModel.handleDownloadTicket(for: passenger)
                },
                onTicketOperations: { passenger in
                    viewModel.handleTicketOperations(for: passenger)
                }
            )
        }
    }
    
    var loadingOverlay: some View {
        Group {
            if viewModel.isLoading {
                Rectangle()
                    .fill(.oBlack.opacity(0.25))
                    .overlay {
                        OLoadingView()
                            .padding(.top, 50)
                    }
            }
        }
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
            )
            .foregroundStyle(.oWhite)
    }
}

#Preview {
    NavigationView {
        MyTripsView()
    }
}

