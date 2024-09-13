//
//  ViewController.swift
//  DailySpark
//
//  Created by 심관혁 on 4/5/24.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primary_green
        
    }


    @IBAction func notiButtonTapped(_ sender: Any) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound,]) { granted, error in
            if granted {
                print("권한 허용")
                self.scheduleLocalNotification()
            } else {
                print("권한 거부")
            }
        }
    }
    
    func scheduleLocalNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Push 알림"
        content.body = "Push 알림입니다."
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let request = UNNotificationRequest(identifier: "localNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("스케줄링 실패: \(error.localizedDescription)")
            } else {
                print("스케줄링 성공")
            }
        }
    }
}

