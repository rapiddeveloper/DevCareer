//
//  DevCareerTheme.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

struct DevCareerTheme {
    let colors = DevCareerColors()
    let typography = DevCareerFonts()
    let spacing = DevCareerSpacing()
}

enum DevCareerBtnVariant: String {
    case small
    case medium
    case full
    
    
}

enum DevCareerTextVariant {
    case body
    case button
    case large
    case subheadline
    case subtitle1
    case subtitle2
    case caption1
    case caption2
    case title1
}
