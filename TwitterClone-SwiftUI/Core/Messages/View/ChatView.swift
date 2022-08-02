//
//  ChatView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import SwiftUI

struct ChatView: View {
    @State var messageText: String = ""
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MOCK_MESSAGES){ message in
                       MessageView(message: message)
                    }
                }
            }
            MessageInputView(messageText: $messageText, action: sendMessage)
                .padding()
        }
    }
    
    func sendMessage(){
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
