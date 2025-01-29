//
//  ChatBotEndpoint.swift
//  RAI
//
//  Created by Ardi Jorganxhi on 29/01/2025.
//

import Foundation


enum ChatBotEndpoint {
    case askBot(prompt: String)
}

extension ChatBotEndpoint: EndpointProtocol {
    var port: Int {
        switch self {
        case .askBot:
            return 8080
        }
    }
    
    var path: String {
        switch self {
        case .askBot:
            return "api/v1/mediator"
        }
    }
    
    var params: [String : String] {
        switch self {
        case .askBot(let prompt):
            return ["q": prompt]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .askBot:
            return .POST
        }
    }
    
    var body: Data? {
        return nil
    }
    
    
}
