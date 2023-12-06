//
//  MyDelegateViewController.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/5/23.
//  Ch 5. 02.

import UIKit

protocol AdminDelegate{
    func doTask()
}

class MyDelegateViewController: UIViewController {

    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var NameLabel: UILabel!
    var admin: Admin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Admin(delegate: self)
        admin?.delegate = self
        
    }
    @IBAction func DidTabButton(_ sender: Any) {
        if let name = NameTextField.text{
            NameLabel.text = "Hello \(name)!"
        }
        admin?.delegate.doTask()
    }
}


extension MyDelegateViewController: AdminDelegate{
    func doTask() {
        print("저 지금 일 잘하고 있습니다.")
    }
    
    
}

struct Admin{
    var delegate: AdminDelegate
}
