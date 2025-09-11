//
//  View+Ext.swift
//  ObiletClone
//
//  Created by abdullah on 11.09.2025.
//

import SwiftUI

extension View {
    func hideKeyboardOnTap() -> some View {
        onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
