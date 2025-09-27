//
//  PaymentAcceptanceModel.swift
//  ObiletClone
//
//  Created by abdullah on 27.09.2025.
//

import Foundation

struct PaymentAcceptanceModel {
    var isTermsAccepted = false
    var isEasyCancellationAccepted = false

    var allTermsAccepted: Bool {
        return isTermsAccepted && isEasyCancellationAccepted
    }
}
