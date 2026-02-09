//
//  Untitled.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import Foundation
import SwiftUI

struct Profile: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var currentStreak: Streak = .default
    var activeLearningPath: LearningPath = .empty
    var activeStage: LearningStage = .init()
    var achievements: [Achievement] = []
    var activeLearningPathId: String = ""
    var todayLesson: Lesson?
    
    var isEnrolled: Bool {
        !activeLearningPathId.isEmpty
    }
}

@MainActor
@Observable
class AccountStore {

    //    var isUserSignedIn: Bool {
    //        return profile.firstName != "" && profile.lastName != "" && profile.email != ""
    //    }

    var isUserSignedIn = false

    var authService: AuthServiceProtocol
    var dbService: LocalDBServiceProtocol
    var profile: Profile = .init()

    
    var userName: String {
        return "\(profile.firstName.first ?? " ")\(profile.lastName.first ?? " ")"
    }
    
    var firstName: String {
        return profile.firstName
    }

    init(
        authService: AuthServiceProtocol = AuthService.shared,
        dbService: LocalDBServiceProtocol = LocalDBService.shared
    ) {
        self.authService = authService
        self.dbService = dbService
        if let profile = dbService.load(Profile.self, key: .profile) {
            self.profile = profile
            if profile.email != "" {
                self.isUserSignedIn = true
            }
            
        }
    }

    func signup(AuthCredentials credentials: AuthCredentials) {

        if credentials.isInvalid {
            return
        }

        let profile = Profile(
            firstName: credentials.firstName,
            lastName: credentials.lastName,
            email: credentials.email
        )
        let isSaved = dbService.save(profile, key: profile.email)
        if isSaved && authService.saveCredentials(credentials) {
            self.profile = profile
        }
        
        let _ = dbService.save(true, key: .session)
        isUserSignedIn = true

    }

    
    func isRegistered() -> Bool {
        
        return authService.isSignedUp
    }

    func login(authCredentials credentials: AuthCredentials) {
        
        print(dbService.load(Profile.self, key: credentials.email))
        print(authService.getCredentials())
        guard let profile = dbService.load(Profile.self, key: credentials.email)
        else {
            return
        }
        self.profile = profile
        let _ = dbService.save(true, key: .session)
       isUserSignedIn = true
        

    }
    
    func updateUserLearningPath(fromPaths paths: [LearningPath]) {
        guard !paths.isEmpty else { return }
        
        if !profile.isEnrolled {
            if let firstPath = paths.first,
               let firstStage = firstPath.stages.first,
               let firstLesson = firstStage.lessons.first {
                profile.activeLearningPath = firstPath
                profile.activeStage = firstStage
                profile.todayLesson = firstLesson
            }
        }
         
    }
    
    func updateSignedInStatus() {
        let hasSession = dbService.load(Bool.self, key: .session) ?? false
        print(hasSession)
        if hasSession, let credentials = authService.getCredentials() {
            login(authCredentials: credentials)
        }
        //isUserSignedIn = hasSession && authService.isAuthenticated
    }

        func generateGreeting(
            date: Date = Date(),
            calendar: Calendar = .current
        ) -> Greeting {

            let hour = calendar.component(.hour, from: date)

            let timeOfDay: TimeOfDay
            let message: String
            let subtitle: String

            switch hour {
            case 5..<12:
                timeOfDay = .morning
                message = "Good morning, \(firstName)!"
                subtitle = "Ready to start learning today"

            case 12..<17:
                timeOfDay = .afternoon
                message = "Good afternoon, \(firstName)!"
                subtitle = "Let’s keep the momentum going"

            default:
                timeOfDay = .evening
                message = "Good evening, \(firstName)"
                subtitle = " A small lesson before rest goes a long way"

            }

            return Greeting(timeOfDay: timeOfDay, message: message, subtitle: subtitle)
        }
    

    func logout() {
      //  print(authService.getCredentials())
       // authService.deleteRegistered()
       //authService.clearCredentials()
        let _ = dbService.save(false, key: .session)
        isUserSignedIn = false
        profile = .init()
    }
}
