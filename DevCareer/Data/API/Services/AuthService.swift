//
//  Token.swift
//  Voltis
//
 

import Foundation
import KeychainSwift
 
protocol AuthServiceProtocol {
    var isAuthenticated: Bool { get }
    var isSignedUp: Bool { get }

    func saveCredentials(_ credentials: AuthCredentials) -> Bool
    func getCredentials() -> AuthCredentials?
    func clearCredentials()
    func deleteRegistered()

}

class AuthService: AuthServiceProtocol {
 
    static let shared = AuthService()
    let keychain = KeychainSwift()

    private init() {}
    
    let credentialsKey = "credentials"
    let signupKey = "isSignup"
    @discardableResult
    func saveToken(token: String) -> Bool {
        
        return keychain.set(token, forKey: "token")
    }
    
    func getToken() -> String? {
        
        return keychain.get("token")
    }
    
    @discardableResult
    func saveCredentials(_ credentials: AuthCredentials) -> Bool {
       
        guard let data = try? JSONEncoder().encode(credentials) else {
            return false
        }
        return keychain.set(data, forKey: credentialsKey) && keychain.set(true, forKey: signupKey)
    }
    
    @discardableResult
    func getCredentials() -> AuthCredentials? {
        
        let decoder = JSONDecoder()

        guard let data =  keychain.getData(credentialsKey),
              let credentials = try? decoder.decode(AuthCredentials.self, from: data) else {
            return nil
        }
        return credentials
    }
    
    func clearCredentials() {
        keychain.delete(credentialsKey)
    }
    
    func deleteRegistered() {
        keychain.delete(credentialsKey)
        keychain.delete(signupKey)
    }
    
    var isAuthenticated: Bool {
        return getCredentials() != nil
    }
    
    var isSignedUp: Bool {
        
        return keychain.getBool(signupKey) != nil
    }
}
