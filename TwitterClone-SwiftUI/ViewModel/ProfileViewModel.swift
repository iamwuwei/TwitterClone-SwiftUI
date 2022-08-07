//
//  ProfileViewModel.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/07.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseCore

class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var isFollowed = false
    @Published var userTweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    init(user: User){
        self.user = user
        isFollowing()
        fetchUserTweets()
        fetchLikedTweets()
        fetchUserFollowState()
    }
    
    func follow() {
        guard let currentUserUid = Auth.auth().currentUser?.uid else { return }

        COLLECTION_FOLLOWING_REF.document(currentUserUid).collection("user-following").document(user.id).setData([:]) { _ in
            COLLECTION_FOLLOWERS_REF.document(self.user.id).collection("user-followers").document(currentUserUid).setData([:]) { _ in
                self.isFollowed = true
            }
        }
    }
    
    func unfollow() {
        guard let currentUserUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = COLLECTION_FOLLOWING_REF.document(currentUserUid).collection("user-following")
        let followersRef = COLLECTION_FOLLOWERS_REF.document(self.user.id).collection("user-followers")
        
        followingRef.document(user.id).delete { _ in
            followersRef.document(currentUserUid).delete { _ in
                self.isFollowed = false
            }
        }
        print("unfollow")
    }
    
    func isFollowing() {
        guard let currentUserUid = Auth.auth().currentUser?.uid else { return }
        
        let followingRef = COLLECTION_FOLLOWING_REF.document(currentUserUid).collection("user-following")
        
        followingRef.document(user.id).getDocument { snapshot, _ in
            guard let isFollowed = snapshot?.exists else { return }
            self.isFollowed = isFollowed
        }
    }
    
    func fetchUserTweets() {
        COLLECTION_TWEETS_REF.whereField("uid", isEqualTo: user.id).getDocuments {snapshot, _ in
            guard let documents = snapshot?.documents else { return }
//            documents.forEach { document in
//
//            }
            self.userTweets = documents.map({ Tweet(dictionary: $0.data()) })
        }
    }
    
    func fetchLikedTweets(){
        var tweets = [Tweet]()
        COLLECTION_USERS_REF.document(user.id).collection("user-likes").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let tweetIDs = documents.map({ $0.documentID })
            
            tweetIDs.forEach { id in
                COLLECTION_TWEETS_REF.document(id).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let tweet = Tweet(dictionary: data)
                    tweets.append(tweet)
                    guard tweets.count == tweetIDs.count else { return }
                    
                    self.likedTweets = tweets
                }
            }
        }
    }
    
    func tweets(forFilter filter: TweetFilterOptions) -> [Tweet] {
        switch filter {
        case .tweets:
            return userTweets
        case .likes:
            return likedTweets
        }
    }
    
    func fetchUserFollowState() {
        let followersRef = COLLECTION_FOLLOWERS_REF.document(user.id).collection("user-followers")
        let followingRef = COLLECTION_FOLLOWING_REF.document(user.id).collection("user-following")
        
        followersRef.getDocuments { snapshot, _ in
            guard let followerCount = snapshot?.documents.count else { return }
            followingRef.getDocuments { snapshot, _ in
                guard let followingCount = snapshot?.documents.count else { return }
                self.user.followState = FollowState(followers: followerCount, following: followingCount)
            }
        }
    }
}
