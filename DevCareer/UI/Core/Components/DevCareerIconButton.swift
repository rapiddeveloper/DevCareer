//
//  IDevCareerconButton.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

/*
  A view that renders a circular button with an icon label
 */
import SwiftUI

struct DevCareerIconButton<Content: View>: View {
    
    @Environment(ThemeStore.self) private var themeStore
    
    var action: () -> Void
    let label: () -> Content
    var size: CGFloat = 40
    
    var body: some View {
        Button {
            action()
        } label: {
            label()
                .frame(width: size, height: size)
                .background(themeStore.iconButtonColor, in: Circle())
        }

    }
}

#Preview {
    DevCareerIconButton {
         
    } label: {
        Image(systemName: "person")
            .resizable()
            .frame(width: 22, height: 22)

    }
    .environment(ThemeStore())

}
