//
//  DashboardView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

import SwiftUI

struct DashboardView: View {
    
    @Environment(ThemeStore.self) private var themeStore
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                DashboardHeaderView()
                    .frame(height: UIConstants.headerHeight)
                Spacer(minLength: UIConstants.sectionSpacing)
                Group {
                    LearningPathSectionView()
                                   Spacer(minLength: themeStore.xlSpacing)
                                   BadgesSectionView()
                }
                .padding(.horizontal, themeStore.containerPadding)
               
                
            }
        }
        .padding(.bottom, themeStore.xxlSpacing)
        .background(themeStore.backgroundColor)
    }
}

extension DashboardView {
    private struct UIConstants {
        static let headerHeight: CGFloat = 472
        static let sectionSpacing: CGFloat = 72
    }
}

#Preview {
    DashboardView()
        .ignoresSafeArea()
        .environment(ThemeStore())
}
