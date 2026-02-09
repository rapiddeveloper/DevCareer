//
//  LessonCardView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

/*
  A view that renders lesson: it's title, badge and progress if specified
 */

import SwiftUI

struct LessonCardView<Content: View>: View {
    
    @Environment(ThemeStore.self) private var themeStore
    
    var topic = "Learn React"
    var subtitle = "Component lifecycle"
    var badge = Badge(kind: .gray)
    var label: Content
    
     let badgeLength = 40.0
    
    init(topic: String = "Learn React", subtitle: String = "Component lifecycle", badge: Badge = Badge(kind: .gray)) where Content == AnyView {
        self.topic = topic
        self.subtitle = subtitle
        self.badge = badge
        self.label = AnyView(
            BadgeView(badge, width: badgeLength, height: badgeLength)
        )
    }
    
    init(topic: String, @ViewBuilder content: @escaping () -> Content) {
        label = content()
        self.topic = topic
    }

 
    
    var body: some View {
        HStack(spacing: themeStore.mdSpacing) {
            label
 
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

#Preview {
    
    var badge = Badge(kind: .gray)

    ZStack {
        LessonCardView(topic: "") {
            CircularProgressView(progress: 0.0) {
                BadgeView(badge, width: 82, height: 72)
            }
            .frame(width: 112.0, height: 112.0)
        }
        .environment(ThemeStore())
    }
    .padding()
}
