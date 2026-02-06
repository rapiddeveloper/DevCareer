//
//  struct.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//


import SwiftUI

// 1. Create the formal ViewModifier struct
struct ButtonFrameModifier: ViewModifier {
    @Environment(ThemeStore.self) private var themeStore
    
    let variant: DevCareerBtnVariant

    func body(content: Content) -> some View {
        switch variant {
        case .full:
            content.frame(maxWidth: .infinity)
        case .small:
            content.frame(width: themeStore.smButton)
        case .medium:
            content.frame(width: themeStore.mdButton)
        }
    }
}

// 2. Add a convenience extension to View for easy access
extension View {
    func buttonFrame(_ variant: DevCareerBtnVariant) -> some View {
        self.modifier(ButtonFrameModifier(variant: variant))
    }
}
