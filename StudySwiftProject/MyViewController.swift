//
//  MyViewController.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/5/23.
//  Ch 4. 04.

import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    }
    
    @IBAction func DidTabButton(_ sender: Any) {
        if let name = NameTextField.text{
            helloLabel.text = "Hello \(name)!"
        }
    }
    
}
