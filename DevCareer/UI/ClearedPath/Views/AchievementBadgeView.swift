//
//  AchievementBadgeView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

import SwiftUI

struct AchievementBadgeView: View {
    var body: some View {
        ZStack {
            BadgeDecoration()
            
                .clipShape(.rect)
                .frame(width: 331, height: 218)
 
            Image("BadgePurple")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 243, height: 213)
              
        }
     }
}
