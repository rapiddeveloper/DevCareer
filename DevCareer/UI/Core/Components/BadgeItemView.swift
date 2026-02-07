//
//  BadgeItemView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

/*
  A view that shows a badge, title and subtile.
 */

import SwiftUI

struct BadgeItemView: View {
    
    @Environment(ThemeStore.self) private var themeStore
    
    let badgeItem: BadgeItem
     
    init(_ badgeItem: BadgeItem) {
        self.badgeItem = badgeItem
    }
    
    var body: some View {
        VStack(spacing: themeStore.xsSpacing) {
            BadgeView(badgeItem.badge, width: UIConstants.badgeHeight, height: UIConstants.badgeHeight)
 
            VStack(spacing: themeStore.xsSpacing) {
                DevCareerText(badgeItem.title, variant: .subtitle1)
                
                DevCareerText(badgeItem.subtitle, variant: .caption2)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(.horizontal, themeStore.containerPadding)
        .padding(.vertical, themeStore.mdSpacing)
    }
}

extension BadgeItemView {
    private struct UIConstants {
        
        static let badgeHeight: CGFloat = 80.0
    }
}

#Preview {
    let badgeItem: BadgeItem = .init(
        badge: .init(kind: .blue),
        title: "Level 1",
        subtitle: "3/3 perfect scores"
    )
    BadgeItemView(badgeItem)
        .environment(ThemeStore())
}
