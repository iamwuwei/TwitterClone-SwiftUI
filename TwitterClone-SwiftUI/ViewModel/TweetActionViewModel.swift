//
//  TweetActionViewModel.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/07.
//

import SwiftUI

class TweetActionViewModel: ObservableObject {
    let tweet: Tweet
    @Published var didLike = false
    
    init(tweet: Tweet) {
        self.tweet = tweet
        isLiked()
    }
    
    func likeTweet(){
        guard let uid = AuthViewModel.shared.currentUser?.id else { return }
        let tweetLikesRef = COLLECTION_TWEETS_REF.document(tweet.id).collection("tweet-likes")
        let userLikesRef = COLLECTION_USERS_REF.document(uid).collection("user-likes")
        
        COLLECTION_TWEETS_REF.document(tweet.id).updateData(["likes": tweet.likes + 1])
        
        tweetLikesRef.document(uid).setData([:]) { _ in
            userLikesRef.document(self.tweet.id).setData([:]) { _ in
                self.didLike = true
            }
        }
    }
    
    func unlikeTweet(){
        guard let uid = AuthViewModel.shared.currentUser?.id else { return }
        let tweetLikesRef = COLLECTION_TWEETS_REF.document(tweet.id).collection("tweet-likes")
        let userLikesRef = COLLECTION_USERS_REF.document(uid).collection("user-likes")
        
        COLLECTION_TWEETS_REF.document(tweet.id).updateData(["likes": tweet.likes - 1])
        
        tweetLikesRef.document(uid).delete { _ in
            userLikesRef.document(self.tweet.id).delete { _ in
                self.didLike = false
            }
        }
    }
    
    func isLiked() {
        guard let uid = AuthViewModel.shared.currentUser?.id else { return }
        let userLikesRef = COLLECTION_USERS_REF.document(uid).collection("user-likes").document(tweet.id)
        
        userLikesRef.getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else { return }
            self.didLike = didLike
        }
        
    }
}
