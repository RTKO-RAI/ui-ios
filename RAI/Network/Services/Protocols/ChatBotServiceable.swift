//
//  ChatBotServiceable.swift
//  RAI
//
//  Created by Ardi Jorganxhi on 29/01/2025.
//

import Foundation


protocol ChatBotServiceable: Sendable {
    func askBot(prompt: String) async throws -> BotResponse
}
