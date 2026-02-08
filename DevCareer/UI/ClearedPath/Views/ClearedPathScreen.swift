//
//  ClearedPathScreen.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

/*
  Abstract: An entry point for the ClearedPath view. It holds data that will be passed down to  the view and it's components
 */

import SwiftUI

struct ClearedPathScreen: View {
    
     @Environment(ThemeStore.self) var themeStore
    
    var body: some View {
         
                ClearedPathView()
                    .presentationDetents([.fraction(themeStore.sheetHeight)])
                    .presentationCornerRadius(themeStore.lgSpacing)
                    .presentationDragIndicator(.visible)
                    .presentationBackground(themeStore.backgroundColor)
            
    }
}

#Preview {
    ClearedPathScreen()
        .environment(ThemeStore())
}
