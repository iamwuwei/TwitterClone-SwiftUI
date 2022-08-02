//
//  NewTweetView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import SwiftUI

struct NewTweetView: View {
    @Environment(\.dismiss) var dismiss
    
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
                Image("cat_can")
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
