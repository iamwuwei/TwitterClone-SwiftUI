//
//  MessageInputView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageText: String
    
    var action: () -> Void
    
    var body: some View {
        VStack{
            Divider()
            
            HStack{
                TextField("Message...", text: $messageText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button(action: action){
                    Text("Send")
                        .bold()
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
        }
    }
}
