//
//  RPComment.swift
//  Comment Demo
//
//  Created by Adam Kirk on 2019-07-07.
//  Copyright © 2019 Lycosidea. All rights reserved.
//

import Foundation

protocol RPCommentProtocol {
	func save(comment: RPCommentModel) -> Bool
	func getAllComments() -> Array<RPCommentModel>
	func deleteComment(at index: Int)
	func edit(at index: Int, text: String)
}

class RPComment: RPCommentProtocol {

	var comment: RPCommentModel

	init(comment: String) {
		self.comment = RPCommentModel(comment: comment)
	}

	func save(comment: RPCommentModel) -> Bool {
		return RPRepository().save(commentModel: comment)
	}

	func getAllComments() -> Array<RPCommentModel> {
		return RPRepository().getAllComments()
	}

	func deleteComment(at index: Int) {
		_ = RPRepository().deleteComment(at: index)
	}

	func edit(at index: Int, text: String) {
		_ = RPRepository().edit(at: index, text: text)
	}


}
