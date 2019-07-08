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

	func testDoesCommentExist() {
		XCTAssertNotNil(RPComment(comment: "Test"))
	}

	func testDoesCommentValueEqual() {
		let test = RPCommentModel(comment: "Test")
		XCTAssertEqual(test, RPComment(comment: "Test").comment)
	}

	func testDoesCommentSave() {
		let rpComment = RPComment(comment: "Test")

		XCTAssert(rpComment.save(comment: rpComment.comment))
	}

	func testDoesGetAllCommentsReturnRPCommentArray() {

		let mockRPComment = MockRPComment()
		let commentModel = RPCommentModel(comment: "Test")

		XCTAssertEqual([commentModel], mockRPComment.getAllComments())
	}
}

class MockRPComment: RPCommentProtocol {

	func save(comment: RPCommentModel) -> Bool {
		return true
	}

	func getAllComments() -> Array<RPCommentModel> {
		let commentModel = RPCommentModel(comment: "Test")
		return [commentModel]
	}

}
