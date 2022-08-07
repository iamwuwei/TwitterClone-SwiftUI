//
//  SearchViewModel.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/07.
//

import SwiftUI

enum SearchViewModelConfiguration {
    case search
    case newMessage
}

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    private let config: SearchViewModelConfiguration
    init(config: SearchViewModelConfiguration) {
        self.config = config
        fetchUsers(config: config)
    }
    
    func fetchUsers(config: SearchViewModelConfiguration) {
        COLLECTION_USERS_REF.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
///  normal version
//            documents.forEach { document in
//                let user = User(dictionary: document.data())
//                self.users.append(user)
//            }
///  short version
//            self.users = documents.map({User(dictionary: $0.data())})
            
            let users = documents.map({User(dictionary: $0.data())})
            
            switch(config) {
            case .newMessage:
                self.users = users.filter({ !$0.isCurrentUser })
            case .search:
                self.users = users
            }
        }
    }
    
    func filteredUser(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter ({ $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.lowercased().contains(lowercasedQuery) })
    }
}
