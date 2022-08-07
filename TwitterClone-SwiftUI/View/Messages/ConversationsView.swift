//
//  ConversationsView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import SwiftUI
import Kingfisher

struct ConversationsView: View {
    @State var isShowingNewMessageView = false
    @State var showChat = false
    @State var showChatViewFromNewMessage = false
    @State var selectedUser: User?
    @ObservedObject var conversationsViewModel = ConversationsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            if let user = selectedUser {
                NavigationLink(isActive: $showChatViewFromNewMessage, destination: {
                    ChatView(user: user)
                        .onDisappear {
                            selectedUser = nil
                        }
                }, label: {})
                .navigationViewStyle(.stack)
            }
            
            ScrollView{
                VStack{
                    ForEach(conversationsViewModel.recentMessages){ message in
                        NavigationLink(destination: {
                           ChatView(user: message.user)
                        }, label: {
                            ConversationCell(message: message)
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
                    .frame(width: 20, height: 20)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $isShowingNewMessageView) {
                NewMessageView(show: $isShowingNewMessageView, showChatView: $showChatViewFromNewMessage, selectedUser: $selectedUser)
            }
        }
        .padding()
    }
}
