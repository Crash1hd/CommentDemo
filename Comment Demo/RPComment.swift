//
//  RPComment.swift
//  Comment Demo
//
//  Created by Adam Kirk on 2019-07-07.
//  Copyright © 2019 Lycosidea. All rights reserved.
//

import Foundation

class RPComment {
	var comment: RPCommentModel

	init(comment: String) {
		self.comment = RPCommentModel(comment: comment)
	}

}
