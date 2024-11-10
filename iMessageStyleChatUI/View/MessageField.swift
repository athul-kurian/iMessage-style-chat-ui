//
//  messageField.swift
//  iMessageStyleChatUI
//
//  Created by Athul Kurian on 25/10/24.
//

import SwiftUI

struct MessageField: View {
    @State var typedMessage: String = ""
    var chatViewModel: ChatViewModel
    
    var geometry: GeometryProxy
    
    var body: some View {
        HStack(alignment: .bottom) {
            Image(systemName: "plus")
                .foregroundStyle(.secondary)
                .padding(geometry.size.width * .plusButtonPaddingScalingFactor)
                .background(Circle().foregroundStyle(.gray.opacity(.messageFieldPlusButtonOpacity)))
            
            HStack(alignment: .bottom) {
                TextField("iMessage", text: $typedMessage, axis: .vertical)
                    .padding(.horizontal)
                    .padding(.bottom, geometry.size.height * .textFieldBottomPaddingScalingFactor)
                
                Button {
                    let timestamp = Date()
                    let messageText = typedMessage.trimmingCharacters(in: .whitespacesAndNewlines)
                    if !messageText.isEmpty {
                        chatViewModel.sendMessage(content: .text(messageText), timestamp: timestamp)
                        typedMessage.removeAll()
                    }
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .foregroundStyle(Color.blue)
                        .font(.title)
                        .background(Circle()
                            .foregroundStyle(.white)
                        )
                }
            }.padding(geometry.size.height * .messageFieldInnerPaddingScalingFactor)
                .background(
                    RoundedRectangle(cornerRadius: .messageFieldCornerRadius)
                        .stroke()
                        .foregroundStyle(.quaternary)
                )
        }.padding(.bottom, geometry.size.height * .messageFieldBottomPaddingScalingFactor)
            .padding(.horizontal, geometry.size.width * .messageFieldHorizontalPaddingScalingFactor)
    }
}

//#Preview {
//    MessageField(chatViewModel: ChatViewModel())
//        //.border(.red)
//        .padding()
//}
