//
//  UIExtensions.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

import SwiftUI

extension Color {
    /// Initialize Color with hex integer (e.g. 0xFF5733)
       init(hex: UInt, alpha: Double = 1.0) {
           let red = Double((hex >> 16) & 0xFF) / 255
           let green = Double((hex >> 8) & 0xFF) / 255
           let blue = Double(hex & 0xFF) / 255

           self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
       }

       /// Initialize Color with hex string (e.g. "#FF5733" or "FF5733")
       init(hex string: String, alpha: Double = 1.0) {
           let hex = string
               .trimmingCharacters(in: CharacterSet.alphanumerics.inverted)

           var int: UInt64 = 0
           Scanner(string: hex).scanHexInt64(&int)

           let r, g, b: UInt64

           switch hex.count {
           case 6: // RRGGBB
               (r, g, b) = (
                   (int >> 16) & 0xFF,
                   (int >> 8) & 0xFF,
                   int & 0xFF
               )
           case 8: // AARRGGBB
               (r, g, b) = (
                   (int >> 16) & 0xFF,
                   (int >> 8) & 0xFF,
                   int & 0xFF
               )
               // Override alpha if present
               self.init(
                   .sRGB,
                   red: Double(r) / 255,
                   green: Double(g) / 255,
                   blue: Double(b) / 255,
                   opacity: Double((int >> 24) & 0xFF) / 255
               )
               return
           default:
               self = .clear
               return
           }

           self.init(
               .sRGB,
               red: Double(r) / 255,
               green: Double(g) / 255,
               blue: Double(b) / 255,
               opacity: alpha
           )
       }
}
