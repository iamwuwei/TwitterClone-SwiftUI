//
//  SideMenuView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/03.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading){
                Image("cat_can")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 48, height: 48)
                    .cornerRadius(48 / 2)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Cat Sabakan")
                        .font(.headline)
                    
                    Text("@cat_sabakan")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                UsersStatesView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id:\.rawValue){ option in
                if option == .profile{
                    NavigationLink {
                        ProfileView()
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

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
