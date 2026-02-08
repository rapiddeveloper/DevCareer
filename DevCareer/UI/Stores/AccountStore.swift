//
//  Untitled.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import SwiftUI
import Foundation

@Observable
class AccountStore {
    
    var isUserSignedIn: Bool = false
    
    func signup(AuthCredentials credentials: AuthCredentials)  {
        isUserSignedIn = true
    }
    
    func logout( )  {
        isUserSignedIn = false
    }
}
