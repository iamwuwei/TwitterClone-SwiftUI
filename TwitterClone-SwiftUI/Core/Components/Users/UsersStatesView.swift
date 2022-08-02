//
//  UsersStatesView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/03.
//

import SwiftUI

struct UsersStatesView: View {
    var body: some View {
        HStack(spacing:24){
            HStack(spacing: 4){
                Text("807")
                    .font(.subheadline)
                    .bold()
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            HStack(spacing: 4){
                Text("6.9M")
                    .font(.subheadline)
                    .bold()
                
                Text("Follower")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            
        }
    }
}

struct UsersStatesView_Previews: PreviewProvider {
    static var previews: some View {
        UsersStatesView()
    }
}
