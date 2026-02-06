//
//  Spacing.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

/*
 Abstract: Spacing for Theme
 */

import Foundation

struct DevCareerSpacing {

    static let baseUnit: CGFloat = 4.0

    // MARK: - Scale (raw spacing)
    let xs: CGFloat = baseUnit * 1    // 4
    let sm: CGFloat = baseUnit * 2    // 8
    let md: CGFloat = baseUnit * 3    // 12
    let lg: CGFloat = baseUnit * 6    // 24
    let xl: CGFloat = baseUnit * 8    // 32
    let xxl: CGFloat = baseUnit * 12  // 48
    let xxxl: CGFloat = baseUnit * 16 // 64

    // MARK: - Semantic tokens
    var buttonPadding: CGFloat { md }
    var cardPadding: CGFloat { lg }
    var sectionSpacing: CGFloat { xl }
    var screenPadding: CGFloat { md }
    var containerPadding: CGFloat { DevCareerSpacing.baseUnit * 4 }

    // MARK: - Radius tokens (still spacing)
     var buttonRadius: CGFloat { sm }
}
