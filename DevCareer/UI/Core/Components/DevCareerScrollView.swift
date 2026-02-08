//
//  DevCareerScrollView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import SwiftUI

struct DevCareerScrollView<Content: View>: View {
    
    @Environment(ThemeStore.self) private var themeStore
    var content: Content
    
    init(content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ScrollView {
            content
        }
        .padding(.bottom, themeStore.xxlSpacing)
        .background(themeStore.backgroundColor)
    }
}

#Preview {
    DevCareerScrollView() {
        Text("Hello World.")
    }
    .environment(ThemeStore())
}
