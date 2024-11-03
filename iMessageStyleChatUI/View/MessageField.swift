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
    
    var body: some View {
        
        HStack(alignment: .bottom) {
            Image(systemName: "plus")
                .foregroundStyle(.secondary)
                .padding(10)
                .background(Circle().foregroundStyle(.gray.opacity(0.25)))
            
            HStack(alignment: .bottom) {
                TextField("iMessage", text: $typedMessage, axis: .vertical)
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                
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
                            .frame(width: 25)
                            .foregroundStyle(.white)
                        )
                }
            }.padding(3)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke()
                        .foregroundStyle(.quaternary)
                )
        }
        
    }
}

#Preview {
    MessageField(chatViewModel: ChatViewModel())
        //.border(.red)
        .padding()
}
