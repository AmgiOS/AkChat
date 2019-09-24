//
//  AkChatTests.swift
//  AkChatTests
//
//  Created by Amg on 29/08/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import XCTest
@testable import AkChat

class AkChatTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenCreateClassGivenCreateInstanceThenIsCreate() {
        let authentificationService = AuthService()
        
        XCTAssertNotNil(authentificationService)
    }

}
