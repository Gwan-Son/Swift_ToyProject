//
//  DIContainer.swift
//  LMessenger
//
//  Created by 심관혁 on 1/25/24.
//

import Foundation

class DIContainer: ObservableObject {
    var services: ServiceType
    
    init(services: ServiceType) {
        self.services = services
    }
}
