//
//  SearchViewModel.swift
//  GithubUserProfile
//
//  Created by 심관혁 on 4/16/24.
//

import Foundation
import Combine

final class SearchViewModel {
    let network: NetworkService
    
    init(network: NetworkService, selectedUser: UserProfile?) {
        self.network = network
        self.selectedUser = CurrentValueSubject(selectedUser)
    }
    
    var subscription = Set<AnyCancellable>()
    
    var name: String {
        return selectedUser.value?.name ?? "n/a"
    }
    
    var login: String {
        return selectedUser.value?.login ?? "n/a"
    }
    
    var followers: String {
        guard let value = selectedUser.value?.followers else {
            return ""
        }
        return "followers: \(value)"
    }
    
    var following: String {
        guard let value = selectedUser.value?.following else {
            return ""
        }
        return "following: \(value)"
    }
    
    var imageURL: URL? {
        return selectedUser.value?.avatarUrl
    }
    
    let selectedUser: CurrentValueSubject<UserProfile?, Never>
    
    
    
    func search(keyword: String) {
        let resource = Resource<UserProfile>(
            base: "https://api.github.com/users/",
            path: "\(keyword)",
            params: [:],
            header: ["Content-Type": "application/json"])
        
        
        // NetworkService
        network.load(resource)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.selectedUser.send(nil)
                case .finished: break
                }
            } receiveValue: { user in
                self.selectedUser.send(user)
            }.store(in: &subscription)
    }
    
    
}
