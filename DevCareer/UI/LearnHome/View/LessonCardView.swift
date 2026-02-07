//
//  LessonCardView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

import SwiftUI

struct LessonCardView: View {
    
    @Environment(ThemeStore.self) private var themeStore
    
    private let topic = "Learn React"
    private let subtitle = "Component lifecycle"
    private let badge = Badge(kind: .gray)
    
    static let badgeLength = 40.0
 
    
    var body: some View {
        HStack(spacing: themeStore.mdSpacing) {
            BadgeView(badge, width: LessonCardView.badgeLength, height: LessonCardView.badgeLength)
            
            VStack(alignment: .leading, spacing: themeStore.smSpacing - 2.0) {
                DevCareerText(topic, variant: .subtitle1)

                DevCareerText(subtitle, variant: .caption1)
            }
            Spacer()
        }
        .padding(.vertical, themeStore.containerPadding)
        .padding(.horizontal, themeStore.mdSpacing)

        .background {
            RoundedRectangle(cornerRadius: themeStore.mdSpacing)
                .fill(themeStore.backgroundColor)
                .stroke(themeStore.outlineColor, lineWidth: 1.0)
        }
     }
}
