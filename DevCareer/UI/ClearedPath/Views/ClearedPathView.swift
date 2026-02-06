//
//  ClearedPathView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

import SwiftUI

struct ClearedPathView: View {

    @Environment(ThemeStore.self) private var themeStore
    @Environment(\.displayScale) var displayScale
    @State private var isFlipped = false

    var body: some View {
        VStack(spacing: themeStore.xlSpacing) {

            // Header Action
            FlipBadgeButton {
                isFlipped.toggle()
            }

            // Content Container
            mainContent

            ShareLink(
                item: renderBadge(),
                preview: SharePreview("Achievement", image: renderBadge())
            ) {
                DevCareerText("Share your achievement", variant: .button)
                    .foregroundStyle(themeStore.onPrimaryColor)
                    .padding(.vertical, themeStore.smSpacing)
                    .padding(.horizontal, themeStore.xsSpacing)
                    .frame(maxWidth: .infinity)

            }
            .tint(themeStore.primaryColor)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: themeStore.buttonRadius))


        }
        .padding(.horizontal)
        .padding(.vertical, themeStore.xlSpacing)
        .frame(maxHeight: .infinity)
        .background(themeStore.backgroundColor)
       
    }

}

extension ClearedPathView {
    var mainContent: some View {
        VStack(spacing: themeStore.xlSpacing) {
            AchievementBadgeView(isFlipped: $isFlipped)

            MotivationalMessageView()
        }
        .environment(themeStore)
    }

     private func renderBadge() -> Image {
        let renderer = ImageRenderer(content: mainContent.padding(.vertical))

        // Ensure high resolution for sharing
        renderer.scale = displayScale

        if let uiImage = renderer.uiImage {
            return Image(uiImage: uiImage)
        }

        return Image(systemName: "xmark.circle")
    }
}

#Preview {
    ClearedPathView()
        .environment(ThemeStore())
}
