//
//  SignUpScreen.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import SwiftUI

struct AuthScreen: View {
    
    var signup: (AuthCredentials) -> Void = { _ in }
    @State private var isPresented: Bool = false
    @State private var isSignUpPresented: Bool = false
    @Environment(ThemeStore.self) private var themeStore
    @Environment(AccountStore.self) private var accountManager

    @State var isSignedOut: Bool = true
    @State var profileExists: Bool = false

    var body: some View {
        
        Group {
            if !accountManager.isUserSignedIn && !profileExists {
                WelcomeView(isSignupViewPresented: $isSignUpPresented)
                    .fullScreenCover(isPresented: $isSignUpPresented) {
                        SignUpView( isLoginViewPresented: $isPresented, onSignUp: accountManager.signup)
                            .sheet(isPresented: $isPresented) {
                                NavigationStack {
                                    LoginView(onLogin: accountManager.signup) // Supposed to be screen
                                        .toolbar {
                                            ToolbarItem(placement: .topBarTrailing) {
                                                Button {
                                                    isPresented = false
                                                } label: {
                                                    Image(systemName: "xmark.circle.fill")
                                                        .foregroundStyle(themeStore.onPrimaryColor, themeStore.primaryColor)
                                                }

                                              
                                            }
                                        }
                                }
                            }
                    }
            } else {
                LoginView(onLogin: signup) // Supposed to be screen
            }
        }
       
       
    }
}

#Preview {
    NavigationStack {
        AuthScreen()
            .environment(ThemeStore())
    }
  
}
