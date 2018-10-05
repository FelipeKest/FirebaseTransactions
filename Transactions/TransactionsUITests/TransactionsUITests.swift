//
//  TransactionsUITests.swift
//  TransactionsUITests
//
//  Created by Felipe Kestelman on 01/10/18.
//  Copyright © 2018 Felipe Kestelman. All rights reserved.
//

import XCTest

class TransactionsUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        print(type(of: self), #function)

        
        let transactionButton = XCUIApplication().buttons["Transaction"]
        
        transactionButton.tap(withNumberOfTaps: 4, numberOfTouches: 1)
    
    
//
//        
//
//
//
//        let app = XCUIApplication()
//        let transactionButton = app.buttons["Transaction"]
//        transactionButton.tap()
        print("acabei o teste")
    }

}
