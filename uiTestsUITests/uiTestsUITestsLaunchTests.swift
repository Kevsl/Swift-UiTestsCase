//
//  uiTestsUITestsLaunchTests.swift
//  uiTestsUITests
//
//  Created by K on 10/10/2023.
//

import XCTest

final class uiTestsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
     
            
        
        let emailField = app.textFields["Email"]
        XCTAssertTrue(emailField.exists)
        emailField.tap()
        emailField.typeText("Mauvais format d'email")
     

        let passwordField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordField.exists)
        passwordField.tap()
        passwordField.typeText("123")
        

        let loginButton = app.buttons["Login"]
        XCTAssertTrue(loginButton.exists)
        loginButton.tap()
        
        
        
        let alert = app.alerts["Login Failed"]
        XCTAssertTrue(alert.exists)
                

    }
}
