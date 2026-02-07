//
//  ForTodayView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

import SwiftUI

struct ForTodayView: View {
    @Environment(ThemeStore.self) private var themeStore
    
    private let topic = "Learn React"
    private let subtitle = "Component lifecycle"
    private let badge = Badge(kind: .gray)
    private let title = "For Today"
    
    static let badgeLength = 40.0
 
    
    var body: some View {
        VStack(alignment: .leading) {
            DevCareerText(title, variant: .caption1)
                .fontWeight(.semibold)

            HStack(spacing: themeStore.mdSpacing) {
                CircularProgressView(progress: 0.0) {
                    BadgeView(badge, width: 30, height: 26)
                }
                .frame(width: UIConstants.progressLen, height: UIConstants.progressLen)
                
                VStack(alignment: .leading, spacing: themeStore.smSpacing - 2.0) {
                    DevCareerText(topic, variant: .subtitle1)
                    HStack(spacing: 8) {
                        SVGImage(svg: "NoteIcon", width: UIConstants.iconLen, height: UIConstants.iconLen, color: themeStore.softTextColor)
                        DevCareerText(subtitle)
                    }
                }
                Spacer()
            }
           
        }
        .padding(.top, themeStore.containerPadding)
        .padding(.horizontal, themeStore.containerPadding)
        .padding(.bottom, themeStore.containerPadding)
        .padding(.bottom, themeStore.mdSpacing)


        .background {
            RoundedRectangle(cornerRadius: themeStore.smSpacing)
                .fill(themeStore.backgroundColor)
                .stroke(themeStore.outlineColor, lineWidth: 1.0)
        }
        .shadow(
            color: Color.black.opacity(0.05),
            radius: 15,
            x: 0,
            y: 4
        )
     }
}

extension ForTodayView {
    private struct UIConstants {
        static let  iconLen: CGFloat = 16
        static let  progressLen: CGFloat = 48
    }
}

#Preview {
    ZStack {
        ForTodayView()
            .environment(ThemeStore())
    }
    .padding()
}
