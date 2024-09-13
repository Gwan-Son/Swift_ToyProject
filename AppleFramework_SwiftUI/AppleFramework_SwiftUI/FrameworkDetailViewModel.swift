//
//  FrameworkDetailViewModel.swift
//  AppleFramework_SwiftUI
//
//  Created by 심관혁 on 4/19/24.
//

import Foundation

final class FrameworkDetailViewModel: ObservableObject {
    @Published var framework: AppleFramework
    @Published var isPresented: Bool = false
    
    init(framework: AppleFramework) {
        self.framework = framework
    }
}
