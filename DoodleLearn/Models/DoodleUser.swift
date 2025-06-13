//
//  DoodleUser.swift
//  DoodleLearn
//
//  Created by Thomas Mayr on 13.06.25.
//

import Foundation
import FirebaseAuth

class DoodleUser {
    let id: String
    let userName: String
    let joinDate: Date
    let profilePicture: String
    let email: String
    
    init(id: String, userName: String, joinDate: Date, profilePicture: String, email: String) {
        self.id = id
        self.userName = userName
        self.joinDate = joinDate
        self.profilePicture = profilePicture
        self.email = email
    }
    
    init(firebaseUser: User) {
        self.id = firebaseUser.uid
        self.userName = firebaseUser.displayName ?? ""
        self.email = firebaseUser.email ?? ""
        self.joinDate = firebaseUser.metadata.creationDate ?? Date.now
        self.profilePicture = firebaseUser.photoURL?.absoluteString ?? ""
    }
}
