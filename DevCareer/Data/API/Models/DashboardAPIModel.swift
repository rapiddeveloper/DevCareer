//
//  DashboardAPIModel.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//


struct DashboardAPIModel: Codable {
    let greeting: GreetingAPIModel
    let dailyLearning: DailyLearningAPIModel
    let progressSummary: ProgressSummaryAPIModel
}