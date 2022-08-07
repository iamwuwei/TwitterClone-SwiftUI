//
//  SideMenuView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/03.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @ObservedObject var authViewModel = AuthViewModel.shared
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading){
                KFImage(URL(string: authViewModel.currentUser?.profileImageUrl ?? ""))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 48, height: 48)
                    .cornerRadius(48 / 2)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(authViewModel.currentUser?.fullname ?? "")
                        .font(.headline)
                    
                    Text("@\(authViewModel.currentUser?.username ?? "")")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
//                UsersStatesView(followState: $authViewModel.currentUser.followState)
//                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id:\.rawValue){ option in
                if option == .profile{
                    NavigationLink {
//                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(viewModel: option)
                    }
                }
                else if option == .logout{
                    SideMenuOptionRowView(viewModel: option)
                }
                else{
                    SideMenuOptionRowView(viewModel: option)
                }
            }
            Spacer()
        }
        .padding(.top)
    }
}
