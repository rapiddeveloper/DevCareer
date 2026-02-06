//
//  AchievementBadgeView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

import SwiftUI

struct AchievementBadgeView: View {
    var body: some View {
        ZStack {
            // Background "Light Rays" Effect
            ForEach(0..<12) { index in
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [.purple.opacity(0.3), .clear],
                            startPoint: .center,
                            endPoint: .top
                        )
                    )
                    .frame(width: 2, height: 220)
                    .rotationEffect(.degrees(Double(index) * 30))
            }
            
            // Main Badge Icon
            // Note: Replace "badge_icon" with your actual asset name
            Image("BadgePurple")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 243, height: 213)
              
        }
     }
}
