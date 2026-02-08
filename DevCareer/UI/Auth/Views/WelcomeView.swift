//
//  LoginView 2.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

 

import SwiftUI

struct WelcomeView: View {

    @Environment(ThemeStore.self) private var themeStore
    
    
    @State private var credentials = AuthCredentials()
    @State private var isPasswordVisible = false
    
    @Binding var isSignupViewPresented: Bool
    
    var body: some View {
        VStack(spacing: themeStore.xxxlSpacing * 3 ) {
                 
                // Header
                VStack(spacing: themeStore.xlSpacing) {
                    DevCareerText("Wecome to DevCareer", variant: .large)

                    DevCareerText("Make your developer dreams come true, start building your career today.", variant: .subheadline)
                        .multilineTextAlignment(.center)

                    
                }
                .padding(.top, 40)

                 
                
                
                // Sign Up
                DevCareerButton("Get Started", action: {
                    //onLogIn(credentials)
                    isSignupViewPresented = true
                 })
                .padding(.top, 8)

                 

                Spacer()
            }
            .padding()
            .background(themeStore.backgroundColor)
    }
}

#Preview {
    WelcomeView(isSignupViewPresented: .constant(false))
    .environment(ThemeStore())
}
