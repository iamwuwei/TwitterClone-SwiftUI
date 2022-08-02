//
//  UserCell.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(alignment: .center, spacing: 12){
            Image("cat_can")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(56 / 2)
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4){
                
                Text("Cat Sabakan")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("I love to eat sabakan")
                    .font(.system(size: 14))
            }
            .padding(.trailing)
            .foregroundColor(.black)
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
