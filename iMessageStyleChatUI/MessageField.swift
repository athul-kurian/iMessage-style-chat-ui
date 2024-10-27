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
        HStack {
            TextField("iMessage", text: $typedMessage)
                .padding(.horizontal)
            
            Button {
                let timestamp = Date()
                let formattedMessage = typedMessage.trimmingCharacters(in: .whitespacesAndNewlines)
                if !formattedMessage.isEmpty {
                    chatViewModel.addMessage(content: formattedMessage, timestamp: timestamp)
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
        }.padding(2)
        .background(RoundedRectangle(cornerRadius: 50)
                    .stroke()
                    .foregroundStyle(.quaternary)
        )
        
    }
}

#Preview {
    MessageField(chatViewModel: ChatViewModel())
        .padding()
}
