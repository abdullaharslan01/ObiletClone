//
//  SeatView.swift
//  ObiletClone
//
//  Created by abdullah on 22.09.2025.
//

import SwiftUI

struct SeatView: View {
    let number: Int
    let status: SeatStatus
    let selection: SeatSelection?
    let action: (Int, CGPoint) -> Void

    private var backgroundColor: Color {
        switch status {
        case .available:
            return Color.gray.opacity(0.2)
        case .occupiedMale:
            return Color.blue.opacity(0.8)
        case .occupiedFemale:
            return Color.pink.opacity(0.8)
        case .selected:
            return Color.green.opacity(0.8)
        }
    }

    private var isOccupied: Bool {
        switch status {
        case .occupiedMale, .occupiedFemale:
            return true
        default:
            return false
        }
    }

    var body: some View {
        GeometryReader { _ in
            Button(action: {
                action(number, .zero)
            }) {
                Text("\(number)")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 38, height: 38)
                    .background(backgroundColor)
                    .foregroundColor(status == .available ? .black : .white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            .buttonStyle(.plain)
        }
        .frame(width: 38, height: 38)
        .overlay(alignment: .topTrailing) {
            if status == .selected {
                Image(systemName: AppIcons.xmarkCircleFill)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
        }
    }
}

