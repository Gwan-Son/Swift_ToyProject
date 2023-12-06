//
//  MyTableViewController.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/5/23.
//  Ch 5. 01. 테이블뷰로 화면 그리기

import UIKit

class MyTableViewController: UIViewController {

    
    @IBOutlet weak var myTableView: UITableView!
    let cellData = ["Hello TableView", "This is UIKit", "Welcome!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        
        myTableView.backgroundColor = .green
        myTableView.delegate = self
        myTableView.dataSource = self
    }
}

extension MyTableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = cellData[indexPath.row]
        return cell
    }
    
    
}
