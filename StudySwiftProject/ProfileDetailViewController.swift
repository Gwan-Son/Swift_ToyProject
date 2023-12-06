//
//  ProfileDetailViewController.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/5/23.
//

import UIKit

class ProfileDetailViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    var inputText: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = inputText
    }
}
