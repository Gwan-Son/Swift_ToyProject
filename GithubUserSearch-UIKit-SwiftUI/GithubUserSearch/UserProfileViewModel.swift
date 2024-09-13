//
//  UserProfileViewModel.swift
//  GithubUserSearch
//
//  Created by 심관혁 on 4/20/24.
//

import Foundation
import Combine

final class UserProfileViewModel: ObservableObject {
    
    let loginID: String
    
    let network: NetworkService
    
    var subscriptions = Set<AnyCancellable>()
    
    @Published var selectedUser: UserProfile?
    
    
    init(loginID: String, network: NetworkService) {
        self.loginID = loginID
        self.network = network
    }
    
    var name: String {
        return selectedUser?.name ?? "n/a"
    }
    
    var login: String {
        return selectedUser?.login ?? "n/a"
    }
    
    var followers: String {
        guard let followers = selectedUser?.followers else {
            return ""
        }
        return "followers: \(followers)"
    }
    
    var following: String {
        guard let following = selectedUser?.following else {
            return ""
        }
        return "following: \(following)"
    }
    
    func search(keyword: String) {
        let resource: Resource<UserProfile> = Resource(
            base: "https://api.github.com/",
            path: "users/\(keyword)",
            params: [:],
            header: ["Content-Type": "application/json"]
        )
        
        network.load(resource)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.selectedUser = nil
                    print("error: \(error)")
                case .finished: break
                }
            }, receiveValue: { result in
                self.selectedUser = result
            })
            .store(in: &subscriptions)
    }
}
