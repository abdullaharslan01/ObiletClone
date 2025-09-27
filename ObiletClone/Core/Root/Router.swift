//
//  Router.swift
//  ObiletClone
//
//  Created by abdullah on 27.09.2025.
//

import SwiftUI


enum AppPages: Hashable {
    case home
    case account
    case myTrips
    case promotions
    case result
    case payment(selectionSeated: [SeatSelection])
    case busSearch
    case planeSearch
    case hotelSearch
    case carSearch
    case ferrySearch
    case ticketDetail(travel: Travel)
    case seatSelection(busResult: BusResult)
}


enum Sheet: String, Identifiable {
    var id: String { rawValue }

    case citySelection
    case dateSelection
    case passengerSelection
    case filterOptions
    case sortOptions
    case pnrSearch
    case contactEdit
    case paymentOptions
    case ticketOperations
    case supportOptions
    case couponCode
    case savedPassengers
    case phoneCodeSelection
}


enum FullScreenCover: String, Identifiable {
    var id: String { rawValue }

    case ferryWebView
    case ticketPDF
    case paymentWebView
    case loginFlow
    case onboarding
    case cameraScanner
}


class Router: ObservableObject {
    @Published var path: NavigationPath = .init()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?


    func push(page: AppPages) {
        path.append(page)
    }

    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    func popToRoot() {
        path.removeLast(path.count)
    }


    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }

    func dismissSheet() {
        sheet = nil
    }


    func presentFullScreenCover(_ cover: FullScreenCover) {
        fullScreenCover = cover
    }

    func dismissCover() {
        fullScreenCover = nil
    }


    @ViewBuilder
    func build(page: AppPages) -> some View {
        switch page {
        case .home:
            HomeView()

        case .account:
            AccountView()

        case .myTrips:
            MyTripsView()

        case .promotions:
            PromotionView()

        case .result:
            ResultView()

        case let .payment(selectionSeated):
            PaymentView(selectionSeated: selectionSeated)

        case .busSearch:
            // BusSearchDetailView()
            Text("Bus Search Detail")

        case .planeSearch:
            // PlaneSearchDetailView()
            Text("Plane Search Detail")

        case .hotelSearch:
            // HotelSearchDetailView()
            Text("Hotel Search Detail")

        case .carSearch:
            // CarSearchDetailView()
            Text("Car Search Detail")

        case .ferrySearch:
            // FerrySearchDetailView()
            Text("Ferry Search Detail")

        case let .ticketDetail(travel):
            // TicketDetailView(travel: travel)
            Text("Ticket Detail for \(travel.id)")

        case let .seatSelection(busResult):
            // SeatSelectionView(busResult: busResult)
            Text("Seat Selection for \(busResult.companyName)")
        }
    }

    // MARK: - Sheet Builder

    @ViewBuilder
    func buildSheet(sheet: Sheet) -> some View {
        switch sheet {
        case .citySelection:
            CitySelectionView(
                recentSearches: [],
                popularStops: [],
                otherStops: [],
                onCitySelected: { _ in },
                titleText: "Şehir Seç",
                placeholderText: "Şehir ara"
            )

        case .dateSelection:
            // DateSelectionView()
            Text("Date Selection")

        case .passengerSelection:
            // PassengerSelectionView()
            Text("Passenger Selection")

        case .filterOptions:
            // FilterOptionsView()
            Text("Filter Options")

        case .sortOptions:
            // SortOptionsView()
            Text("Sort Options")

        case .pnrSearch:
            // PnrSearchView()
            Text("PNR Search")

        case .contactEdit:
            // ContactEditView()
            Text("Contact Edit")

        case .paymentOptions:
            // PaymentOptionsView()
            Text("Payment Options")

        case .ticketOperations:
            // TicketOperationsView()
            Text("Ticket Operations")

        case .supportOptions:
            // SupportOptionsView()
            Text("Support Options")

        case .couponCode:
            // CouponCodeView()
            Text("Coupon Code")

        case .savedPassengers:
            // SavedPassengersView()
            Text("Saved Passengers")

        case .phoneCodeSelection:
            // PhoneCodeSelectionView()
            Text("Phone Code Selection")
        }
    }


    @ViewBuilder
    func buildCover(cover: FullScreenCover) -> some View {
        switch cover {
        case .ferryWebView:
            FerryWebView()

        case .ticketPDF:
            // TicketPDFView()
            Text("Ticket PDF")

        case .paymentWebView:
            // PaymentWebView()
            Text("Payment Web View")

        case .loginFlow:
            // LoginFlowView()
            Text("Login Flow")

        case .onboarding:
            // OnboardingView()
            Text("Onboarding")

        case .cameraScanner:
            // CameraScannerView()
            Text("Camera Scanner")
        }
    }
}

