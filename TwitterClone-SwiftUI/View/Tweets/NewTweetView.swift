//
//  NewTweetView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var newTweetViewModel = NewTweetViewModel()
    
    @State private var caption = ""
    var body: some View {
        VStack{
            HStack{
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
                Spacer()
                
                Button {
                    newTweetViewModel.uploadTweet(caption: caption) { _ in
                        dismiss()
                    }
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }.padding()
            
            HStack(alignment: .top, content: {
                KFImage(URL(string: AuthViewModel.shared.currentUser?.profileImageUrl ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                TextArea("what's happening..?", text: $caption)
                Spacer()
            })
            .padding()
            Spacer()
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
