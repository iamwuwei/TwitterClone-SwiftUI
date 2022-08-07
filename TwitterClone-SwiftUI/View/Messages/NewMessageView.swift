//
//  NewMessageView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import SwiftUI

struct NewMessageView: View {
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var showChatView: Bool
    @Binding var selectedUser: User?
    @ObservedObject var searchViewModel = SearchViewModel(config: .newMessage)
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading){
                ForEach(searchViewModel.users){ user in
                    Button {
                        selectedUser = user
                        self.show.toggle()
                      
                    } label: {
                        UserCell(user: user)
                    }
                    
                }
            }
            .onDisappear {
                if selectedUser != nil {
                    self.showChatView.toggle()
                }
            }
        }
    }
    
}
