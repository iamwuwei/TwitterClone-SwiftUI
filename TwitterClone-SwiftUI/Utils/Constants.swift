//
//  Constants.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/07.
//

import FirebaseFirestore

let COLLECTION_USERS_REF = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS_REF = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING_REF = Firestore.firestore().collection("following")
let COLLECTION_TWEETS_REF = Firestore.firestore().collection("tweets")
let COLLECTION_MESSAGES_REF = Firestore.firestore().collection("messages")
