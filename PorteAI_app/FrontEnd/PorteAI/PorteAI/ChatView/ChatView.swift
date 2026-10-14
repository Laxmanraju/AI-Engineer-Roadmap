//
//  ChatView.swift
//  PorteAI
//
//  Created by Laxman Penmetsa on 10/8/26.
//

import SwiftUI

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct ChatView: View {
    @State private var messages: [ChatMessage] = []
    @State private var inputText: String = ""
    
    let chatAPI = ChatAPI()
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12){
                        ForEach(messages) { message in
                            MessageBubble(message: message)
                                .id(message.id)
                        }
                    }
                    .padding()
                }
                .onChange(of: messages.count) {
                    if let last = messages.last {
                        proxy.scrollTo(last.id, anchor: .bottom)
                    }
                }
            }
            Divider()
            
            HStack(spacing: 8) {
                TextField("Type a message...", text: $inputText, axis: .vertical)
                    .lineLimit(1...5)
                    .padding(10)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(20)
                
                Button{
                    sendMessage()
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 32))
                        .foregroundStyle(inputText.trimmingCharacters(in: .whitespaces).isEmpty ? .gray : .blue)
                }
                .disabled(inputText.trimmingCharacters(in: .whitespaces).isEmpty)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
        
    }
    private func sendMessage() {
        let trimmed = inputText.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        messages.append(ChatMessage(text: trimmed, isUser: true))
        inputText = ""
        
        Task {
            do {
                let reply = try await chatAPI.sendMessage(trimmed)
                print("BOT: (reply)")
            } catch {
                print("Chat request failed: \(error)")
            }
        }
    }
}

struct MessageBubble: View {
    let message: ChatMessage
    
    var body: some View{
        HStack{
            if message.isUser{
                Spacer()
            }
            Text(message.text)
                .padding(10)
                .background(message.isUser ? Color.blue : Color(.secondarySystemBackground))
                .foregroundStyle(message.isUser ? .white : .primary)
                .cornerRadius(16)
                .frame(minWidth: 280, alignment: message.isUser ? .trailing : .leading)
            if !message.isUser{
                Spacer()
            }
        }
    }

}

#Preview {
    ChatView()
}
