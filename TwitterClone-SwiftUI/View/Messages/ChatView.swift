//
//  ChatView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import SwiftUI

struct ChatView: View {
    let user: User
    let chatViewModel: ChatViewModel
    @State var messageText: String = ""
    
    init(user: User){
        self.user = user
        self.chatViewModel = ChatViewModel(user: user)
    }
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(chatViewModel.messages){ message in
                       MessageCell(message: message)
                    }
                }
            }
            Divider()
            VStack{
                HStack{
                    TextField("Message...", text: $messageText)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(minHeight: 30)
                    
                    Button(action: {
                        chatViewModel.sendMessage(messageText)
                        messageText = ""
                    }){
                        Text("Send")
                            .bold()
                            .foregroundColor(.blue)
                    }
                    .disabled(messageText == "" ? true : false)
                }
                .padding(.horizontal)
            }
                .padding()
        }
        .navigationTitle(user.username)
        .navigationViewStyle(.stack)
    }
}

public struct LazyView<Content: View>: View {
    private let build: () -> Content
    public init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    public var body: Content {
        build()
    }
}
