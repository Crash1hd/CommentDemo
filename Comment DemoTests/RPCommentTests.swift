	//
	//  Comment_DemoTests.swift
	//  Comment DemoTests
	//
	//  Created by Adam Kirk on 2019-07-07.
	//  Copyright © 2019 Lycosidea. All rights reserved.
	//

	import XCTest
	@testable import Comment_Demo

	class RPCommentTests: XCTestCase {

		override func setUp() {
			// Put setup code here. This method is called before the invocation of each test method in the class.
			super.setUp()
		}

		override func tearDown() {
			// Put teardown code here. This method is called after the invocation of each test method in the class.
			super.tearDown()
		}

		func testDoesCommentModelExist() {
			XCTAssertNotNil(RPCommentModel(comment: "Test"))
		}

		func testDoesCommentModelValueEqual() {
			let test = RPCommentModel(comment: "Test").comment

			XCTAssertEqual(test, "Test")
		}

	}
