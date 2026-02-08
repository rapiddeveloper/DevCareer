//
//  ProfileView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(AccountStore.self) private var accountManager
    
    var body: some View {
        ZStack {
            DevCareerButton("Log Out") {
                accountManager.logout()
            }
        }
        .padding()
        .navigationTitle("Profile")
    }
}

#Preview {
    ProfileView()
}
