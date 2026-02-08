//
//  LearningStage.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import Foundation


struct LearningStage {
    let id: UUID
    let title: String
    let order: Int
    let lessons: [Lesson]
    let status: StageStatus
}
