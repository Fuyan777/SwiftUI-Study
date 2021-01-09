//
//  Repository.swift
//  swiftui-github-client
//
//  Created by 山田楓也 on 2021/01/05.
//

import Foundation

struct Repository: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let stargazersCount: Int = 0
    let language: String?
    let htmlUrl: String
    let owner: Owner
}

struct Owner: Decodable, Hashable, Identifiable {
    let id: Int
    let avatarUrl: String
}

struct SearchRepositoryResponse: Decodable {
    let items: [Repository]
}
