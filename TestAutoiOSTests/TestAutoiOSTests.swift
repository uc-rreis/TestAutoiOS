//
//  TestAutoiOSTests.swift
//  TestAutoiOSTests
//
//  Created by Rui Reis on 16/07/2024.
//

import XCTest
@testable import TestAutoiOS

final class TestAutoiOSTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit(){
        for i in 0..<50 {
            
            var settingsId = getDefaultSettingsId()
            sdkInit(ucId: settingsId, isRuleset: false)
            
        }
    }

}
