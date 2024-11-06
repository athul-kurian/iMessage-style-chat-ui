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
        ZStack(alignment: .top) {
            ChatHeader(contactName: "John Doe").zIndex(1)
            VStack {
                ScrollView {
                    ScrollViewReader { proxy in
                        LazyVStack {
                            Spacer(minLength: 65)
                            let messages = chatViewModel.allMessages
                            ForEach(0..<messages.count, id: \.self) { index in
                                let message = messages[index]
                                if index == 0 || message.dateTime.date != messages[index-1].dateTime.date {
                                    Text(message.dateTime.date)
                                        .foregroundStyle(.secondary)
                                        .font(.system(size: 13))
                                        .padding(.vertical)
                                }
                                MessageBubble(
                                    isUserMessage: message.isUserMessage,
                                    content: message.content,
                                    dateTime: message.dateTime
                                ).id(index+1)
                            }.onChange(of: messages.count) { value in
                                withAnimation(.spring) {
                                    proxy.scrollTo(value, anchor: .bottom)
                                }
                            }
                        }
                    }
                }.padding(.horizontal)
                MessageField(chatViewModel: chatViewModel)
                    .padding(.bottom, 8)
                    .padding(.trailing)
                    .padding(.leading, 8)
            }
        }
    }
}

#Preview {
    let chatPreview = ChatViewModel()
    chatPreview.sendMessage(content: .image("1:1"), timestamp: Date())
    chatPreview.sendMessage(content: .text("Hello!"), timestamp: Date())
    chatPreview.sendMessage(content: .text("How are you doing today?"), timestamp: Date())
    chatPreview.sendMessage(content: .text("Are you keeping busy?"), timestamp: Date())
    chatPreview.sendMessage(content: .text("Hello!"), timestamp: Date())
    chatPreview.sendMessage(content: .text("How are you doing today?"), timestamp: Date())
    return ChatView(chatViewModel: chatPreview)
}
