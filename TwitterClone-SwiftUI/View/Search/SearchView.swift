//
//  SearchView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var searchViewModel = SearchViewModel(config: .search)
    @State var searchText = ""
    
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            VStack(alignment: .leading){
                ForEach(searchText.isEmpty ? searchViewModel.users : searchViewModel.filteredUser(searchText)){ user in
                    NavigationLink {
                        ProfileView(user: user)
                    } label: {
                        UserCell(user: user)
                    }
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
