//
//  AuthServiceLogOut.swift
//  AkChat
//
//  Created by Amg on 14/10/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import FirebaseAuth

class AuthServiceLogOut {
    //MARK: Functions
    func signIn(_ email: String, _ password: String, onSuccess: @escaping (Bool) -> Void, OnError: @escaping (String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard let user = user, user.user.email != nil , error == nil else {
                print(error?.localizedDescription ?? "")
                OnError(error?.localizedDescription ?? "")
                onSuccess(false)
                return
            }
            onSuccess(true)
        }
    }
    
    func checkIfUserIsAlreadyOnline(completion: @escaping (Bool) -> Void) {
        guard Auth.auth().currentUser != nil else {
            completion(false)
            return
        }
        completion(true)
    }
}
