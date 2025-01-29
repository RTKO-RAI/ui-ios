//
//  ChatBotRepositoryUseCase.swift
//  RAI
//
//  Created by Ardi Jorganxhi on 29/01/2025.
//

import Foundation


final class ChatBotRepositoryUseCase: ChatBotRepositoryUseCaseProtocol {
    
    private let repository: any ChatBotRepositoryProtocol
    
    init(repository: any ChatBotRepositoryProtocol = ChatBotRepository()) {
        self.repository = repository
    }
    
    func askBot(prompt: String) async throws -> String {
        let response = try await repository.askBot(prompt: prompt)
        return response.message
    }
}
