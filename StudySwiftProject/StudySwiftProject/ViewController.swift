//
//  ViewController.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/04/23.
//  Ch 4. 01. 02. 03.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green // 타입은 UIColor SwiftUI의 Color와 다름
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didMyButtonTapped(_ sender: Any) {
        myLabel.text = "Hello, UIKit"
    }
    

}

