//
//  ClearedPathView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

import SwiftUI

struct ClearedPathView: View {
    
    @Environment(ThemeStore.self) private var themeStore
    
    var body: some View {
        VStack(spacing: themeStore.xlSpacing) {

            // Header Action
            FlipBadgeButton {
                print("Flipping...")
            }
 
           // Spacer()

            // Content Container
            VStack(spacing: themeStore.xlSpacing) {
                AchievementBadgeView()

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
            DevCareerButton("Share your achievement", variant: .full) {

            }
        }
        .background(Color.white)
        .padding(.horizontal)
        .padding(.vertical, 36)
     }
}

#Preview {
    ClearedPathView()
        .environment(ThemeStore())
 }
