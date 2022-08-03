//
//  AuthViewModel.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/03.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User? = nil
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    init(){
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email:String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error{
                print("DEBUG: Failed to login: \(error.localizedDescription)")
                return
            }
            print("DEBUG: Successfully logged in")
        }
    }
    
    func registerUser(email: String, password: String, username: String, fullname:String, profileImage: UIImage){
        
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                print("DEBUG: Faild to upload image \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password){ result, error in
                    if let error = error{
                        print("DEBUG: Error \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = result?.user else { return }
                    
                    let data = ["email": email,
                                "username": username,
                                "profileImageUrl": profileImageUrl,
                                "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data){ _ in
                        self.userSession = user
                        
                        print("DEBUG: Successfully uploaded user data!")
                    }
                
                    print("DEBUG: Successfully signed up user!")
                }
            }
        }
    }
    
    func signOut(){
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser(){
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            guard let data = snapshot?.data() else { return }
            
            let user = User(dictionary: data)
            print("DEBUG: User is \(user.username)")
        }
    }
}