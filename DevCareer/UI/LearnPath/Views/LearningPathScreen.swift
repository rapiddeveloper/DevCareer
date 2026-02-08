//
//  LearningPathScreen.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import SwiftUI

struct SwipeBackEnabler: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        DispatchQueue.main.async {
            vc.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        }
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct LearningPathScreen: View {
    
    @Environment(ThemeStore.self) private var themeStore
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        LearningPathView()
            .navigationBarBackButtonHidden()
        .background(SwipeBackEnabler())
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                   
                        SVGImage(svg: "BackIcon", width: 20, height: 20, color: .black)
                     
                 }
            }
        }
    }
}

#Preview {
    LearningPathScreen()
        .environment(ThemeStore())
    
}
