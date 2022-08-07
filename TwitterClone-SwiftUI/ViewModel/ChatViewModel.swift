//
//  ChatViewModel.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/07.
//

import Foundation
import Firebase

class ChatViewModel: ObservableObject {
    let user: User
    @Published var messages = [Message]()
    
    init(user: User){
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let uid = AuthViewModel.shared.currentUser?.id else { return }
        
        let query = COLLECTION_MESSAGES_REF.document(uid).collection(user.id)
        
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            
            changes.forEach { change in
                let messageData = change.document.data()
                guard let fromId = messageData["fromId"] as? String else { return }
                
                COLLECTION_USERS_REF.document(fromId).getDocument{ snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let user = User(dictionary: data)
                    self.messages.append(Message(user: user, dictionary: messageData))
                    self.messages.sort(by: {$0.timestamp.dateValue() < $1.timestamp.dateValue() })
                }
            }
            
        }
    }
    
    func sendMessage(_ messageText: String) {
        guard let currentUid = AuthViewModel.shared.currentUser?.id else { return }
        let currentUserRef = COLLECTION_MESSAGES_REF.document(currentUid).collection(user.id).document()
        let receivingUserRef = COLLECTION_MESSAGES_REF.document(user.id).collection(currentUid)
        let receivingRecentRef = COLLECTION_MESSAGES_REF.document(user.id).collection("recent-messages")
        let currentRecentRef = COLLECTION_MESSAGES_REF.document(currentUid).collection("recent-messages")
        
        let messageID = currentUserRef.documentID
        
        let data: [String: Any] = ["text": messageText,
                    "id": messageID,
                    "fromId":currentUid,
                    "toId": user.id,
                    "timestamp": Timestamp(date: Date())]
        
        currentUserRef.setData(data)
        receivingUserRef.document(messageID).setData(data)
        receivingRecentRef.document(currentUid).setData(data)
        currentRecentRef.document(user.id).setData(data)
        
    }
}
