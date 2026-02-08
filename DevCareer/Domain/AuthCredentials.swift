//
//  AccountCredentials.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

struct AuthCredentials: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var password = ""
    
    var isInvalid: Bool {
        firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty
    }
}
