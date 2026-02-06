//
//  ThemeStore.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

/*
 A store for managing all possible themes the app might have.
 It provides fonts, colors and spacing for app's ui
 */

import SwiftUI
import Foundation
import Observation


@Observable
final class ThemeStore {
    
    private var theme = DevCareerTheme()
    
}

extension ThemeStore {
    
    var primaryColor: Color {
        theme.colors.primary
    }
    
    var onPrimaryColor: Color {
        theme.colors.background
    }
    
    var backgroundColor: Color {
        theme.colors.background
    }
    
    
    var onBackgroundColor: Color {
        theme.colors.background
    }
    
    var displayLargeFont: Font {
        theme.typography.displayLarge
    }
    
    var buttonFont: Font {
        theme.typography.button
    }
    
    var bodyFont: Font {
        theme.typography.body
    }
    
    var mdButton: CGFloat {
        200
    }
    var smButton: CGFloat {
        100
    }
    
    var xsSpacing: CGFloat { theme.spacing.xs }
    var smSpacing: CGFloat { theme.spacing.sm }
    var mdSpacing: CGFloat { theme.spacing.md }
    var lgSpacing: CGFloat { theme.spacing.lg }
    var xlSpacing: CGFloat { theme.spacing.xl }
    var xxlSpacing: CGFloat { theme.spacing.xxl }
    var xxxlSpacing: CGFloat { theme.spacing.xxxl }

    var buttonRadius: CGFloat { theme.spacing.buttonRadius }
    var buttonPadding: CGFloat { theme.spacing.buttonPadding }
    var cardPadding: CGFloat { theme.spacing.cardPadding }
    var sectionSpacing: CGFloat { theme.spacing.sectionSpacing }
    var screenPadding: CGFloat { theme.spacing.screenPadding }
    var containerPadding: CGFloat { theme.spacing.containerPadding }
}
