//
//  Achievement.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//


struct Achievement {
    let id: UUID
    let badge: Badge
    let status: AchievementStatus
    let unlockedAt: Date?
}