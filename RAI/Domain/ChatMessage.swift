//
//  ChatMessage.swift
//  RAI
//
//  Created by Ardi Jorganxhi on 29/01/2025.
//

import Foundation


struct ChatMessage: Identifiable {
    let id = UUID()
    let message: String
    let sender: Sender
}
