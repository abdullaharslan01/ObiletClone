//
//  Router.swift
//  ObiletClone
//
//  Created by abdullah on 28.09.2025.
//

import SwiftUI

enum Destination: Hashable {
    case result
    case payment([SeatSelection])
}

enum Sheet: Hashable, Identifiable {
    case citySelection

    var id: Self { self }
}

class Router: ObservableObject {
    @Published var homePath = NavigationPath()
    @Published var sheet: Sheet?
    
    func navigate(to destination: Destination) {
        homePath.append(destination)
    }

    func navigateBack() {
        homePath.removeLast()
    }

    func navigateToRoot() {
        homePath.removeLast(homePath.count)
    }

    func pop(to count: Int = 1) {
        guard homePath.count >= count else { return }

        homePath.removeLast(count)
    }

    func popToRoot() {
        homePath.removeLast(homePath.count)
    }

    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }

    func dismissSheet() {
        sheet = nil
    }

    @ViewBuilder
    func build(page: Destination) -> some View {
        switch page {
        case .result: ResultView()
        case let .payment(seatedSelection):
            PaymentView(selectionSeated: seatedSelection)
        }
    }

    @ViewBuilder
    func buildSheet(sheet: Sheet) -> some View {
        switch sheet {
        case .citySelection: Text("Fotgot Password")
        }
    }
}

extension View {}
