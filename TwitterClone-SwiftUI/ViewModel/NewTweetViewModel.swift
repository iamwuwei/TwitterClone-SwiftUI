//
//  NewTweetViewModel.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/07.
//

import Foundation
import Firebase

class NewTweetViewModel: ObservableObject {
    func uploadTweet(caption: String, completion: @escaping((Error?) -> Void)) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        let docRef = COLLECTION_TWEETS_REF.document()
        
        let data: [String: Any] = [
            "uid": user.id,
            "caption": caption,
            "fullname": user.fullname,
            "timestamp": Timestamp(date: Date()),
            "username": user.username,
            "profileImageUrl": user.profileImageUrl,
            "likes": 0,
            "id": docRef.documentID
        ]
        
        docRef.setData(data, completion: completion)
    }
}
