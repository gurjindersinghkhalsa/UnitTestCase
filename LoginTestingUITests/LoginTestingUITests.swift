//
//  LoginTestingUITests.swift
//  LoginTestingUITests
//
//  Created by Gurjinder Singh on 18/06/21.
//

import XCTest

class LoginTestingUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testGameStyleSwitch() {
        
        let app = XCUIApplication()
        let welcomeStaticText = app.staticTexts["WELCOME"]
        welcomeStaticText.tap()
        welcomeStaticText.tap()
        let buton = app.buttons["Check"]
        let button1 = app.staticTexts["Check"]
                if buton.isSelected {
                    XCTAssertTrue(button1.exists)
            button1.tap()
        }
                        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
