//
//  ChatHeader.swift
//  iMessageStyleChatUI
//
//  Created by Athul Kurian on 30/10/24.
//

import SwiftUI

struct ChatHeader: View {
    var contactName: String
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .font(.system(size: 40))
                .padding(.top)
            Text(contactName)
                .font(.caption)
        }
        .padding(.top, 45)
        .padding(.bottom, 8)
        .frame(maxWidth: .infinity)
        .background(.thinMaterial)
        .overlay(
            Rectangle()
                .frame(height: 1.5) // Border thickness
                .foregroundColor(.gray.opacity(0.1)), // Border color
            alignment: .bottom
        )
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    ChatHeader(contactName: "John Doe").border(.red)
}


