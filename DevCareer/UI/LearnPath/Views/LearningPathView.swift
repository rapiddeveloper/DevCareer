//
//  LearningPathView.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import SwiftUI
import UIKit

struct LearningPathView: View {

    let badge = Badge(kind: .gray)

    var body: some View {

        ScrollView {

            VStack(alignment: .leading) {
                header
                ForEach(0..<5, id: \.self) { idx in
                    LessonCardView {
                        CircularProgressView(progress: 0.0) {
                            BadgeView(badge, width: 82.0, height: 72.0)
                        }
                        .frame(width: 112.0, height: 112.0)

                    }
                }
            }
            .padding()
        }
        //.background(SwipeBackEnabler())
        /*
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                   // dismiss()
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                }
            }
        }*/
    }
}

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

extension LearningPathView {

    var header: some View {
        VStack(alignment: .leading) {
            DevCareerText("Stage 1 of 10")
            DevCareerText("Fullstack mobile engineer path", variant: .title1)
                .multilineTextAlignment(.leading)

        }
        .containerRelativeFrame(.horizontal, alignment: .leading) { len, axis in
            if axis == .horizontal {
                return len * 0.7
            }
            return len
        }
    }
}

#Preview {
    LearningPathView()
        .environment(ThemeStore())
}
