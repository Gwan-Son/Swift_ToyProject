//
//  MyProfileViewModel.swift
//  LMessenger
//
//  Created by 심관혁 on 2/7/24.
//

import Foundation

@MainActor
class MyProfileViewModel: ObservableObject {
    
    @Published var userInfo: User?
    
    private var container: DIContainer
    private let userId: String
    
    init(container: DIContainer, userId: String) {
        self.container = container
        self.userId = userId
    }
    
    func getUser() async {
        if let user = try? await container.services.userService.getUser(userId: userId){
            userInfo = user
        }
    }
}
