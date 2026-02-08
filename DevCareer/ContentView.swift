//
//  ContentView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

import SwiftUI

struct ContentView: View {

    @Environment(ThemeStore.self) private var themeStore
    @Environment(NavigationRouter.self) private var router

    var body: some View {
        
        @Bindable var bindableRouter = self.router
        
        NavigationStack(path: $bindableRouter.path) {
            DashboardScreen()
                .sheet(isPresented: $bindableRouter.isClearedPathScreenPresented) {
                    ClearedPathScreen()
                }
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .cleared:
                        ClearedPathView()
                    case .learn:
                        LearningPathScreen()
                    case .profile:
                        ProfileScreen()
                    default:
                        DashboardScreen()
                    }
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(ThemeStore())
}
