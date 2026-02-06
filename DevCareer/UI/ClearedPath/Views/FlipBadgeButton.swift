//
//  FlipBadgeButton.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

import SwiftUI

// Small top toggle button
struct FlipBadgeButton: View {
    
    @Environment(ThemeStore.self) private var themeStore
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                SVGImage(svg: "Refresh", width: themeStore.mdSpacing, height: themeStore.mdSpacing)
                DevCareerText("Flip badge")
            }
            .padding(.horizontal, themeStore.mdSpacing)
            .padding(.vertical, themeStore.smSpacing)
            .background(Capsule().stroke(themeStore.bodyTextColor.opacity(0.3), lineWidth: 1))
        }
        .buttonStyle(.plain)
    }
}
