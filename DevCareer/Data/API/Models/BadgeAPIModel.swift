//
//  BadgeAPIModel.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//


struct BadgeAPIModel: Codable {
    let id: String
    let title: String
    let description: String
    let iconName: String
    let milestone: MilestoneAPIModel
}