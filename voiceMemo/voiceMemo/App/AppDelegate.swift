//
//  AppDelegate.swift
//  voiceMemo
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    var notifitionDelegate = NotificationDelegate()
    
    func application(_ application: UIApplication, 
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        UNUserNotificationCenter.current().delegate = notifitionDelegate
        return true
    }
}
