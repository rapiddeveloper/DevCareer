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
    @Environment(ThemeStore.self) private var themeStore

    var profile: Profile

    let badge = Badge(kind: .gray)

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 0) {
                header
                Spacer(minLength: 8)
                ForEach(profile.activeLearningPath.stages) { stage in
                    
                    VStack(spacing: 0) {
                        LessonCardView(topic: stage.title, subtitle: getLessonTitle(stage)) {
                            CircularProgressView(progress: 0.0) {
                                BadgeView(stage.achivement.badge, width: 82.0, height: 72.0)
                            }
                            .frame(width: 112.0, height: 112.0)
                            
                        }
                        .onTapGesture {
                            router.navigateTo(.cleared, withSelectedStage: stage)
                        }
                        if !isLastStage(stage, ofPath: profile.activeLearningPath) {
                            HStack {
                                Spacer()
                                Rectangle()
                                    .fill(Color.clear)
                                    
                                    .stroke(Color.lightGrey, style: .init(lineWidth: 1, dash: [2.0,4.0]), antialiased: true)
                                    .frame(width: 0.5, height: 80)
                                Spacer()
                            }
                          
                            .frame(maxWidth: .infinity)

                        }
                       
                       
                    }
                }
            }
            .padding()
        }
        
    }
}

extension LearningPathView {
    
    func isLastStage(_ stage: LearningStage, ofPath path: LearningPath) -> Bool {
        if let lastStage = path.stages.last,
           stage.id == lastStage.id {
            return true
        }
        return false
    }
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
