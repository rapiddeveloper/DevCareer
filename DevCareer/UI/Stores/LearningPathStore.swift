//
//  LearningPathStore.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import SwiftUI

@MainActor
@Observable
class LearningPathStore {
    
    var learningPaths: [LearningPath] = []
    var isLoading = true
    
    init(learningPathsService: LearningPathsServiceProtocol = LearningPathsService()) {
        Task  { @MainActor in
            do {
                let paths = try await learningPathsService.fetchLearningPaths()
                self.learningPaths = paths
                isLoading = false
            } catch {
                isLoading = false
                 print("Error fetching learning paths: \(error)")
            }
        }
      
   
        
    }
    
    
}
