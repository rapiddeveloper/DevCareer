//
//  LearningStageAPIModel.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//


struct LearningStageAPIModel: Codable {
    let id: String
    let title: String
    let order: Int
    let status: String
    let lessons: [LessonAPIModel]
}