//
//  Constantes.swift
//  AkChat
//
//  Created by Amg on 25/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import FirebaseStorage
import FirebaseDatabase

struct Constantes {
    //MARK: - References Database
    static let databaseRef = Database.database().reference()
    static var databaseUID: DatabaseReference {
        return databaseRef.child("users")
    }
    
    static func databaseChoiceUser(_ id: String) -> DatabaseReference {
        return Constantes.databaseUID.child(id)
    }
}

extension Constantes {
    //MARK: - References Storage
    static let storageRef = Storage.storage().reference()
    static var storageProfile: StorageReference {
        return storageRef.child("profile")
    }
    
    static func storageProfileChoice(_ id: String) -> StorageReference {
        return storageProfile.child(id)
    }
    
}
