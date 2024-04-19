//
//  UserProfileSettings.swift
//  EnvironmentObject
//
//  Created by 심관혁 on 4/19/24.
//

import Foundation

final class UserProfileSettings: ObservableObject {
    
    @Published var age: Int = 0
    @Published var name: String = ""
    
    
    func havingBirthdayParty() {
        age += 1
    }
}
