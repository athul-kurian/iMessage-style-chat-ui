//
//  ContentView.swift
//  iMessageStyleChatUI
//
//  Created by Athul Kurian on 22/10/24.
//


import SwiftUI

struct ChatView: View {
    @ObservedObject var chatViewModel: ChatViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                ScrollViewReader { proxy in
                    VStack {
                        let messages = chatViewModel.allMessages
                        ForEach(0..<messages.count, id: \.self) { index in
                            let message = messages[index]
                            if index == 0 || message.getDateTime().date != messages[index-1].getDateTime().date {
                                Text(message.getDateTime().date)
                                    .foregroundStyle(.secondary)
                                    .font(.system(size: 13))
                                    .padding(.vertical)
                            }
                            MessageBubble(
                                isUserMessage: message.isUserMessage,
                                content: message.content,
                                dateTime: message.getDateTime()
                            ).id(index+1)
                        }.onChange(of: messages.count) { value in
                            withAnimation(.spring) {
                                proxy.scrollTo(value, anchor: .bottom)
                            }
                        }
                    }
                }
            }
            MessageField(chatViewModel: chatViewModel)
            .padding(.bottom, 8)
        }.padding(.horizontal)
    }
}

#Preview {
    let chatPreview = ChatViewModel()
    chatPreview.addMessage(content: "Hello!", timestamp: Date())
    chatPreview.addMessage(content: "How are you doing today?", timestamp: Date())
    chatPreview.addMessage(content: "Are you keeping busy?", timestamp: Date())
    chatPreview.addMessage(content: "Hello!", timestamp: Date())
    chatPreview.addMessage(content: "How are you doing today?", timestamp: Date())
    return ChatView(chatViewModel: chatPreview)
}
