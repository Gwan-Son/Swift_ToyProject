//
//  HomeViewModel.swift
//  LMessenger
//
//  Created by 심관혁 on 2/1/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var myUser: User?
    @Published var users: [User] = [.stub1, .stub2]
    
}
