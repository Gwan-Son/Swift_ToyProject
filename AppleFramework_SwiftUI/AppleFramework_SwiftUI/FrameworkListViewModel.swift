//
//  FrameworkListViewModel.swift
//  AppleFramework_SwiftUI
//
//  Created by 심관혁 on 4/19/24.
//

import Foundation

final class FrameworkListViewModel: ObservableObject {
    @Published var framework: [AppleFramework] = AppleFramework.list
    @Published var isShowingDetail: Bool = false
    @Published var selectedItem: AppleFramework?
}
