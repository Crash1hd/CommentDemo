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
		let rpRepo = mockRPRepo()
		let commentModel = RPCommentModel(comment: "Test")

		XCTAssert(rpRepo.save(commentModel: commentModel))
	}

}

class mockRPRepo: RPRepoProtocol  {

	func save(commentModel: RPCommentModel) -> Bool {
		return true
	}

	func getAllComments() -> Array<RPCommentModel> {
		return []
	}

}
