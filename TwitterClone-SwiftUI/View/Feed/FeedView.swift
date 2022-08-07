//
//  FeedView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var feedViewModel = FeedViewModel()
    @State var isShowingNewTweetView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            VStack {
                ScrollView{
                    LazyVStack{
                        ForEach(feedViewModel.tweets){ tweet in
                            TweetCell(tweet: tweet)
                        }
                    }
                }
                Spacer()
            }
            Button {
                isShowingNewTweetView.toggle()
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 20, height: 20)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $isShowingNewTweetView) {
                NewTweetView()
            }
        }
        .padding()
    }
}
