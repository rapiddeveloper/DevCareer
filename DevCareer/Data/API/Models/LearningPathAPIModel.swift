//
//  LearningPathAPIModel.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//


struct LearningPathAPIModel: Codable {
    let id: String
    let title: String
    let description: String
    let stages: [LearningStageAPIModel]
}