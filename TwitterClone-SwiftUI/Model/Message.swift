//
//  Message.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import Foundation
import Firebase

struct Message: Identifiable {
    let text: String
    let user: User
    let toId: String
    let fromId: String
    let isFromCurrentUser: Bool
    let timestamp: Timestamp
    let id: String
    
    var chatPartnerId: String{ return isFromCurrentUser ? toId : fromId }
    
    init(user: User, dictionary: [String: Any]) {
        self.user = user
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictionary["id"] as? String ?? ""
    }
}


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

