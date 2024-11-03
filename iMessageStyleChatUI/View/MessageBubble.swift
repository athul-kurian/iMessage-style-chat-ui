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
            HStack {
                if isUserMessage {Spacer()}
                createMessageDisplay(from: content)
                if !isUserMessage {Spacer()}
            }
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
    
    var bubbleColor: Color {
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
        case .image(let imageFileName):
            createImageMessageDisplay(from : imageFileName)
        }
    }
    
    func createTextMessageDisplay(from text: String) -> some View {
        Text(text)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .font(.system(size: 17))
            .foregroundColor(isUserMessage ? .white : .primary)
            .background(bubbleColor)
            .cornerRadius(20)
            .frame(maxWidth: 285, alignment: isUserMessage ? .trailing : .leading)
            .padding(isUserMessage ? .trailing : .leading, 5)
            .background(alignment: isUserMessage ? .bottomTrailing :.bottomLeading) {
                Image(isUserMessage ? "outgoingTail" : "incomingTail")
                    .renderingMode(.template)
                    .foregroundStyle(bubbleColor)
            }
    }
    
    func createImageMessageDisplay(from imageFileName: String) -> some View {
        Image(imageFileName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .frame(maxWidth: 260, alignment: isUserMessage ? .trailing : .leading)

    }
}

#Preview {
    ScrollView {
        VStack(alignment: .trailing) {
                MessageBubble(
                    isUserMessage: true,
                    content: .text("Hello, how are you today?"),
                    dateTime: ("", "10:10 AM")
                ).border(.red)
                
                MessageBubble(
                    isUserMessage: false,
                    content: .text("I'm fine, thanks for asking."),
                    dateTime: ("", "10:10 AM")
                ).border(.red)
                
                MessageBubble(
                    isUserMessage: true,
                    content: .image("1:1"),
                    dateTime: ("","10:10 AM")
                ).border(.red)
            }
    }//.border(.red)
    .padding()
}
    
