//
//  OutlineButton.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

import SwiftUI

struct DevCareerOutlineButton<Content: View>: View {
    @Environment(ThemeStore.self) private var themeStore
    var action: () -> Void
    var label:  Content

    init(action: @escaping () -> Void, @ViewBuilder label: () -> Content) {
        self.action = action
        self.label = label()
    }
    
    var body: some View {
        Button(action: action) {
            label
            .padding(.horizontal, themeStore.mdSpacing)
            .padding(.vertical, themeStore.smSpacing)
            .background(Capsule().stroke(themeStore.bodyTextColor.opacity(0.3), lineWidth: 1))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    DevCareerOutlineButton(action: { }) {
        HStack(spacing: 8) {
            SVGImage(svg: "Refresh", width: 12, height:  12)
            DevCareerText("Flip badge")
        }
    }
    .environment(ThemeStore())
}
