//
//  CircularProgressView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

import SwiftUI

struct CircularProgressView<Content: View>: View {
    let progress: Double  // Range 0 to 100
    var progressColor = Color.lightGrey
    var trackLineWidth: CGFloat = 6.0
    let content: () -> Content  // Asset name

    private var progressPercentage: Double {
        progress / UIConstants.maxProgress
    }

    var body: some View {
        ZStack {
            // 1. Background White Circle
            //            Circle()
            //                .fill(.white)
            //               .shadow(color: UIConstants.shadowColor, radius: UIConstants.shadowRadius, x: UIConstants.shadowX, y: UIConstants.shadowX)

            // 2. Progress Track (Light Blue/Gray)
            Circle()
                .stroke(
                    progressColor.opacity(0.24),
                    lineWidth: trackLineWidth)

            // 3. Progress Indicator (Solid Blue)
            Circle()
                .trim(from: 0, to: progressPercentage)
                .stroke(
                    progressColor,
                    style: StrokeStyle(
                        lineWidth: trackLineWidth
                    )
                )
                .rotationEffect(UIConstants.startRotation)  // Start from top center
                .animation(UIConstants.progressAnimation, value: progress)

            // 4. Central Badge Image
            content()
        }
    }
}

// MARK: - UI Constants
private struct UIConstants {

    // Layout & Base

    static let maxProgress: Double = 100.0
    static let startRotation = Angle(degrees: -90)
    static let badgePadding: CGFloat = 30.0

    // Track Styling
    static let trackLineWidth: CGFloat = 12.0

    //Progress Styling
    static let progressLineWidth: CGFloat = 12.0
    static let progressLineCap: CGLineCap = .round
    static let progressAnimation: Animation = .easeOut(duration: 1.0)

    // Shadow Effects
    static let shadowColor = Color.black.opacity(0.1)
    static let shadowRadius: CGFloat = 10.0
    static let shadowX: CGFloat = 0.0
    static let shadowY: CGFloat = 5.0
}

#Preview {

    let badge: Badge = .init(kind: .purple)

    VStack {
        CircularProgressView(
            progress: 10, progressColor: .lightGrey, trackLineWidth: 12
        ) {
            BadgeView(badge)
        }
        .frame(width: 300, height: 300)
    }
    .frame(width: 400, height: 400)
    .background(Color.white)

}
