//
//  NetworkError.swift
//  RAI
//
//  Created by Ardi Jorganxhi on 29/01/2025.
//

import Foundation


enum NetworkError: Error {
    case invalidURL
    case invalidResponse(_ data: Data)
    case decodingError(_error: any Error)
    case requestError(_ error: any Error)
    case notExpectedHttpStatusCode(code: Int)
    case statusCode(code: Int)
    case networkError(_ error: any Error)
}
