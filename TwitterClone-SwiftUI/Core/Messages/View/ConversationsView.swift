//
//  ConversationsView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import SwiftUI

struct ConversationsView: View {
    @State var isShowingNewMessageView = false
    @State var showChat = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            NavigationLink(destination: ChatView(), isActive: $showChat){}
            
            ScrollView{
                VStack{
                    ForEach(0..<20, id: \.self){ _ in
                        NavigationLink(destination: {
                            ChatView()
                        }, label: {
                            ConversationCell()
                                .foregroundColor(.black)
                        })
                    }
                }
            }
            
            Button {
                isShowingNewMessageView.toggle()
            } label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $isShowingNewMessageView, onDismiss: {showChat.toggle()}) {
                NewMessageView(show: $isShowingNewMessageView)
            }
        }
        .padding()
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
