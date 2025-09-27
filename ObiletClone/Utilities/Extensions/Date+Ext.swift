//
//  Date+Ext.swift
//  ObiletClone
//
//  Created by abdullah on 12.09.2025.
//

import SwiftUI

extension Date {
    func formattedForTravel() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "tr_TR")
        formatter.dateFormat = "d MMMM yyyy EEEE HH:mm"
        return formatter.string(from: self)
    }

    func formattedForPayment(capitalized _: Bool = true) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM EEEE"
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter.string(from: self)
    }
}
