//
//  DailyLearningAPIModel.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//


struct DailyLearningAPIModel: Codable {
    let date: String
    let lesson: LessonAPIModel
    let motivationalMessage: MotivationalMessageAPIModel
}