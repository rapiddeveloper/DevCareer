//
//  Badge.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

/*
 A badge for an achievement
 */

import Foundation

struct Badge {
    var kind: BadgeKind
    
    var imageName: String {
        switch kind {
        case .blue:
            return "BadgeBlue"
        case .gray:
            return "BadgeGray"
        case .purple:
            return "BadgePurple"
        case .special:
            return "BadgeSpecial"
        }
    }
    
    var color: String {
        switch kind {
        case .blue:
            return "#007AFF"
        case .gray:
            return ""
        case .purple:
            return "#AF52DE"
        case .special:
            return ""
        }
    }
    
    
}

struct BadgeItem: Identifiable {
    let badge: Badge
    let title: String
    let subtitle: String
    
    let id = UUID()
}

enum BadgeKind: String, CaseIterable {
    case blue
    case gray
    case purple
    case special
    
    
}
