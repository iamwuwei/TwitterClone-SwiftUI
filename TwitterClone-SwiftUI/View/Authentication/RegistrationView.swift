//
//  RegistrationView.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/03.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State var email = ""
    @State var fullName = ""
    @State var userName = ""
    @State var password = ""
    @State var showImagePicker = false
    
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    
    var body: some View {
        ZStack {
            VStack(){
                Button {
                    showImagePicker.toggle()
                } label: {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipped()
                                .cornerRadius(75)
                                .padding(.top, 100)
                                .padding(.bottom, 50)
                        } else{
                            Image("plus_photo")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .padding(.top, 100)
                                .padding(.bottom, 50)
                                .foregroundColor(.white)
                        }
                    }
                }
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content:{
                    ImagePicker(image: $selectedUIImage)})
                
                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $fullName, placeholder: Text("Full Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $userName, placeholder: Text("User Name"), imageName: "person")
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
                
                Button {
                    guard let image = selectedUIImage else { return }
                    
                    authViewModel.registerUser(email: email, password: password, username: userName, fullname: fullName, profileImage: image)
                    
                } label: {
                    HStack{
                        Spacer()
                        Text("Sign Up")
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
                
                HStack{
                    Spacer()
                    Text("Already have an account? ")
                        .font(.system(size: 14))
                    Text("Sign In ")
                        .font(.system(size: 14, weight: .semibold))
                        .onTapGesture {
                            dismiss()
                        }
                    Spacer()
                }
                .foregroundColor(.white)
            }
        }
        .ignoresSafeArea()
        .background(Color.blue)
    }
    
    func loadImage(){
        guard let selectedImage = selectedUIImage else {
            return
        }
        
        image = Image(uiImage: selectedImage)
    }
}

//struct RegistrationView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegistrationView()
//    }
//}
