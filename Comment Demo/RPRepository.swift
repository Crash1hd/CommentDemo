//
//  RPRepository.swift
//  Comment Demo
//
//  Created by Adam Kirk on 2019-07-07.
//  Copyright © 2019 Lycosidea. All rights reserved.
//

import Foundation

protocol RPRepoProtocol {
	func save(commentModel: RPCommentModel) -> Bool
	func getAllComments() -> Array<RPCommentModel>
	func deleteComment(at index: Int) -> Int
	func edit(at index: Int, text: String)
}

class RPRepository: RPRepoProtocol {

	func save(commentModel: RPCommentModel) -> Bool {
		if !commentModel.comment.isEmpty {
			_ = RPLocalDB().save(comment: commentModel)
			_ = RPAPI().save(comment: commentModel)

			return true
		}

		print("No comment to save")

		return false
	}

	func getAllComments() -> Array<RPCommentModel> {
		_ = RPAPI().getAllComments()

		return RPLocalDB().getAllComments()
	}

	func deleteComment(at index: Int) -> Int {
		_ = RPLocalDB().delete(at: index)
		_ = RPAPI().delete(at: index)

		return 0
	}

	func edit(at index: Int, text: String) {
		_ = RPLocalDB().edit(at: index, text: text)
	}

	init() {}

}
