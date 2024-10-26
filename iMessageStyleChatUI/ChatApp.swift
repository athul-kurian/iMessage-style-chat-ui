//
//  ChatApp.swift
//  iMessageStyleChatUI
//
//  Created by Athul Kurian on 22/10/24.
//

import SwiftUI

@main
struct ChatApp: App {
    var body: some Scene {
        WindowGroup {
            ChatView(messagingViewModel: ChatViewModel())
        }
    }
}
