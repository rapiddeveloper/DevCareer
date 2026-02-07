//
//  BadgeView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

import SwiftUI

struct BadgeView: View {

    let badge: Badge
    let width: CGFloat
    let height: CGFloat

    init(
        _ badge: Badge,
        width: CGFloat = 243,
        height: CGFloat = 213
    ) {
        self.badge = badge
        self.width = width
        self.height = height
    }

    var body: some View {
        Image(badge.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
    }
}

#Preview {
    BadgeView(.init(kind: .blue))
}
