//
//  LearnHomeBottomView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

import SwiftUI

struct DashboardContentView: View {
    
    @Environment(ThemeStore.self) private var themeStore
    
    var body: some View {
        
            VStack(spacing: themeStore.xlSpacing) {
                LearningPathSectionView(profile: .init())
                BadgesSectionView(profile: .init())
            }
            
        
     }
}

 


#Preview {
    ZStack {
        Color.white
        DashboardContentView()
            .environment(ThemeStore())
    }
    .padding()
   
}
