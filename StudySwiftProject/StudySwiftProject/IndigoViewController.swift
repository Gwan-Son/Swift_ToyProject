//
//  IndigoViewController.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/5/23.
//

import UIKit

class IndigoViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    var inputName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = inputName
    }
}
