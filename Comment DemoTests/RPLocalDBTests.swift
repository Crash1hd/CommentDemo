//
//  RPLocalDBTests.swift
//  Comment DemoTests
//
//  Created by Adam Kirk on 2019-07-07.
//  Copyright © 2019 Lycosidea. All rights reserved.
//

import XCTest
@testable import Comment_Demo

class RPLocalDBTests: XCTestCase {

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
		super.setUp()
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}

	func testDoesLocalDBExsist() {
		XCTAssertNotNil(RPLocalDB())
	}

}

class MockUserDefaults : UserDefaults {

	convenience init() {
		self.init(suiteName: "Mock User Defaults")!
	}

	override init?(suiteName suitename: String?) {
		UserDefaults().removePersistentDomain(forName: suitename!)
		super.init(suiteName: suitename)
	}

}
