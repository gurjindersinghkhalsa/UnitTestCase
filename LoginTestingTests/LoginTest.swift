//
//  LoginTest.swift
//  LoginTestingTests
//
//  Created by Gurjinder Singh on 18/06/21.
//

@testable import LoginTesting // should be added
import XCTest

class LoginTest: XCTestCase {

    var validation: ValidationService!

    override func setUp() {
        super.setUp()
        validation = ValidationService()
    }
    
    override func tearDown() {
        super.tearDown()
        validation = nil
    }
    
    // All func name should begin with test word otherwise diamond symbol will not show and you can't test
    // XCTAssert is just a expectation against which we are testing
    
    func test_email_is_valid() throws {
        XCTAssertNoThrow(try validation.validateEmail(userEmail: "Gurjinder Singh"))
    }
    
    func test_email_is_nil() throws {
        let expectedError = LoginValidationError.blank
        var error: LoginValidationError?
        XCTAssertThrowsError(try validation.validateEmail(userEmail: nil)){ thrown in
            error = thrown as? LoginValidationError
        }
        XCTAssertEqual(expectedError, error)
    }
    
    func test_email_too_short() throws {
        let expectedError = LoginValidationError.emailTooShort
        var error: LoginValidationError?
        let email = "dsf"
        XCTAssertTrue(email.count < 8)
        XCTAssertThrowsError(try validation.validateEmail(userEmail: email)){ thrown in
            error = thrown as? LoginValidationError
        }
        XCTAssertEqual(expectedError, error)
    }
    
    func test_password_is_nil() throws {
        let expectedError = LoginValidationError.blank
        var error: LoginValidationError?
        XCTAssertThrowsError(try validation.validatePassword(nil)){ thrown in
            error = thrown as? LoginValidationError
        }
        XCTAssertEqual(expectedError, error)
    }
    
    func test_password_is_too_short () throws {
        let expectedError = LoginValidationError.passwordTooShort
        var error: LoginValidationError?
        XCTAssertThrowsError(try validation.validatePassword("12")){ thrown in
            error = thrown as? LoginValidationError
        }
        XCTAssertEqual(expectedError, error)
    }
    

    
    // For API
//    func test_valid_api_response() {
//        let expectations = self.expectation(description: "valid_api_response")
//        // write api call code
//        waitForExpectations(timeout: 0.5, handler: nil)
//    }
}
