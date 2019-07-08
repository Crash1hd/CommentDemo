//
//  ViewController.swift
//  Comment Demo
//
//  Created by Adam Kirk on 2019-07-07.
//  Copyright © 2019 Lycosidea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	private var myArray: Array<RPCommentModel> = []

	@IBOutlet weak var myTextView: UITextField!
	@IBOutlet weak var myButton: UIButton!
	@IBOutlet weak var myTableView: UITableView!

	private var index: IndexPath = []

	private let myTableViewCellID = "MyTableViewCellID"
	private let rpComment = RPComment(comment: "")

	override func viewDidLoad() {
		super.viewDidLoad()

		myArray = rpComment.getAllComments()

		myTableView.register(UITableViewCell.self, forCellReuseIdentifier: myTableViewCellID)
		myTableView.dataSource = self
		myTableView.delegate = self
	}
}

//Table View Related
extension ViewController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		index = indexPath
		print("Num: \(indexPath.row)")
		print("Value: \(myArray[indexPath.row])")
		myTextView.text = myArray[indexPath.row].comment
		tableView.deselectRow(at: indexPath, animated: true)
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

//Button Related
extension ViewController {

	@IBAction func myButtonClicked(_ sender: Any) {
		guard let text = myTextView.text else {
			print("Failure")
			return
		}

		if index.count > 0 {
			if let cell = myTableView.cellForRow(at: index) {
				cell.textLabel?.text = text
				_ = rpComment.edit(at: index.row, text: text)

				myArray = rpComment.getAllComments()

				index = []

				return
			}
		}

		_ = rpComment.save(comment: RPCommentModel(comment: text))

		myArray = rpComment.getAllComments()

		self.myTableView.reloadData()

	}
}
