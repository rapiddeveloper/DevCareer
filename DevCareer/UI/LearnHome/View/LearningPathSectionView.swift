//
//  LearningPathSection.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

import SwiftUI

struct LearningPathSectionView: View {
    
    @Environment(ThemeStore.self) private var themeStore
    
    // Hardcoded data driving the view
    private let pathTitle = "Fullstack mobile Engineer"
    private let currentStage = 3
    private let totalStages = 11
  
    
    var body: some View {
        VStack(alignment: .leading, spacing: themeStore.mdSpacing) {
           
            DevCareerText("Active learning path", variant: .subheadline)
            
            VStack(alignment: .leading, spacing: themeStore.containerPadding) {
                VStack(spacing: 0) {
                    // Progress Header
                    CurriculumProgressView(pathTitle: pathTitle, currentStage: currentStage, totalStages: totalStages)
                    
                    // Lesson Card
                    LessonCardView()
                }
              
                
                DevCareerButton {
                    HStack {
                        DevCareerText("View full path", variant: .button)
                        Image(systemName: "arrow.right")
                            .font(.footnote)
                    }
                } action: {
                    
                }

                
            }
            .padding(themeStore.containerPadding)
            .background {
                RoundedRectangle(cornerRadius: themeStore.smSpacing)
                    .fill(themeStore.backgroundColor)
                   
            }
         }
    }
}

extension LearningPathSectionView {
    private struct UIConstants {
        // MARK: - Layout
        static let sectionSpacing: CGFloat = 16.0
        static let cardContentSpacing: CGFloat = 20.0
        static let stackSpacing4: CGFloat = 4.0
        static let stackSpacing8: CGFloat = 8.0
        static let stackSpacing12: CGFloat = 12.0
        static let iconSize: CGFloat = 48.0
        static let progressScale: CGFloat = 1.5
        static let buttonPadding: CGFloat = 16.0
        
        // MARK: - Typography
        static let headerFontSize: CGFloat = 18.0
        static let titleFontSize: CGFloat = 16.0
        static let labelFontSize: CGFloat = 14.0
        
        // MARK: - Styling
        static let purpleAccent = Color.purple
        static let cornerRadius12: CGFloat = 12.0
        static let cornerRadius16: CGFloat = 16.0
        static let shadowColor = Color.black.opacity(0.05)
    }
}

#Preview {
    LearningPathSectionView()
        .environment(ThemeStore())
}



 



 
