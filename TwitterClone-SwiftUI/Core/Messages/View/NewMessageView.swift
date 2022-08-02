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
    
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading){
                ForEach(0..<10){ _ in
                    Button {
                        self.show.toggle()
                    } label: {
                        UserCell()
                    }
                }
            }
        }
    }
    
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(show: .constant(true))
    }
}
