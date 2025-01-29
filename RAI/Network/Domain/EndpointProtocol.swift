//
//  EndpointProtocol.swift
//  RAI
//
//  Created by Ardi Jorganxhi on 29/01/2025.
//

import Foundation


protocol EndpointProtocol {
    var scheme: String { get }
    var host: String { get }
    var port: Int { get }
    var path: String { get }
    var params: [String: String] { get }
    var method: HTTPMethod { get }
    var header: [String: String] { get }
    var body: Data? { get }
}


extension EndpointProtocol {
    var scheme: String {
        return "http"
    }
    var host: String {
        return "localhost"
    }
    
    var header: [String: String] {
        return ["Content-Type": "application/json"]
    }
}
