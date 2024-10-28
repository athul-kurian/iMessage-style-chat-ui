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
        HStack {
            if isUserMessage {Spacer()}
            VStack{
                switch(content) {
                case .text(let text):
                    TextMessageDisplay(isUserMessage, text, colorScheme)
                }
                timeDisplay
            }
            if !isUserMessage {Spacer()}
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
    
    static func pickBubbleColor(_ isUserMessage: Bool, _ colorScheme: ColorScheme) -> Color {
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
