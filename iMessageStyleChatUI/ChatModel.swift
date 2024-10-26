//
//  MessagingModel.swift
//  iMessageStyleChatUI
//
//  Created by Athul Kurian on 23/10/24.
//

import Foundation
import CoreData

struct ChatModel {
    private(set) var allMessages: Array<Message>
    
    mutating func appendMessage(newMessageContent: String, timestamp: Date) {
        allMessages.append(Message(isUserMessage: true, content: newMessageContent, timestamp: timestamp))
        allMessages.append(fetchReply(to: newMessageContent))
    }
    
    private func fetchReply(to message: String) -> Message {
        let replyContent = "replying to \"\(message)\""
        let replyTimestamp = Date()
        return Message(isUserMessage: false, content: replyContent, timestamp: replyTimestamp)
    }
    
    mutating func removeMessage(id: Double) {
        allMessages.removeAll(where: {$0.id == id})
    }
}

struct Message: Identifiable {
    let isUserMessage: Bool
    let content: String
    let timestamp: Date
    let id: Double
    
    init(isUserMessage: Bool, content: String, timestamp: Date) {
        self.isUserMessage = isUserMessage
        self.content = content
        self.timestamp = timestamp
        self.id = timestamp.timeIntervalSince1970
    }
    
    func getDateTime() -> (date: String, time: String) {
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
