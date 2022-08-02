//
//  FeedView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import SwiftUI

struct FeedView: View {
    @State var isShowingNewTweetView = false
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                VStack{
                    ForEach(0..<20, id: \.self){ _ in
                        TweetCell()
                    }
                }
            }
            Button {
                isShowingNewTweetView.toggle()
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 32, height: 32)
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

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
