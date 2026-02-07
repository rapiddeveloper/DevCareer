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
                LearningPathSectionView()
                BadgesSectionView()
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
