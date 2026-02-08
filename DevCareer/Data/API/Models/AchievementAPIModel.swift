//
//  AchievementAPIModel.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//


struct AchievementAPIModel: Codable {
    let id: String
    let status: String
    let unlockedAt: String?
    let badge: BadgeAPIModel
}