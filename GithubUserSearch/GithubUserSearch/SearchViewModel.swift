//
//  SearchViewModel.swift
//  GithubUserSearch
//
//  Created by 심관혁 on 4/16/24.
//

import Foundation
import Combine

final class SearchViewModel {
    
    let network: NetworkService
    
    var subscription = Set<AnyCancellable>()
    
    @Published private(set) var users: [SearchResult] = []
    
    init(network: NetworkService) {
        self.network = network
    }
    
    func search(keyword: String) {
        let resource: Resource<SearchUserResponse> = Resource(
            base: "https://api.github.com/",
            path: "search/users",
            params: ["q":keyword],
            header: ["Content-Type":"application/json"])
        
        network.load(resource)
            .map { $0.items }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.users, on: self)
            .store(in: &subscription)
    }
    
}
