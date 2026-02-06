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
           
    }
}

// MARK: - Style Logic
extension DevCareerText {
    var font: Font {
        switch self.variant {
        case .body:  return themeStore.bodyFont
        case .large: return themeStore.displayLargeFont
        case .button:    return themeStore.buttonFont
        }
    }
    
    var fontColor: Color {
        switch self.variant {
        case .body:  return themeStore.bodyTextColor
        case .button:    return themeStore.onPrimaryColor

        default:
            return themeStore.onBackgroundColor
        }
    }
    
}
