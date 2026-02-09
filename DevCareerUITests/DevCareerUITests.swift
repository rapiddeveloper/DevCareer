//
//  DevCareerUITests.swift
//  DevCareerUITests
//
//  Created by Orisajobi Akinbola on 2/6/26.
//

import XCTest

final class when_content_view_is_presented: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app = XCUIApplication()
    }
    
    func test_view_fullpath_button_is_present()  {
         app.launch()
         let viewfullpathbutton = app.buttons["fullPathButton"]
         XCTAssertTrue(viewfullpathbutton.exists)
    }
     
}
