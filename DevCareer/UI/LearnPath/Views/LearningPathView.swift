//
//  LearningPathView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import SwiftUI
import UIKit

struct LearningPathView: View {

    @Environment(NavigationRouter.self) private var router
    var profile: Profile

    let badge = Badge(kind: .gray)

    var body: some View {

        ScrollView {

            VStack(alignment: .leading) {
                header
                ForEach(profile.activeLearningPath.stages) { stage in
                    LessonCardView(topic: stage.title, subtitle: getLessonTitle(stage)) {
                        CircularProgressView(progress: 0.0) {
                            BadgeView(stage.achivement.badge, width: 82.0, height: 72.0)
                        }
                        .frame(width: 112.0, height: 112.0)
                         

                    }
                    .onTapGesture {
                        router.navigateTo(.cleared, withSelectedStage: stage)
                    }
                }
            }
            .padding()
        }
        
    }
}

extension LearningPathView {
    
    func getLessonTitle(_ stage: LearningStage) -> String {
        if stage.id == profile.activeStage.id {
            return profile.activeLessonTitle
        }
        return ""
    }
}




extension LearningPathView {

    var header: some View {
        VStack(alignment: .leading) {
            DevCareerText("Stage \(profile.activeStateNumber) of \(profile.activePathStagesCount)")
            DevCareerText("\(profile.activeStage.title)", variant: .title1)
                .multilineTextAlignment(.leading)

        }
        .containerRelativeFrame(.horizontal, alignment: .leading) { len, axis in
            if axis == .horizontal {
                return len * 0.7
            }
            return len
        }
    }
}

#Preview {
    LearningPathView(profile: .init())
        .environment(ThemeStore())
}
