//
//  MotivationalMessageView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

import SwiftUI

struct MotivationalMessageView: View {
    @Environment(ThemeStore.self) private var themeStore

    var body: some View {
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
}
