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
        GeometryReader { geometry in
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
                                            .font(.footnote)
                                            .padding(.vertical)
                                    }
                                    MessageBubble(
                                        isUserMessage: message.isUserMessage,
                                        content: message.content,
                                        dateTime: message.dateTime,
                                        geometry: geometry
                                    ).id(index+1)
                                }.onChange(of: messages.count) { value in
                                    withAnimation(.spring) {
                                        proxy.scrollTo(value, anchor: .bottom)
                                    }
                                }
                            }
                        }
                    }.padding(.horizontal)
                    MessageField(chatViewModel: chatViewModel, geometry: geometry)
                }
            }
        }
    }
}




#Preview {
    let chatPreview = ChatViewModel()
    chatPreview.sendMessage(content: .image("16:9"), timestamp: Date())
    chatPreview.sendMessage(content: .text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ), timestamp: Date())
    chatPreview.sendMessage(content: .text("hi"), timestamp: Date())
    return ChatView(chatViewModel: chatPreview)
}
