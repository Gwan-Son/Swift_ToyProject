//
//  AuthenticationViewModel.swift
//  LMessenger
//
//  Created by 심관혁 on 1/25/24.
//

import Foundation

enum AuthenticationState {
    case unauthenticated
    case authenticated
}

class AuthenticationViewModel: ObservableObject {
    
    @Published var authenticationState: AuthenticationState = .unauthenticated
    
    private var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
}
