//
//  LearnerAPIModel.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import Foundation

struct LearnerAPIModel: Codable {
    let id: String
    let name: String
    let streak: StreakAPIModel
}
