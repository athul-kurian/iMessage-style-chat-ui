//
//  TextMessageDisplay.swift
//  iMessageStyleChatUI
//
//  Created by Athul Kurian on 28/10/24.
//

import SwiftUI

extension MessageBubble {
    struct TextMessageDisplay: View {
        let isUserMessage: Bool
        let text: String
        var colorScheme: ColorScheme
        
        init(_ isUserMessage: Bool, _ text: String, _ colorScheme: ColorScheme) {
            self.isUserMessage = isUserMessage
            self.text = text
            self.colorScheme = colorScheme
        }

        var body: some View {
            HStack {
                if isUserMessage {Spacer()}
                Text(text)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .font(.system(size: 17))
                    .foregroundColor(isUserMessage ? .white : .primary)
                    .background(pickBubbleColor(isUserMessage, colorScheme))
                    .cornerRadius(20)
                    .frame(maxWidth: 285, alignment: isUserMessage ? .trailing : .leading)
                    .padding(isUserMessage ? .trailing : .leading, 5)
                    .background(alignment: isUserMessage ? .bottomTrailing :.bottomLeading) {
                        Image(isUserMessage ? "outgoingTail" : "incomingTail")
                            .renderingMode(.template)
                            .foregroundStyle(pickBubbleColor(isUserMessage, colorScheme))
                    }
                if !isUserMessage {Spacer()}
            }
        }
    }
}
