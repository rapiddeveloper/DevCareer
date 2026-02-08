//
//  DevCareerText.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

/*
 A view that shows a themed Text
 */

import SwiftUI

struct DevCareerText: View {
    let label: String
    let variant: DevCareerTextVariant
     @Environment(ThemeStore.self) private var themeStore
    
    init(_ label: String, variant: DevCareerTextVariant = .body) {
        self.label = label
        self.variant = variant
     }
    
    var body: some View {
        Text(label)
            .font(font)
            .foregroundStyle(fontColor)
            //.kerning(kerning)
            
           
    }
}

// MARK: - Style Logic
extension DevCareerText {
    private var font: Font {
        switch self.variant {
        case .subtitle1: return themeStore.subtitle1Font
        case .subtitle2: return themeStore.subtitle2Font
        case .subheadline: return themeStore.subheadlineFont
        case .body:  return themeStore.bodyFont
        case .large: return themeStore.displayLargeFont
        case .button:    return themeStore.buttonFont
        case .title1:    return themeStore.title1Font
        case .caption1:
             return themeStore.caption1Font
        case .caption2:
            return themeStore.caption2Font
        }
    }
    
    private var fontColor: Color {
        switch self.variant {
        case .body:  return themeStore.bodyTextColor
        case .button:    return themeStore.onPrimaryColor
        case .caption1, .caption2: return themeStore.softTextColor
        default:
            return themeStore.onBackgroundColor
        }
    }
    
    private var kerning: CGFloat {
        switch self.variant {
        case .caption1, .caption2:  return 0

        default:
            return  -2
        }
    }
    
}
