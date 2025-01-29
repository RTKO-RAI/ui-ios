//
//  ChatBotService.swift
//  RAI
//
//  Created by Ardi Jorganxhi on 29/01/2025.
//

import Foundation


struct ChatBotService: HTTPRequestProtocol, ChatBotServiceable {
    
    private typealias endpoint = ChatBotEndpoint
    
    func askBot(prompt: String) async throws -> BotResponse {
        return try await sendRequest(endpoint: endpoint.askBot(prompt: prompt), response: BotResponse.self)
    }
}
