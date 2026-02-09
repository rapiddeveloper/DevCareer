//
//  BadgesSection.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

import SwiftUI

struct BadgesSectionView: View {
    
    @Environment(ThemeStore.self) private var themeStore
    var profile: Profile

    
    var body: some View {
        VStack(alignment: .leading, spacing: themeStore.mdSpacing) {
            DevCareerText("Badges", variant: .subheadline)
            
            LazyVGrid(columns: UIConstants.columns, spacing: themeStore.containerPadding) {
                // Hardcoded Badge Items
                ForEach(BadgeItem.previewData) { badgeItem in
                    BadgeItemView(badgeItem)
                }
            }
            .padding(0)
         }
    }
}

extension BadgesSectionView {
    private struct UIConstants {
        // MARK: - Layout
         static let gridSpacing: CGFloat = 0.0
        static let columns = [
            GridItem(.flexible(), spacing: nil),
            GridItem(.flexible(), spacing: nil),
            GridItem(.flexible(), spacing: nil)
        ]
        
        
    }
}


#Preview {
    BadgesSectionView(profile: .init())
        .environment(ThemeStore())
}
