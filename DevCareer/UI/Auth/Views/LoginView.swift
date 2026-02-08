//
//  SignUpView 2.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//


//
//  CreateAccountView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import SwiftUI

struct LoginView: View {

    @Environment(ThemeStore.self) private var themeStore
    
    
    @State private var credentials = AuthCredentials()
    @State private var isPasswordVisible = false
    
    let onLogin: (AuthCredentials) -> Void

    var body: some View {
             VStack(spacing: 24) {

                // Header
                VStack(spacing: 12) {
                    DevCareerText("Log In", variant: .large)

                    DevCareerText("Continue your journey to becoming a developer today.", variant: .body)

                    
                }
                .padding(.top, 40)

                 
                // Email
                IconTextField(
                    icon: "envelope",
                    placeholder: "hello@example.com",
                    text: $credentials.email
                )

                // Password
                IconTextField(
                    icon: "lock",
                    placeholder: "Password",
                    isSecure: !isPasswordVisible,
                    trailingIcon: isPasswordVisible ? "eye.slash" : "eye",
                    onTrailingTap: {
                        isPasswordVisible.toggle()
                    },
                    text: $credentials.password
                )

                
                // Sign Up
                DevCareerButton("Continue", action: {
                    onLogin(credentials)
                 })
                .padding(.top, 8)

                 

                Spacer()
            }
            .padding()
            .background(themeStore.backgroundColor)
    }
}

#Preview {
    LoginView( ) { _ in
        
    }
    .environment(ThemeStore())
}
