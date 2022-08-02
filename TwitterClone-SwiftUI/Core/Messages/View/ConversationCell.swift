//
//  ConversationCell.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack{
            HStack(alignment: .center, spacing: 12){
                Image("cat_can")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56 / 2)
                
                VStack(alignment: .leading, spacing: 4){
                    
                    Text("Cat Sabakan")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("I love to eat sabakan")
                        .font(.system(size: 14))
                        .lineLimit(2)
                }
                .padding(.trailing)
                Spacer()
            }
            Divider()
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
