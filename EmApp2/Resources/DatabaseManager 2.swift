//
//  DatabaseManager.swift
//  EmApp2
//
//  Created by Taléo Olivio Gorloo on 2024-03-08.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
}

//Account Management
extension DatabaseManager {
    
    public func userExists(with email: String, completion: @escaping ((Bool) -> Void)){
        
        database.child(email).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? String != nil else{
                completion(false)
                return
            }
            completion(true)
        })
    }
    
    //Insert New User to Database
    public func insertUser(with user: ChatAppUser) {
        database.child(user.emailAddress).setValue([
            "user_name": user.userName
        ])
    }
}

struct ChatAppUser{
    let userName: String
    let emailAddress: String
    //let profilePictureUrl: String
}
