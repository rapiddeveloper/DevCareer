//
//  Lesson.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import Foundation


struct Lesson: Codable, Identifiable {
    var id: String
    var title: String
    var estimatedDurationMinutes: TimeInterval
    var progress: LessonProgress
   // let scheduledDate: Date?
}
