//
//  PreviewData.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/7/26.
//

extension BadgeItem {
    static var preview: BadgeItem {
        .init(
            badge: .init(kind: .blue),
            title: "Preview",
            subtitle: "This is a preview badge item"
            
        )
    }
    
    static var previewData: [BadgeItem] {
        let subTitle: String = "3/3 pefect scores"
        let item1 = BadgeItem(badge: .init(kind: .blue), title: "Genius", subtitle: subTitle)
        let item2 = BadgeItem(badge: .init(kind: .purple), title: "Genius", subtitle: subTitle)
                              let item3 = BadgeItem(badge: .init(kind: .special), title: "Genius", subtitle:  subTitle)
        return [item1, item3, item2]
    }
}
