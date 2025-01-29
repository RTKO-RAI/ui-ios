//
//  ChatBotRepositoryProtocol.swift
//  RAI
//
//  Created by Ardi Jorganxhi on 29/01/2025.
//

import Foundation


protocol ChatBotRepositoryProtocol: Sendable {
    func askBot(prompt: String) async throws -> BotResponse
}
