//
//  IconTextField.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//


import SwiftUI

struct IconTextField: View {
    
    @Environment(ThemeStore.self) private var themeStore

    let icon: String
    let placeholder: String
    var isSecure: Bool = false
    var trailingIcon: String? = nil
    var onTrailingTap: (() -> Void)? = nil

    @Binding var text: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.gray)

            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }

            if let trailingIcon {
                Button(action: { onTrailingTap?() }) {
                    Image(systemName: trailingIcon)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(themeStore.backgroundColor)
        .cornerRadius(14)
    }
}
