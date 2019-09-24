//
//  AuthService.swift
//  AkChat
//
//  Created by Amg on 24/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import FirebaseAuth

class AuthService {
    enum Result {
        case data(AuthDataResult)
        case error(Error)
    }
    //MARK: - Vars
    private var authSession: AuthSession
    
    init(authSession: AuthSession = AuthSession()) {
        self.authSession = authSession
    }
    
    func createUserInDatabase(_ email: String, _ password: String, completion: @escaping(Bool) -> Void) {
        authSession.createUser(email, password) { (user, error) in
            guard error == nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }
}
