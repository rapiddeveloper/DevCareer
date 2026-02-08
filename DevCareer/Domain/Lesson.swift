//
//  Lesson.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import Foundationt


struct Lesson {
    let id: UUID
    let title: String
    let estimatedDuration: TimeInterval
    let progress: LessonProgress
    let scheduledDate: Date?
}
