//
//  AuthService.swift
//  AkChat
//
//  Created by Amg on 24/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import FirebaseAuth
import FirebaseStorage

class AuthService {
    static let shared = AuthService()
    private init() {}
    
    //MARK: - Vars
    
    
    //MARK: - Functions
    func createUserInDatabase(_ pseudo: String, _ name: String, _ email: String, _ password: String, imageJPEG: Data?, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user, error == nil else {
                completion(false)
                return
            }
            
            let storageRef = Constantes.storageProfileChoice(user.user.uid)
            storageRef.putData(imageJPEG ?? Data(), metadata: nil, completion: { (_, error) in
                guard error == nil else {
                    print("error upload image")
                    completion(false)
                    return
                }
                
                storageRef.downloadURL(completion: { (url, error) in
                    guard let urlImage = url?.absoluteString, error == nil else {
                        print("error upload data in storage")
                        completion(false)
                        return
                    }
                    self.uploadInDatabase(user.user.uid, urlImage, pseudo, name, email)
                    completion(true)
                })
            })
        }
    }
    
    private func uploadInDatabase(_ uid: String, _ profileImage: String, _ firstname: String, _ lastName: String, _ email: String) {
        let dataInDatabase: Dictionary<String, AnyObject> = (["profileImage": profileImage, "firstName": firstname, "lastName": lastName, "mail": email, "welcome": "Bonjour !"] as AnyObject) as! Dictionary<String, AnyObject>
        
        let ref = Constantes.databaseChoiceUser(uid)
        ref.setValue(dataInDatabase) { (error, reference) in
            guard error == nil else {
                print("error to upload data in storage")
                return
            }
        }
    }
}

