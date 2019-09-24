//
//  AuthSession.swift
//  AkChat
//
//  Created by Amg on 24/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import FirebaseAuth

class AuthSession: AuthProtocol {
    func createUser(_ email: String, _ password: String, completionHandler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: completionHandler)
    }
}
