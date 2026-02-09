//
//  LearningPath.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import Foundation


struct LearningPath: Codable {
    
    
    let id: String
    let title: String
    let description: String
    let stages: [LearningStage]
    
    static let empty = LearningPath(id: "", title: "", description: "", stages: [])
}
