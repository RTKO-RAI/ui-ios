//
//  HTTPRequestProtocol.swift
//  RAI
//
//  Created by Ardi Jorganxhi on 29/01/2025.
//

import Foundation


protocol HTTPRequestProtocol {
    func sendRequest<T: Decodable>(endpoint: EndpointProtocol, response: T.Type) async throws -> T
}

extension HTTPRequestProtocol {
    func sendRequest<T: Decodable>(endpoint: EndpointProtocol, response: T.Type) async throws -> T {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.port = endpoint.port
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.params.map {URLQueryItem(name: $0.key, value: $0.value)}
        
        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        request.httpBody = endpoint.body
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse(data)
            }
            guard (200...299).contains(response.statusCode) else {
                throw NetworkError.statusCode(code: response.statusCode)
            }
            return try JSONDecoder().decode(T.self, from: data)
        }
    }
}
