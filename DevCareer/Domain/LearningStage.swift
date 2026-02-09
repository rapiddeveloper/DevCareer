//
//  LearningStage.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import Foundation


struct LearningStage: Codable, Identifiable {
    var id: String = ""
    var title: String = ""
    var order: Int = 0
    var lessons: [Lesson] = []
    var status: String = "locked"
    
    var completionStatus: String {
       let completedCount = lessons.count(where: {$0.progress.state == "completed"})
       let notStartedCount = lessons.count(where: {$0.progress.state == "notStarted"})
        if completedCount == lessons.count {
            return "completed"
        }
        
        if notStartedCount == lessons.count {
            return "locked"
        }
        
        return "current"
    }
    
    var achivement: Achievement {
        if completionStatus == "completed" {
           return  Achievement(id: "1", badge: .init(kind: .purple), status: .unlocked, unlockedAt: .now)
        }
        
        if completionStatus == "current" {
            return  Achievement(id: "2", badge: .init(kind: .blue), status: .unlocked, unlockedAt: .now)
        }
        
        return  Achievement(id: "3", badge: .init(kind: .gray), status: .locked, unlockedAt: .now)
    }
    
    var motivationalMessage: String {
        switch completionStatus {

        case "current":
            return "You're making progress — keep going, one step at a time."
        case "completed":
            return "Well done! You've completed an important milestone."
        default:
            return "This lesson will be here when you're ready to begin."
        }
    }
}
