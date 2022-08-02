//
//  Message.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import Foundation

struct MockMessage: Identifiable{
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "sabakan", messageText: "how are you", isCurrentUser: true),
    .init(id: 1, imageName: "saba", messageText: "I'm good", isCurrentUser: false),
    .init(id: 2, imageName: "sabakan", messageText: "how are you", isCurrentUser: true),
    .init(id: 3, imageName: "saba", messageText: "I'm good", isCurrentUser: false),
    .init(id: 4, imageName: "sabakan", messageText: "how are you", isCurrentUser: true),
    .init(id: 5, imageName: "saba", messageText: "I'm good", isCurrentUser: false),
    .init(id: 6, imageName: "sabakan", messageText: "how are you", isCurrentUser: true),
    .init(id: 7, imageName: "saba", messageText: "I'm good", isCurrentUser: false),
]

