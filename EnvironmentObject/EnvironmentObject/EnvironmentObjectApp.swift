//
//  EnvironmentObjectApp.swift
//  EnvironmentObject
//
//  Created by 심관혁 on 4/19/24.
//

import SwiftUI

@main
struct EnvironmentObjectApp: App {
    
    @StateObject var userProfile = UserProfileSettings()
    
    var body: some Scene {
        WindowGroup {
            FirstView().environmentObject(userProfile)
        }
    }
}
