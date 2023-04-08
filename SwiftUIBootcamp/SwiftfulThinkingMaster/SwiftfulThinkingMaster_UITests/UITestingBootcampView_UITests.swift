//
//  UITestingBootcampView_UITests.swift
//  SwiftfulThinkingMaster_UITests
//
//  Created by 우주형 on 2023/04/08.
//

import XCTest

// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct]_[ui component]_[expected result]
// Testing Structure: Given, When, Then

final class UITestingBootcampView_UITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launchArguments = ["-UITest_startSignedIn"]
        app.launch()
    }

    override func tearDownWithError() throws {
    }
    
    func test_UITestingBootcampView_signUpButton_shouldNotSignIn() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: false)
        
        // When
        
        let navBar = app.navigationBars["Welcome"]
        
        // Then
        XCTAssertFalse(navBar.exists)
    }
    
    func test_UITestingBootcampView_signUpButton_shouldSignIn() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        //When
        
        let navBar = app.navigationBars["Welcome"]
        
        // Then
        XCTAssertTrue(navBar.exists)
    }
    

    
    func test_SignedInHomeView_showAlertButton_shouldDisplayAlert() {
        
    }
    
    func test_SignedInHomeView_showAlertButton_shouldDisplayAndDismissAlert() {        
        // Given
        let textfield = app.textFields["SignUpTextField"]
        
        // When
        textfield.tap()
        
        let keyA = app.keys["a"]
        keyA.tap()
        keyA.tap()
        keyA.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
        
        let navBar = app.navigationBars["Welcome"]
        XCTAssertTrue(navBar.exists)
        
        let alertButton = app.buttons["ShowAlertButton"]
        alertButton.tap()
        
        let alert = app.alerts.firstMatch
//        XCTAssertTrue(alert.exists)
        
        let alertOKButton = alert.buttons["OK"]
        let exists = alertOKButton.waitForExistence(timeout: 5)
        XCTAssertTrue(exists)
        
        alertOKButton.tap()
        sleep(1)
        // Then
        XCTAssertFalse(alert.exists)
    }
    
    func test_SignedInHomeView_navigationLinkToDestination_shouldNavigateToDestination() {
        
    }
    
    func test_SignedInHomeView_navigationLinkToDestination_shouldNavigateToDestinationAndGoBack() {
        // Given
        let textfield = app.textFields["SignUpTextField"]
        
        // When
        textfield.tap()
        
        let keyA = app.keys["a"]
        keyA.tap()
        keyA.tap()
        keyA.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
        
        let navBar = app.navigationBars["Welcome"]
        XCTAssertTrue(navBar.exists)
        
        let navLinkButton = app.buttons["NavigationLinkToDestination"]
        navLinkButton.tap()
        
        let destinationStaticText = app.staticTexts["Destination"]
        XCTAssertTrue(destinationStaticText.exists)
        
        let backButton = app.navigationBars.buttons["Welcome"]
        backButton.tap()
        
        //Then
        XCTAssertTrue(navBar.exists)
    }
    
}

//MARK: - Functions
extension UITestingBootcampView_UITests {
    func signUpAndSignIn(shouldTypeOnKeyboard: Bool) {
        let textfield = app.textFields["SignUpTextField"]
        textfield.tap()
        
        if shouldTypeOnKeyboard {
            let keyA = app.keys["a"]
            keyA.tap()
            keyA.tap()
            keyA.tap()
        }
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
    }
}
