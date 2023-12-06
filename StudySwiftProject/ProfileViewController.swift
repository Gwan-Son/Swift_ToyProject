//
//  ProfileViewController.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/5/23.
//  Ch 6. 04.

import UIKit

class ProfileViewController: UIViewController {

    var profileData = ["아이디","이메일","전화번호"]
    
    @IBOutlet weak var profileTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTableView.dataSource = self
        profileTableView.delegate = self
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileSegue"{
            let vc = segue.destination as! ProfileDetailViewController
            vc.inputText = profileData[0]
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
        
        cell.textLabel?.text = profileData[indexPath.row]
        
        return cell
    }
    
    
}
