//
//  AuthRepository.swift
//  DoodleLearn
//
//  Created by Thomas Mayr on 13.06.25.
//

import Foundation
import FirebaseAuth

protocol AuthRepository {
    
    func register(withEmail: String, password: String) throws -> DoodleUser
    
    func login(withEmail: String, password: String) throws -> DoodleUser
}
