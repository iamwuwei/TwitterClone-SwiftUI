//
//  User.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/04.
//

import Foundation

struct User: Identifiable{
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let email: String
    
    init(dictionary: [String: Any]){
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
    }
}
