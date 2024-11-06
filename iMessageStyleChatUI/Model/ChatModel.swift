//
//  MessagingModel.swift
//  iMessageStyleChatUI
//
//  Created by Athul Kurian on 23/10/24.
//

import Foundation

struct ChatModel {
    private(set) var allMessages: [Message]
    
    mutating func appendMessage(content: contentType, timestamp: Date) {
        let userMessage = Message(isUserMessage: true, content: content, timestamp: timestamp)
        allMessages.append(userMessage)
        fetchReply()
    }
    
    private mutating func fetchReply() {
        let replyContent = contentType.text("This is an automated reply.")
        allMessages.append(Message(isUserMessage: false, content: replyContent, timestamp: Date()))
        allMessages.append(Message(isUserMessage: false, content: .image("16:9"), timestamp: Date()))
    }
    
    mutating func removeMessage(id: Double) {
        allMessages.removeAll(where: {$0.id == id})
    }
}

struct Message: Identifiable {
    let isUserMessage: Bool
    let content: contentType
    let timestamp: Date
    let id: Double
    
    init(isUserMessage: Bool, content: contentType, timestamp: Date) {
        self.isUserMessage = isUserMessage
        self.content = content
        self.timestamp = timestamp
        self.id = timestamp.timeIntervalSince1970
    }
    
    var dateTime: (date: String, time: String) {
        let formatter = DateFormatter()
        
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        let currentTime = formatter.string(from: timestamp)

        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        let currentDate = formatter.string(from: timestamp)
        
        return (date: currentDate, time: currentTime)
    }
}

enum contentType {
    case text(String)
    case image(String)
}
