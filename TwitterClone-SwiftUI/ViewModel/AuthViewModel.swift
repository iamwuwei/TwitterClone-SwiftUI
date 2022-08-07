//
//  AuthViewModel.swift
//  TwitterClone-SwiftUI
//
//  Created by Wei Wu on 2022/08/03.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class AuthViewModel: ObservableObject{
    static let shared = AuthViewModel()
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var currentUser: User?
    @Published var isLoggedIn: Bool = false
    
    private init(){
        guard let loggedUser = Auth.auth().currentUser else { return }
        isLoggedIn = true
        fetchUser(uid: loggedUser.uid)
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
                                "fullname": fullname,
                                "profileImageUrl": profileImageUrl,
                                "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data){ _ in
                        self.currentUser = User(dictionary: data)
                        
                        print("DEBUG: Successfully uploaded user data!")
                    }
                    
                    print("DEBUG: Successfully signed up user!")
                }
            }
        }
    }
    
    func signOut(){
        self.isLoggedIn = false
        try? Auth.auth().signOut()
    }
    
    func fetchUser(uid: String){
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            guard let data = snapshot?.data() else { return }
            
            let user = User(dictionary: data)
            self.currentUser = user
            print("DEBUG: User is \(user.username)")
        }
    }
    
    func tabTitle(index: Int) -> String {
        switch(index) {
        case 0: return "Home"
        case 1: return "Search"
        case 2: return "Messages"
        default: return ""
        }
    }
}
