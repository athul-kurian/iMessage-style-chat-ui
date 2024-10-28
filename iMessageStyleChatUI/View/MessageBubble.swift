//
//  MessageBubble.swift
//  iMessageStyleMessagingUI
//
//  Created by Athul Kurian on 25/10/24.
//

import SwiftUI

struct MessageBubble: View {
    @Environment(\.colorScheme) var colorScheme
    
    var isUserMessage: Bool
    let content: contentType
    let dateTime: (date: String, time: String)
    
    var body: some View {
        VStack{
            messageDisplay
            timeDisplay
        }
    }
    
    var messageDisplay: some View {
        HStack {
            if isUserMessage {Spacer()}
            switch(content) {
            case .text(let text) :
                Text(text)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .font(.system(size: 17))
                    .foregroundColor(isUserMessage ? .white : .primary)
                    .background(pickBubbleColor(isUserMessage))
                    .cornerRadius(20)
                    .frame(maxWidth: 285, alignment: isUserMessage ? .trailing : .leading)
                    .padding(isUserMessage ? .trailing : .leading, 5)
                    .background(alignment: isUserMessage ? .bottomTrailing :.bottomLeading) {
                        Image(isUserMessage ? "outgoingTail" : "incomingTail")
                            .renderingMode(.template)
                            .foregroundStyle(pickBubbleColor(isUserMessage))
                    }
            }
            if !isUserMessage {Spacer()}
        }
    }
    
    func pickBubbleColor(_ isUserMessage: Bool) -> Color {
        if isUserMessage {
            return Color(.systemBlue)
        } else {
            if colorScheme == .light {
                return .incomingMessageLight
            } else {
                return .incomingMessageDark
            }
        }
    }
    
    var timeDisplay: some View {
        HStack{
            if isUserMessage {
                Spacer()
            }
            Text(dateTime.time)
                .font(.system(size: 10))
                .bold()
                .foregroundStyle(.secondary)
            if !isUserMessage {
                Spacer()
            }
        }
    }
}

extension Color {
    static let incomingMessageDark = Color(red: 38/255, green: 38/255, blue: 41/255)
    static let incomingMessageLight = Color(red: 233/255, green: 233/255, blue: 234/255)
    static let outgoingMessageColor = Color(.systemBlue)
}

#Preview {
    MessageBubble(
        isUserMessage: true,
        content: .text("Hello, how are you today?"),
        dateTime: ("", "10:10 AM")
    ).border(.red)
    .padding()
    
    MessageBubble(
        isUserMessage: false,
        content: .text("I'm fine, thanks for asking."),
        dateTime: ("", "10:10 AM")
    ).border(.red)
    .padding()
}
