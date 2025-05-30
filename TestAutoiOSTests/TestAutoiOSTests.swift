//
//  TestAutoiOSTests.swift
//  TestAutoiOSTests
//
//  Created by Rui Reis on 16/07/2024.
//

import XCTest
import Usercentrics
@testable import TestAutoiOS

final class TestAutoiOSTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit(){
//        setSettingsId(settingsId: "l0uj4jwLoxvELu")
//        let settingsId = getDefaultSettingsId()
        for _ in 0..<50 {
            sdkInit(ucId: "l0uj4jwLoxvELu", isRuleset: false)
            UsercentricsCore.isReady { status in
                // Handle status
                print("SDK is Ready!")
                UsercentricsCore.shared.denyAll(consentType: .implicit)
                
                clearUserSession()
            } onFailure: { error in
                // Handle error
                print("SDK is not ready! Error: \(error.localizedDescription)")
            }
            
        }
    }

}
