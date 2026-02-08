//
//  LearningPathScreen.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import SwiftUI

struct LearningPathScreen: View {
    
    @Environment(ThemeStore.self) private var themeStore
    
    var body: some View {
        LearningPathView()
    }
}

#Preview {
    LearningPathScreen()
        .environment(ThemeStore())
    
}
