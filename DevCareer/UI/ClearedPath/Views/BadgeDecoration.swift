//
//  BadgeDecoration.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//


import SwiftUI

struct BadgeDecoration: View {
    
    @Environment(ThemeStore.self) private var themeStore
    let  petalCount = 8
 
    var body: some View {
        ZStack {
            // Background to match the original image
            Color.clear.ignoresSafeArea()
            
            // Generate 8 petals rotating around the center
            ForEach(0..<petalCount, id: \.self) { i in
                TrianglePetal()
                    .stroke(themeStore.petalBorderColor, lineWidth: 1.0)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.white.opacity(0.8), themeStore.petalColor]),
                            startPoint: .center,
                            endPoint: .top
                        )
                    )
                    .rotationEffect(.degrees(Double(i) * 45))
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct TrianglePetal: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        // Define the width of the petal's outer edge
        // Adjust the multiplier (0.15) to make petals wider or thinner
        let petalWidth = rect.width * 0.1
        
        // Start at the center point
        path.move(to: center)
        
        // Draw to the top-left of the petal edge
        path.addLine(to: CGPoint(x: rect.midX - petalWidth, y: rect.minY))
        
        // Draw to the top-right of the petal edge
        path.addLine(to: CGPoint(x: rect.midX + petalWidth, y: rect.minY))
        
        // Close back to the center
        path.closeSubpath()
        
        return path
    }
}

// Preview
struct BadgeDecoration_Previews: PreviewProvider {
    static var previews: some View {
        BadgeDecoration()
            .frame(width: 300, height: 300)
            .environment(ThemeStore())
    }
}
