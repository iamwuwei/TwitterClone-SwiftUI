//
//  TweetActionView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/07.
//

import SwiftUI

struct TweetActionView: View {
    @ObservedObject var tweetActionViewModel: TweetActionViewModel
    let tweet: Tweet
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.tweetActionViewModel = TweetActionViewModel(tweet: tweet)
    }
    
    var body: some View {
        HStack{
            Button {
                
            } label: {
                Image(systemName: "bubble.left")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "arrow.2.squarepath")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            }
            Spacer()
            Button {
                tweetActionViewModel.didLike ? tweetActionViewModel.unlikeTweet() : tweetActionViewModel.likeTweet()
            } label: {
                Image(systemName: tweetActionViewModel.didLike ? "heart.fill" : "heart")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
                    .foregroundColor(tweetActionViewModel.didLike ? .red : .gray)
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "bookmark")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            }
        }
        .foregroundColor(.gray)
    }
}
