//
//  AchievementBadgeView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

import SwiftUI

struct AchievementBadgeView: View {

    @Binding var isFlipped: Bool
    var badge: Badge

    var body: some View {
        ZStack {
            BadgeDecoration()

                .clipShape(.rect)
                .frame(width: 331, height: 218)
            ZStack {
                if !isFlipped {
                    badgeView
                } else {
                    badgeView
 
                 }
            }
            .rotation3DEffect(
                .degrees(isFlipped ? 180 : 0),
                axis: (x: 0.0, y: 0.0, z: 1.0),
                perspective: 0.5
            )
            .animation(
                .spring(response: 0.6, dampingFraction: 0.7), value: isFlipped)

        }
    }
}

extension AchievementBadgeView {
    var badgeView : some View {
        BadgeView(badge)
    }
}
