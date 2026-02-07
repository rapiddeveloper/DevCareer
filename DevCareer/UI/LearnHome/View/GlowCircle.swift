//
//  GlowCircle.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

import SwiftUI

struct GlowCircle: View {
    let size: CGFloat
    let blur: CGFloat
    let opacity: Double
    let color: Color

    /// Normalized Figma position (top-left origin)
    let x: CGFloat
    let y: CGFloat

    var body: some View {
        GeometryReader { geo in
            Circle()
                .fill(color)
                .frame(width: size, height: size)
                .opacity(opacity)
                .blur(radius: blur)
                .position(
                    x: geo.size.width * x + size / 2,
                    y: geo.size.height * y + size / 2
                )
        }
    }
}
