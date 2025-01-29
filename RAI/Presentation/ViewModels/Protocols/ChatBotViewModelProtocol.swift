//
//  ChatBotViewModelProtocol.swift
//  RAI
//
//  Created by Ardi Jorganxhi on 29/01/2025.
//

import Foundation


protocol ChatBotViewModelProtocol: ObservableObject, Sendable {
    
    var chats: [ChatMessage] { get set }
    var isBotTyping: Bool { get }
    
    func chat(in message: String) async throws   
}
