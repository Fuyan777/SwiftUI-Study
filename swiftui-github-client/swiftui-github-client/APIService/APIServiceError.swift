//
//  APIServiceError.swift
//  swiftui-github-client
//
//  Created by 山田楓也 on 2021/01/05.
//

import Foundation

enum APIServiceError: Error {
    case invalidURL
    case responseError
    case parseError(Error)
}
