//
//  RPLocalDB.swift
//  Comment Demo
//
//  Created by Adam Kirk on 2019-07-07.
//  Copyright © 2019 Lycosidea. All rights reserved.
//

import Foundation

protocol RPLocalDBProtocol {
	func getAllComments(defaults: UserDefaults) -> Array<RPCommentModel>
	func save(comment: RPCommentModel, defaults: UserDefaults)
	func delete(at index: Int, defaults: UserDefaults)
}

class RPLocalDB: RPLocalDBProtocol {

	func save(comment: RPCommentModel, defaults: UserDefaults = UserDefaults.standard) {
		var currentComments = getAllComments(defaults: defaults)
		currentComments.append(comment)

		do {
			let data = try JSONEncoder().encode(currentComments)
			defaults.set(data, forKey: "currentComments")
		} catch {
			print("Error while encoding user data")
		}
	}

	func getAllComments(defaults: UserDefaults = UserDefaults.standard) -> Array<RPCommentModel> {
		if let data = defaults.object(forKey: "currentComments") as? Data {
			do {
				let u = try JSONDecoder().decode([RPCommentModel].self, from: data) as [RPCommentModel]
				return u
			} catch {
				print("Error while decoding user data")
			}
		}
		return []
	}

	func delete(at index: Int, defaults: UserDefaults = UserDefaults.standard) {
		var currentComments = getAllComments(defaults: defaults)
			currentComments.remove(at: index)

		do {
			let data = try JSONEncoder().encode(currentComments)
			defaults.set(data, forKey: "currentComments")
		} catch {
			print("Error while encoding user data")
		}
	}
}
