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
}

class RPRepository: RPRepoProtocol {

	func save(commentModel: RPCommentModel) -> Bool {
		return false
	}

	func getAllComments() -> Array<RPCommentModel> {
		return []
	}

	init() {}

}
