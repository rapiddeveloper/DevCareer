//
//  Learner.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//


struct Learner {
    let id: UUID
    let name: String
    let currentStreak: Streak
    let activeLearningPath: LearningPath
    let achievements: [Achievement]
}