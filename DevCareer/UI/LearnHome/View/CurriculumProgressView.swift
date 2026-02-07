//
//  CurriculumProgressView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

import SwiftUI

struct CurriculumProgressView: View {
    
    @Environment(ThemeStore.self) private var themeStore
    let progressBackgroundColor = Color(hex: "#EFE4FB")
    
    let pathTitle: String
    var currentStage: Int
    var totalStages: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: themeStore.xsSpacing) {
            DevCareerText(pathTitle, variant: .subtitle1)
            
            HStack {
                DevCareerText("Stage \(currentStage) of \(totalStages)", variant: .caption1)
 
                ProgressView(value: Double(currentStage), total: Double(totalStages))
                    .tint(themeStore.primaryColor)
                    .background {
                        RoundedRectangle(cornerRadius: 6.0)
                            .fill(progressBackgroundColor)
                            .frame(height: 4.0)
                    }
                    
            }
        }
        .padding(themeStore.mdSpacing)
    }
}
