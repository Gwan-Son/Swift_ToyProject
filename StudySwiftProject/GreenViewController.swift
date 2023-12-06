//
//  GreenViewController.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/5/23.
//

import UIKit

class GreenViewController: UIViewController {
    //goNext
    
    @IBOutlet weak var insertNameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goNext" {
            let viewController = segue.destination as! IndigoViewController
            viewController.inputName = insertNameField.text!
        }
    }
}
