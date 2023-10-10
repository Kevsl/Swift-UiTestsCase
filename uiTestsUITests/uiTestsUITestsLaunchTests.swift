import XCTest

final class uiTestsUITestsLaunchTests: XCTestCase {
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testWrongLogin() throws {
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
    
    
    
    func testRightLogin() throws {
        let app = XCUIApplication()
        app.launch()
        
        let testedEmail = "email@email.com"
        let emailField = app.textFields["Email"]
        let passwordField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordField.exists)
        XCTAssertTrue(emailField.exists)
        let loginButton = app.buttons["Login"]
        XCTAssertTrue(loginButton.exists)
        
        emailField.tap()
        emailField.typeText(testedEmail)
        passwordField.tap()
        passwordField.typeText("1234567")
        loginButton.tap()

        let email = app.staticTexts[testedEmail]
        XCTAssertTrue(email.exists)
    }
    
}
