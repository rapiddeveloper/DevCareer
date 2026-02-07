//
//  DevCareerButton.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

import SwiftUI

struct DevCareerButton<Content: View>: View {

    @Environment(ThemeStore.self) private var themeStore

    var label: Content
    var variant: DevCareerBtnVariant
    var action: () -> Void

    init(
        _ label: String, variant: DevCareerBtnVariant = .full,
        action: @escaping () -> Void = {}
    ) where Content == AnyView {

        self.label = AnyView(
            DevCareerText(label, variant: .button)
        )

        self.variant = variant
        self.action = action
    }

    init(
        @ViewBuilder _ label: @escaping () -> Content,
        variant: DevCareerBtnVariant = .full, action: @escaping () -> Void = {}
    ) {
        self.label = label()
        self.variant = variant
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            label
                .foregroundStyle(themeStore.onPrimaryColor)
                .padding(.vertical, themeStore.smSpacing)
                .padding(.horizontal, themeStore.xsSpacing)
                .buttonFrame(variant)
        }
        .tint(themeStore.primaryColor)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: themeStore.buttonRadius))

    }
}

#Preview {

    VStack {
        DevCareerButton("Show Achievements")
            .environment(ThemeStore())
            .frame(width: 355)
    }
    .padding(20)
}
