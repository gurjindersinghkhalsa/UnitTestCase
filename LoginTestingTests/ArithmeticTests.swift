//
//  ArithmeticTests.swift
//  LoginTestingTests
//
//  Created by Gurjinder Singh on 05/09/22.
//

import XCTest
@testable import LoginTesting

class ArithmeticTests: XCTestCase {

    var arithmethic: Arithmetic!
    
    override func setUpWithError() throws {
        arithmethic = Arithmetic()
    }

    override func tearDownWithError() throws {
        arithmethic = nil
    }

    func testAdditionOfPositiveNumber() throws {
        let num1 = 2
        let num2 = 5
        //when
        let result = arithmethic.add(num1: num1, num2: num2)
        //then
        XCTAssertEqual(result, 7)
    }
    
    func testAdditionOfNegativenumber() throws {
        let num1 = -2
        let num2 = 5
        //when
        let result = arithmethic.add(num1: num1, num2: num2)
        //then
        XCTAssertEqual(result, 3)
    }
    
    func testMulOfNumber() throws {
        let num1 = 5
        let num2 = 5
        //when
        let result = arithmethic.mul(num1: num1, num2: num2)
        //then
        XCTAssertEqual(result, 25)
    }
    
    func testSubOfNumber() throws {
        let num1 = 5
        let num2 = 5
        //when
        let result = arithmethic.sub(num1: num1, num2: num2)
        //then
        XCTAssertEqual(result, 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
