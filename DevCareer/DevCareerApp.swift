//
//  DevCareerApp.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

import SwiftUI

@main
struct DevCareerApp: App {
    
    var themeStore = ThemeStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(themeStore)
        }
    }
}
