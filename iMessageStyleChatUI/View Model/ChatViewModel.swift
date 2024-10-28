//
//  MessagingViewModel.swift
//  iMessageStyleChatUI
//
//  Created by Athul Kurian on 23/10/24.
//

import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var messagingModel = ChatModel(allMessages: [])
    
    var allMessages: Array<Message> {
        messagingModel.allMessages
    }
    
    func addMessage(content: String, timestamp: Date) {
        messagingModel.appendMessage(newMessageContent: content, timestamp: timestamp)
    }
}
