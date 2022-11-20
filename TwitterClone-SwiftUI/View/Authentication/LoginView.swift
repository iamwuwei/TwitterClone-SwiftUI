//
//  LoginView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/03.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var authViewModel = AuthViewModel.shared
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView{
            ZStack {
                VStack(spacing: 0){
                    Image("bird")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 100)
                        .padding(.top, 100)
                        .padding(.bottom, 50)
                    
                    VStack(spacing: 20) {
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .foregroundColor(.white)
                        
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 20)
                    
                    HStack{
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.top, 15)
                                .padding(.trailing, 32)
                        }
                        
                    }
                    
                    Button {
                        authViewModel.login(withEmail: email, password: password)
                    } label: {
                        HStack{
                            Spacer()
                            Text("Sign In")
                                .font(.headline)
                                .foregroundColor(.blue)
                            Spacer()
                        }
                        .frame(height: 50)
                        .background(.white)
                        .clipShape(Capsule())
                        .padding()
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                    
                    NavigationLink {
                        RegistrationView().navigationBarBackButtonHidden(true)
                    } label: {
                        HStack{
                            Spacer()
                            Text("Don't have an account? ")
                                .font(.system(size: 14))
                            Text("Sign Up ")
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                    }
                }
            }
            .background(Color.blue)
            .ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
