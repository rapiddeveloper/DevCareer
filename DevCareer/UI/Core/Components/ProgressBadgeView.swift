//
//  ProgressBadgeView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import SwiftUI

struct ProgressBadgeView: View {
    
    var badge: Badge
    var badgeWidth: CGFloat = 30
    var badgeHeight: CGFloat = 26
    var progress: Double = 0.0
    var progressColor: Color = .blue
    var progressCircleDim: CGFloat = 48
    
    var body: some View {
        CircularProgressView(progress: 0.0) {
            BadgeView(badge, width: badgeWidth, height: badgeHeight)
        }
        .frame(width: progressCircleDim, height: progressCircleDim)
    }
}

#Preview {
    ProgressBadgeView(badge: .init(kind: .gray))
}
