//
//  DashboardScreen.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

import SwiftUI

struct DashboardScreen: View {

    @Environment(ThemeStore.self) private var themeStore
    
    let headerColor = Color(uiColor: .init(red: 134/255, green: 54/255, blue: 232/255, alpha: 0.26))


    var body: some View {
        DashboardView()
            .ignoresSafeArea()
           /*
            .safeAreaInset(edge: .top) {
                HStack {
                    DevCareerIconButton {

                    } label: {
                        DevCareerText("TA", variant: .subtitle2)
                            .foregroundStyle(themeStore.brandTextColor)
 
                    }
                    Spacer()
                    
                    DevCareerOutlineButton(action: {}) {
                        HStack(spacing: 8) {
                            SVGImage(
                                svg: "Days", width: 12, height: 12,
                                color: themeStore.fireColor)
                            DevCareerText("3 Days", variant: .subtitle1)
                        }
                    }
                    Spacer()
                    DevCareerIconButton {

                    } label: {
                        SVGImage(
                            svg: "NotificationIcon",
                            width: 22,
                            height: 22,
                            color: themeStore.onBackgroundColor
                        )

                    }
                }
                .padding(.horizontal, themeStore.containerPadding)
            }*/
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    DevCareerOutlineButton(action: {}) {
                        HStack(spacing: 8) {
                            SVGImage(
                                svg: "Days", width: 12, height: 12,
                                color: themeStore.fireColor)
                            DevCareerText("3 Days", variant: .subtitle1)
                        }
                    }
                }

                ToolbarItem(placement: .topBarLeading) {
                    DevCareerIconButton {

                    } label: {
                        DevCareerText("TA", variant: .subtitle2)
                            .foregroundStyle(themeStore.brandTextColor)
 
                    }

                }
                 
                ToolbarItem(placement: .topBarTrailing) {
                    DevCareerIconButton {

                    } label: {
                        SVGImage(
                            svg: "NotificationIcon",
                            width: 22,
                            height: 22,
                            color: themeStore.onBackgroundColor
                        )

                    }

                }
            }
    
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbarBackground(.visible, for: .navigationBar)
//            .toolbarBackground(headerColor, for: .navigationBar)
        
    }
}

#Preview {
    NavigationStack {
        DashboardScreen()
            .environment(ThemeStore())
    }
}
