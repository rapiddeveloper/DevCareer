//
//  MotivationalMessageView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

import SwiftUI

struct MotivationalMessageView: View {
    @Environment(ThemeStore.self) private var themeStore
    var stage: LearningStage?
    
    var body: some View {
        if let stage = self.stage {
            VStack(spacing: themeStore.mdSpacing) {
                DevCareerText(
                    stage.title,
                    variant: .large
                )
                .multilineTextAlignment(.center)
                .lineSpacing(-2)
                
                DevCareerText(
                    stage.motivationalMessage
                )
                .multilineTextAlignment(.center)
                
            }
        }
       
    }
}
