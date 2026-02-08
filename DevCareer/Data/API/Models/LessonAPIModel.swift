//
//  LessonAPIModel.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//


struct LessonAPIModel: Codable {
    let id: String
    let title: String
    let estimatedDurationMinutes: Int
    let progress: LessonProgressAPIModel
}