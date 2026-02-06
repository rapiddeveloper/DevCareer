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
            Text("Git & version control mastery earned")
 
         }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(ThemeStore())
}
