//
//  Achievement.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import Foundation

struct Achievement: Codable {
    let id: String
    let badge: Badge
    let status: AchievementStatus
    let unlockedAt: Date?
}
