//
//  StreakAPIModel.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//


struct StreakAPIModel: Codable {
    let currentCount: Int
    let longestCount: Int
    let lastActiveDate: String
}