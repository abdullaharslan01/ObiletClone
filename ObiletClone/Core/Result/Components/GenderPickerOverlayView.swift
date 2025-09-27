//
//  GenderPickerOverlay.swift
//  ObiletClone
//
//  Created by abdullah on 22.09.2025.
//

import SwiftUI

struct GenderPickerOverlayView: View {
    let onGenderSelected: (Gender) -> Void
    let onCancel: () -> Void

    var body: some View {
        HStack(spacing: 20) {
            GenderSelectionButtonView(gender: .male) {
                onGenderSelected(.male)
            }

            GenderSelectionButtonView(gender: .female) {
                onGenderSelected(.female)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 25)
        .background(
            SpeechBubble()
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
        .overlay(
            SpeechBubble()
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}

struct SpeechBubble: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let cornerRadius: CGFloat = 20
        let pointerWidth: CGFloat = 12
        let pointerHeight: CGFloat = 8

        let bubbleRect = CGRect(
            x: rect.minX,
            y: rect.minY,
            width: rect.width,
            height: rect.height - pointerHeight
        )

        path.addRoundedRect(in: bubbleRect, cornerSize: CGSize(width: cornerRadius, height: cornerRadius))

        let midX = rect.midX
        let bottomY = bubbleRect.maxY

        path.move(to: CGPoint(x: midX - pointerWidth / 2, y: bottomY))
        path.addQuadCurve(
            to: CGPoint(x: midX, y: bottomY + pointerHeight),
            control: CGPoint(x: midX - pointerWidth / 4, y: bottomY + pointerHeight / 2)
        )
        path.addQuadCurve(
            to: CGPoint(x: midX + pointerWidth / 2, y: bottomY),
            control: CGPoint(x: midX + pointerWidth / 4, y: bottomY + pointerHeight / 2)
        )
        path.closeSubpath()

        return path
    }
}

struct GenderSelectionButtonView: View {
    let gender: Gender
    let onTap: () -> Void

    var body: some View {
        Button {
            onTap()
        } label: {
            VStack {
                Image(gender.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 25)
                    .padding(10)
                    .background(
                        Circle()
                            .stroke(gender.genderSelectionColor, lineWidth: 3)
                    )

                Text(gender.title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.man)
            }
        }
    }
}
