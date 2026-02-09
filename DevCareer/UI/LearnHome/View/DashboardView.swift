//
//  DashboardView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

import SwiftUI

struct DashboardView: View {
    
    @Environment(ThemeStore.self) private var themeStore
    
    var profile: Profile
    var greeting: Greeting
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack(spacing: 0) {
                    DashboardHeaderView(profile: profile, greeting: greeting)
                        .frame(height: UIConstants.headerHeight)
                    Spacer(minLength: UIConstants.sectionSpacing)
                    Group {
                        LearningPathSectionView(profile: profile)
                        Spacer(minLength: themeStore.xlSpacing)
                        BadgesSectionView(profile: profile)
                    }
                    .padding(.horizontal, themeStore.containerPadding)
                    
                    
                }
                Group {
                    ForTodayView(profile: profile)
                }
                .padding(.bottom, 90)
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
    DashboardView(profile: .init(), greeting: Greeting())
        .ignoresSafeArea()
        .environment(ThemeStore())
}
