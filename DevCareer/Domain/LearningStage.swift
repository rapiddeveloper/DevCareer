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
}
