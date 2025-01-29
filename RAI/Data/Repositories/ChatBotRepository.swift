//
//  ChatBotRepository.swift
//  RAI
//
//  Created by Ardi Jorganxhi on 29/01/2025.
//

import Foundation


final class ChatBotRepository: ChatBotRepositoryProtocol {
    
    private let service: any ChatBotServiceable
    
    init(service: any ChatBotServiceable = ChatBotService()) {
        self.service = service
    }
    
    func askBot(prompt: String) async throws -> BotResponse {
        let response = try await service.askBot(prompt: prompt)
        return response
    }
    
    
}
