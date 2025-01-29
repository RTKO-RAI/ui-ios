//
//  ChatBotViewModel.swift
//  RAI
//
//  Created by Ardi Jorganxhi on 29/01/2025.
//

import Foundation


final class ChatBotViewModel: ChatBotViewModelProtocol {
    
    
    @Published var chats: [ChatMessage]
    @Published var isBotTyping: Bool = false

    private var repositoryUseCase: any ChatBotRepositoryUseCaseProtocol
    
    init(chatBotRepositoryUseCase: any ChatBotRepositoryUseCaseProtocol = ChatBotRepositoryUseCase()) {
        self.chats = [ChatMessage(message: "Welcome to RAI", sender: .bot)]
        self.repositoryUseCase = chatBotRepositoryUseCase
    }
    
    func chat(in message: String) async throws {
        self.isBotTyping.toggle()
        self.chats.append(ChatMessage(message: message, sender: .user))
        let response = try await askBot(prompt: message)
        self.chats.append(ChatMessage(message: response, sender: .bot))
        self.isBotTyping.toggle()
    }
    
    private func askBot(prompt: String) async throws -> String {
        return try await repositoryUseCase.askBot(prompt: prompt)
    }
}
