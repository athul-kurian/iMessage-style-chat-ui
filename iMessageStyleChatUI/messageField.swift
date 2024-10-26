//
//  messageField.swift
//  iMessageStyleChatUI
//
//  Created by Athul Kurian on 25/10/24.
//

import Foundation
import SwiftUI

extension ChatView {
    var messageField: some View {
        HStack {
            TextField("iMessage", text: $typedMessage)
            .padding(.horizontal)
            Image(systemName: "arrow.up.circle.fill")
            .foregroundStyle(Color.blue)
            .font(.title)
            .background(Circle()
                        .frame(width: 25)
                        .foregroundStyle(.white)
            )
            .onTapGesture {
                let timestamp = Date()
                let formattedMessage = typedMessage.trimmingCharacters(in: .whitespacesAndNewlines)
                if !formattedMessage.isEmpty {
                    messagingViewModel.addMessage(content: formattedMessage, timestamp: timestamp)
                    typedMessage.removeAll()
                }
            }
        }.padding(2)
        .background(RoundedRectangle(cornerRadius: 50)
                    .stroke()
                    .foregroundStyle(.quaternary)
        )
    }
}
