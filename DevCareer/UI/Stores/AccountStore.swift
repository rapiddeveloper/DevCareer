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
        let isSaved = dbService.save(profile, key: .profile)
        if isSaved && authService.saveCredentials(credentials) {
            self.profile = profile
        }

        isUserSignedIn = true

    }

    func isAuth() -> Bool {
        return authService.isAuthenticated
    }

    func login(AuthCredentials credentials: AuthCredentials) {
        
        guard let profile = dbService.load(Profile.self, key: .profile),
            let savedCredentials = authService.getCredentials()
        else {
            return
        }
        if profile.email == savedCredentials.email {
            self.profile = profile
            isUserSignedIn = true
        }

    }
    
    

    func logout() {
        isUserSignedIn = false
        //authService.clearCredentials()
        profile = .init()
    }
}
