//
//  LearningPathSection.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

import SwiftUI

struct LearningPathSectionView: View {

    @Environment(ThemeStore.self) private var themeStore
    @Environment(NavigationRouter.self) private var router

    var profile: Profile
 
    var body: some View {
        VStack(alignment: .leading, spacing: themeStore.mdSpacing) {

            DevCareerText("Active learning path", variant: .subheadline)

            VStack(alignment: .leading, spacing: themeStore.containerPadding) {
                VStack(spacing: 0) {
                    // Progress Header
                    CurriculumProgressView(
                        pathTitle: profile.activeLearningPath.title,
                        currentStage: profile.activeStateNumber,
                        totalStages:  profile.activePathStagesCount
                    )

                    // Lesson Card
                    LessonCardView(
                        topic: profile.activeStage.title,
                        subtitle: profile.activeLessonTitle,
                        badge: profile.achievementBadge)
                }

                DevCareerButton {
                    HStack {
                        DevCareerText("View full path", variant: .button)
                        Image(systemName: "arrow.right")
                            .font(.footnote)
                    }
                } action: {
                    router.navigateTo(.learn)
                }
                .accessibilityIdentifier("fullPathButton")

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
    LearningPathSectionView(profile: .init())
        .environment(ThemeStore())
}
