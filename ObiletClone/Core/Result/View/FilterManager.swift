//
//  FilterManager.swift
//  ObiletClone
//
//  Created by abdullah on 27.09.2025.
//

import Foundation

class FilterManager: ObservableObject {
    @Published var selectedFilters: [String: Int] = [:]

    func selectFilter(_ filterName: String) {
        selectedFilters[filterName] = (selectedFilters[filterName] ?? 0) + 1
    }

    func deselectFilter(_ filterName: String) {
        selectedFilters.removeValue(forKey: filterName)
    }

    func getFilterCount(_ filterName: String) -> Int {
        return selectedFilters[filterName] ?? 0
    }

    func isFilterSelected(_ filterName: String) -> Bool {
        return selectedFilters[filterName] != nil
    }
}
