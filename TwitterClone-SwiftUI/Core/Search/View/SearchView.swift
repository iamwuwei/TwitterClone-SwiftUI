//
//  SearchView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            VStack(alignment: .leading){
                ForEach(0..<10){ _ in
                    UserCell()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
