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
    var accountManager = AccountStore()
    var router = NavigationRouter()

    var body: some Scene {
        WindowGroup {
            Group {
                if accountManager.isUserSignedIn {
                    ContentView()
                 } else {
                    AuthScreen()
                }
            }
            .environment(themeStore)
            .environment(accountManager)
            .environment(router)

          
        }
    }
}
