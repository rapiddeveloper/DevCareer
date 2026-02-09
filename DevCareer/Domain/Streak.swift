//
//  Streak.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import Foundation

struct Streak: Codable {
    let currentCount: Int
    let longestCount: Int
    let lastActiveDate: Date
    
    static let `default`: Streak = .init(currentCount: 0, longestCount: 0, lastActiveDate: Date())
}
