//
//  CreateAccountView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import SwiftUI

struct SignUpView: View {

    @Environment(ThemeStore.self) private var themeStore
    
 
    @Binding var isLoginViewPresented: Bool
    @State private var credentials = AuthCredentials()
    @State private var isPasswordVisible = false
    
    let onSignUp: (AuthCredentials) -> Void

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {

                // Header
                VStack(spacing: 12) {
                    DevCareerText("Create An Account", variant: .large)

                    DevCareerText("Start your journey to becoming a developer today.", variant: .body)

                    
                }
                .padding(.top, 40)

                // Name Fields
                HStack(spacing: 12) {
                    IconTextField(
                        icon: "person",
                        placeholder: "First Name",
                        text: $credentials.firstName
                    )

                    IconTextField(
                        icon: "person",
                        placeholder: "Last Name",
                        text: $credentials.lastName
                    )
                }

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
                DevCareerButton("Sign Up", action: {
                    onSignUp(credentials)
                 })
                .padding(.top, 8)

                // Footer
                HStack {
                    DevCareerText("Already have an account?", variant: .body)
                    
                    Button("Log In") {
                        isLoginViewPresented = true
                    }
                    .foregroundColor(.appPrimary)
                    .fontWeight(.semibold)
                }
                .padding(.top, 24)

                Spacer()
            }
            .padding()
        }
        .background(themeStore.backgroundColor)
    }
}

#Preview {
    SignUpView(isLoginViewPresented: .constant(false)) { _ in
        
    }
    .environment(ThemeStore())
}
