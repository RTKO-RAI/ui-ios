//
//  ChatView.swift
//  RAI
//
//  Created by Ardi Jorganxhi on 29/01/2025.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject private var viewModel = ChatBotViewModel()
    @State private var currentMessage: String = ""
    private typealias sender = Sender
    private typealias color = Color
    
    private func chat() {
        Task {
            try await viewModel.chat(in: self.currentMessage)
            self.currentMessage = ""
        }
    }
    
    var body: some View {
        VStack(spacing: 25) {
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(viewModel.chats) { message in
                        HStack {
                            if(message.sender == sender.user) {
                                Spacer()
                                Text(message.message)
                                    .padding()
                                    .background(color.yellow)
                                    .foregroundColor(color.white)
                                    .cornerRadius(12)
                                    .frame(maxWidth: 250, alignment: .trailing)
                            } else {
                                Text(message.message)
                                    .padding()
                                    .background(color.white)
                                    .foregroundStyle(color.black)
                                    .cornerRadius(12)
                                    .frame(maxWidth: 250, alignment: .leading)
                                Spacer()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.vertical)
            HStack {
                TextField("Type a message", text: $currentMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(5)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .background(Color.white)
                    .cornerRadius(8)
                Button(action: {chat()}) {
                    Text("Send")
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                        .background(Color.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
        }
        .background(color.black.opacity(0.85))
    }
}

#Preview {
    ChatView()
}
