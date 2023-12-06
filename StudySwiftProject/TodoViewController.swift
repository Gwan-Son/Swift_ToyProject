//
//  TodoViewController.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/5/23.
//  Ch 5. 04.

import UIKit

struct TodoItem{
    let title: String
    var isCompleted: Bool
}

class TodoViewController: UIViewController {
    //todoCell
    
    @IBOutlet weak var todoTableView: UITableView!
    var data: [TodoItem] = [
        TodoItem(title: "커밋하기", isCompleted: false),
        TodoItem(title: "운동하기", isCompleted: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        todoTableView.backgroundColor = .brown
        todoTableView.dataSource = self
        todoTableView.delegate = self
    }
}

extension TodoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let myAction = UIContextualAction(style: .normal, title: "완료") { action, view, completionHandler in
            self.data[indexPath.row].isCompleted.toggle()
            self.todoTableView.reloadData()
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [myAction])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        if data[indexPath.row].isCompleted{
            cell.textLabel?.textColor = .green
            cell.imageView?.image = UIImage(systemName: "checkmark.rectangle.portrait")
        }else{
            cell.textLabel?.textColor = .red
            cell.imageView?.image = UIImage(systemName: "rectangle.portrait")
        }
        
        cell.textLabel?.text = data[indexPath.row].title
        
        return cell
    }
    
    
}
