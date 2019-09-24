//
//  AkChatUnitsTests.swift
//  AkChatUnitsTests
//
//  Created by Amg on 24/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import XCTest
@testable import AkChat

class AkChatUnitsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGivenCreateClassWhenIsCreatedThenIsSuccess() {
        let authService = AuthService()
        XCTAssertNotNil(authService)
    }
}
