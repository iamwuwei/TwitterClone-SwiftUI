//
//  ContentView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/02.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0
    @State var showMenu = false
    var body: some View {
        
        NavigationView{
            ZStack(alignment: .topLeading){
                TabView(selection: $selectedIndex){
                    FeedView()
                        .tabItem {
                            Image(systemName: "house")
                        }
                        .tag(0)
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                        }
                        .tag(1)
                    //                NotificationsView()
                    //                    .tabItem {
                    //                        Image(systemName: "bell")
                    //                    }
                    //                    .tag(2)
                    ConversationsView()
                        .tabItem {
                            Image(systemName: "envelope")
                        }
                        .tag(3)
                }
                    .navigationBarHidden(showMenu)
                if showMenu{
                    ZStack{
                        Color(.black)
                            .opacity(showMenu ? 0.25 : 0.0)
                    }
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            showMenu = false
                        }
                    }
                    .ignoresSafeArea()
                }
                
                SideMenuView()
                    .frame(width: 300)
                    .offset(x: showMenu ? 0 : -300, y: 0)
                    .background(showMenu ? Color.white : Color.clear)
            }
            .navigationBarTitle("home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        Image("cat_can")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .background(.black)
                            .clipShape(Circle())
                    }
                }
            }
            .onAppear {
                showMenu = false
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
