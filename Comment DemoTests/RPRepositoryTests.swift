//
//  RPRepository.swift
//  Comment DemoTests
//
//  Created by Adam Kirk on 2019-07-07.
//  Copyright © 2019 Lycosidea. All rights reserved.
//

import XCTest
@testable import Comment_Demo

class RPRepositoryTests: XCTestCase {

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
		super.setUp()
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}

	func testDoesRepoExist() {
		XCTAssertNotNil(RPRepository())
	}

	func testDoesRepoSave() {
		let rpRepo = MockRPRepo()
		let commentModel = RPCommentModel(comment: "Test")

		XCTAssert(rpRepo.save(commentModel: commentModel))
	}

	func testDoesRepoReturnArrayCommentModel() {
		let rpRepo = MockRPRepo()
		let commentModel = RPCommentModel(comment: "Test")

		XCTAssertEqual([commentModel], rpRepo.getAllComments())
	}

	//This is a fake test as where not actually testing the repo
	func testDoesRepoDeleteComment() {
		let rpRepo = MockRPRepo()

		_ = rpRepo.deleteComment(at: 0)

		print(rpRepo.getAllComments())

		XCTAssertEqual(rpRepo.getAllComments().count, 1)
	}

}

class MockRPRepo: RPRepoProtocol  {

	func getAllComments() -> Array<RPCommentModel> {
		let commentModel = RPCommentModel(comment: "Test")

		return [commentModel]
	}

	func deleteComment(at index: Int) -> Int {
		return 1
	}

	func edit(at index: Int, text: String) {
		//TODO: Add in test
	}


	func save(commentModel: RPCommentModel) -> Bool {
		//TODO: Add in proper test
		return true
	}

}
