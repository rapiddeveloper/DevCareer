//
//  NavigationRouter.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

/*
  An observable model for handling navigation
 */

import SwiftUI

enum Route {
    case dashboard
    case learn
    case cleared
    case profile
}

@Observable
class NavigationRouter {
    
    var path = NavigationPath()
    private(set) var route: Route? = .dashboard
    private(set) var mainRoutes : [Route] = [.dashboard, .cleared, .learn]
 
    var isClearedPathScreenPresented = false
    var isProfileScreenPresented = false
    var selectedStage: LearningStage?

    func navigateTo(_ route: Route, withSelectedStage stage: LearningStage? = nil) {
        if route == .cleared {
            isClearedPathScreenPresented = true
            if let stage = stage {
                selectedStage = stage
            }
        } else {
            path.append(route)

        }
    }
    
    func stopPresentingClearedPathScreen() {
        isClearedPathScreenPresented = false
    }
    
    func stopPresentingProfileScreen() {
        isProfileScreenPresented = false
    }
    
}
