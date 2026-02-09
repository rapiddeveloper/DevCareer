//
//  LearningPathStore.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import SwiftUI

@Observable
class LearningPathStore {
    
    var learningPaths: [LearningPath] = []
    
    var currentPath: LearningPath?
    var currentStages: [LearningStage] = []
    var currentStage: LearningStage = .init()
    var currentLesson: Lesson = .init(id: "", title: "", estimatedDurationMinutes: 0, progress: .init(state: "notStarted"))
    var currentLessons: [Lesson] = []
    var currentStageNo: Int {
        guard let number  = currentPath?.stages.firstIndex(where: {$0.id == currentStage.id}) else {
            return 1 // not working
        }
        return number + 1
    }
    
    var totalStages: Int {
        currentPath?.stages.count ?? 0
    }
    
    init(learningPathsService: LearningPathsServiceProtocol = LearningPathsService()) {
        Task  { @MainActor in
            do {
                let paths = try await learningPathsService.fetchLearningPaths()
                self.learningPaths = paths
                let path = paths[0]
                currentPath = path
                currentStages = path.stages
                currentStage = path.stages.first ?? .init()
                currentLessons = path.stages.first?.lessons ?? []
                currentLesson = path.stages.first?.lessons.first ?? .init(id: "", title: "", estimatedDurationMinutes: 0, progress: .init(state: "notStarted"))
            } catch {
                 print("Error fetching learning paths: \(error)")
            }
        }
      
   
        
    }
    
    
}
