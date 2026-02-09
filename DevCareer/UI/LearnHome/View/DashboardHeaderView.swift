//
//  DashboardHeaderView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

import SwiftUI



struct DashboardHeaderView: View {
    
    @Environment(ThemeStore.self) private var themeStore
 
    //@State private var greeting = Greeting()
    var profile: Profile
    var greeting: Greeting

    
    let gradient = RadialGradient(
        stops: [
            .init(color: UIConstants.centerColor, location: UIConstants.stop0),
            .init(color: UIConstants.midColor, location: UIConstants.stop50),
            .init(color: UIConstants.outerColor, location: UIConstants.stop100)
        ],
        center: .center,
        startRadius: UIConstants.startRadius,
        endRadius: UIConstants.endRadius
    )
    
   // #2467E380
    let glowColor: Color = .blue //Color(hex: "#2467E3")

    var body: some View {
        ZStack {
            Image(.ySoSerious)
                .resizable()
            gradient
            // Glow layers
            glowOverlay
 
            
            VStack {
                Image(.mascot)
                    .resizable()
                    .frame(width: 160, height: 175)
                
                VStack(spacing: themeStore.xsSpacing) {
                    DevCareerText(greeting.message, variant: .large)
                        .multilineTextAlignment(.center)
                    DevCareerText(greeting.subtitle)

                }
            }
         }
//        .onAppear {
//            greeting = accountStore.generateGreeting()
//        }
         
    }
}

extension DashboardHeaderView {
    var glowOverlay: some View {
        Group {
            GlowCircle(
                    size: 280,
                    blur: 140,
                    opacity: 0.22,
                    color: .blue,
                    x: 1.5,
                    y: 0.19
                )

                GlowCircle(
                    size: 240,
                    blur: 120,
                    opacity: 0.2,
                    color: .blue,
                    x: 0.95,
                    y: 0.37
                )

                GlowCircle(
                    size: 300,
                    blur: 150,
                    opacity: 0.18,
                    color: .blue,
                    x: -0.86,
                    y: 0.23
                )

                GlowCircle(
                    size: 260,
                    blur: 130,
                    opacity: 0.2,
                    color: .blue,
                    x: -0.86,
                    y: 0.14
                )
 
        }
    }
    private struct UIConstants {
            // Color Stops
            static let centerColor = Color.white
            static let midColor = Color.white.opacity(0.5)
            static let outerColor = Color(hex: "#D8D1FF")
            
            //  Locations
            static let stop0: CGFloat = 0.0
            static let stop50: CGFloat = 0.5
            static let stop100: CGFloat = 1.0
            
            // Dimensions
            static let startRadius: CGFloat = 0.0
            static let endRadius: CGFloat = 300.0
        }
}

#Preview {
    DashboardHeaderView(profile: .init(), greeting: Greeting())
        .frame(height: 500.0)
        .environment(ThemeStore())

}
