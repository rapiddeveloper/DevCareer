//
//  ContentView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(ThemeStore.self) private var themeStore
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
             DevCareerText("Git & version control mastery earned", variant: .large)
 
         }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(ThemeStore())
}
