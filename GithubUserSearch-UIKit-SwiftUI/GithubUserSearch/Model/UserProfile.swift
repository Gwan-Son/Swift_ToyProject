//
//  UserProfile.swift
//  GithubUserSearch
//
//  Created by 심관혁 on 4/20/24.
//

import Foundation

struct UserProfile: Hashable, Identifiable, Decodable {
    
    var id: Int64
    var login: String
    var name: String
    var avatarUrl: URL
    var htmlUrl: String
    var followers: Int
    var following: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case followers
        case following
    }
}

extension UserProfile {
    static let mock = UserProfile(
        id: 38202152,
        login: "Gwan-Son",
        name: "SimGwanHyeok",
        avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/38202152?v=4")!,
        htmlUrl: "https://github.com/Gwan-Son",
        followers: 3,
        following: 3)
}
