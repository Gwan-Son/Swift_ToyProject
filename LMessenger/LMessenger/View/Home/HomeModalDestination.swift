//
//  HomeModalDestination.swift
//  LMessenger
//
//  Created by 심관혁 on 2/5/24.
//

import Foundation

enum HomeModalDestination: Hashable, Identifiable {
    case myProfile
    case otherProfile(String)
    
    var id: Int {
        hashValue
    }
}
