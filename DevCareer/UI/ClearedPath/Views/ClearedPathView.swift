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
 
           // Spacer()

            // Content Container
            VStack(spacing: themeStore.xlSpacing) {
                AchievementBadgeView(isFlipped: $isFlipped)

                // Text Content
                VStack(spacing: themeStore.mdSpacing) {
                    DevCareerText(
                        "Git & version control\nmastery earned",
                        variant: .large
                    )
                    .multilineTextAlignment(.center)
                    .lineSpacing(-2)

                    DevCareerText(
                        "Versioned & valiant. You don't just write\ncode. You commit to it."
                    )
                    .multilineTextAlignment(.center)

                }
            }

            //Spacer()

            // Footer Action
            /*
            ShareLink(
                            item: renderBadge(),
                            preview: SharePreview("My Mastery Badge", image: renderBadge())
                        ) {
                            Label("Share your achievement", systemImage: "photo")
                                .padding()
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }*/
//            DevCareerButton("Share your achievement", variant: .full) {
//
//            }
        }
        .background(Color.white)
        .padding(.horizontal)
        .padding(.vertical, 36)
     }
    
    /*
        @MainActor
        private func renderBadge() -> Image {
            let renderer = ImageRenderer(content: badgeView)
            
            // Ensure high resolution for sharing
            renderer.scale = displayScale
            
            if let uiImage = renderer.uiImage {
                return Image(uiImage: uiImage)
            }
            
            return Image(systemName: "xmark.circle")
        }*/
}

#Preview {
    ClearedPathView()
        .environment(ThemeStore())
 }
