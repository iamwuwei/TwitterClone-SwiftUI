//
//  UsersStatesView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/03.
//

import SwiftUI

struct UsersStatesView: View {
    @Binding var followState: FollowState
    
    var body: some View {
        HStack(spacing:24){
            HStack(spacing: 4){
                Text("\(followState.following)")
                    .font(.subheadline)
                    .bold()
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            HStack(spacing: 4){
                Text("\(followState.followers)")
                    .font(.subheadline)
                    .bold()
                
                Text("Follower")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
        }
    }
}
