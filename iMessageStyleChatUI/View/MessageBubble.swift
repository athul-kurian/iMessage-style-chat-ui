//
//  MessageBubble.swift
//  iMessageStyleMessagingUI
//
//  Created by Athul Kurian on 25/10/24.
//

import SwiftUI

struct MessageBubble: View {
    @Environment(\.colorScheme) var colorScheme
    let isUserMessage: Bool
    let content: contentType
    let dateTime: (date: String, time: String)
    
    var body: some View {
        VStack{
            createMessageDisplay(from: content)
            timeDisplay
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
    
    var pickBubbleColor: Color {
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
    
    @ViewBuilder
    func createMessageDisplay(from content: contentType) -> some View {
        switch(content) {
        case .text(let text):
            createTextMessageDisplay(from: text)
        }
    }
    
    func createTextMessageDisplay(from text: String) -> some View {
        HStack {
            if isUserMessage {Spacer()}
            Text(text)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .font(.system(size: 17))
                .foregroundColor(isUserMessage ? .white : .primary)
                .background(pickBubbleColor)
                .cornerRadius(20)
                .frame(maxWidth: 285, alignment: isUserMessage ? .trailing : .leading)
                .padding(isUserMessage ? .trailing : .leading, 5)
                .background(alignment: isUserMessage ? .bottomTrailing :.bottomLeading) {
                    Image(isUserMessage ? "outgoingTail" : "incomingTail")
                        .renderingMode(.template)
                        .foregroundStyle(pickBubbleColor)
                }
            if !isUserMessage {Spacer()}
        }
    }
    
//    func createImageDisplay(from text: String) -> some View {
//
//    }
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
