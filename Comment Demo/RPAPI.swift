//
//  RPAPI.swift
//  Comment Demo
//
//  Created by Adam Kirk on 2019-07-07.
//  Copyright © 2019 Lycosidea. All rights reserved.
//

import Foundation

protocol RPAPIProtocol {
	func getAllComments() -> Array<RPCommentModel>
	func save(comment: RPCommentModel)
	func delete(at index: Int)
}

class RPAPI: RPAPIProtocol {

	func getAllComments() -> Array<RPCommentModel> {
		//TODO: Networking call to some remote service

		//TODO: Update LocalDB with response from remote service

		return []
	}


	func save(comment: RPCommentModel) {
		//TODO: Networking call to some remote service
		
	}

	func delete(at index: Int) {
		//TODO: Networking call to delete comment from remote service
	}

}
