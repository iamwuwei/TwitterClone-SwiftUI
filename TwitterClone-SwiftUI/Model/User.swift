//
//  User.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/04.
//

import Foundation
import Firebase

struct User: Identifiable{
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let email: String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    
    var followState: FollowState
    
    init(dictionary: [String: Any]){
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.followState = FollowState(followers: 0, following: 0)
    }
}

struct FollowState {
    let followers: Int
    let following: Int
}
