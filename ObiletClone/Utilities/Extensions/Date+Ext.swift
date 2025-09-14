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
}
