//
//  TweetCell.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import SwiftUI
import Kingfisher

struct TweetCell: View {
    let tweet: Tweet
    
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 12){
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56 / 2)
                    .padding(.leading)
                
                NavigationLink {
                    TweetDetailView(tweet: tweet)
                } label: {
                    VStack(alignment: .leading, spacing: 4){
                        HStack{
                            Text(tweet.fullname)
                                .font(.system(size: 14, weight: .semibold))
                            
                            Text("@\(tweet.username) •")
                                .foregroundColor(.gray)
                            
                            Text(tweet.timestampString)
                                .foregroundColor(.gray)
                            
                            Spacer()
                        }
                        Text(tweet.caption)
                    }
                    .foregroundColor(.black)
                }
                Spacer()
            }
            
            TweetActionView(tweet: tweet)
                .padding(.horizontal)
            Divider()
        }
        .padding(.leading, -16)
    }
}
