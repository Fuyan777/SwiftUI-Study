//
//  SearchRepositoryRequest.swift
//  swiftui-github-client
//
//  Created by 山田楓也 on 2021/01/05.
//

import Foundation

protocol APIRequestType {
    associatedtype Response: Decodable
    
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

struct SearchRepositoryRequest: APIRequestType {
    typealias Response = SearchRepositoryResponse
    
    var path: String { return "/search/repositories" }
    var queryItems: [URLQueryItem]? {
        return [
            .init(name: "q", value: query),
            .init(name: "order", value: "desc")
        ]
    }
    
    private let query: String
    init(query: String) {
        self.query = query
    }
}
