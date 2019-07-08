//
//  ViewController.swift
//  Comment Demo
//
//  Created by Adam Kirk on 2019-07-07.
//  Copyright © 2019 Lycosidea. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	private var myArray: Array<RPCommentModel> = []
	private var myTableView: UITableView!
	private let myTableViewCellID = "MyTableViewCellID"
	private let rpComment = RPComment(comment: "")

	override func viewDidLoad() {
		super.viewDidLoad()

		myArray = rpComment.getAllComments()

		let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
		let displayWidth: CGFloat = self.view.frame.width
		let displayHeight: CGFloat = self.view.frame.height

		myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
		myTableView.register(UITableViewCell.self, forCellReuseIdentifier: myTableViewCellID)
		myTableView.dataSource = self
		myTableView.delegate = self

		self.view.addSubview(myTableView)
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("Num: \(indexPath.row)")
		print("Value: \(myArray[indexPath.row])")
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return myArray.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: myTableViewCellID, for: indexPath as IndexPath)
		cell.textLabel!.text = "\(myArray[indexPath.row].comment)"

		return cell
	}

	internal func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

		if editingStyle == .delete {
			self.myArray.remove(at: indexPath.row)
			rpComment.deleteComment(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .fade)
		}

	}

}


