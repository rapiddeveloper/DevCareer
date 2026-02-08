//
//  ProgressSummaryAPIModel.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//


struct ProgressSummaryAPIModel: Codable {
    let completedLessons: Int
    let totalLessons: Int
    let completedStages: Int
    let totalStages: Int
}