//
//  FirebaseAuthRepository.swift
//  DoodleLearn
//
//  Created by Thomas Mayr on 13.06.25.
//

import Foundation
import FirebaseAuth

class FirebaseAuthRepository: AuthRepository {
    
    func register(withEmail email: String, password: String) throws -> DoodleUser {
        var firebaseUser: User?
        var registrationError: AuthenticationError?
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error as? NSError {
                switch AuthErrorCode(rawValue: error.code) {
                case .emailAlreadyInUse:
                    registrationError = AuthenticationError.emailAlreadyInUse
                case .invalidEmail:
                    registrationError = AuthenticationError.invalidEmail
                default:
                    print("Error: \(error.localizedDescription)")
                }
            } else {
                firebaseUser = Auth.auth().currentUser
            }
        }
        
        if let error = registrationError {
            throw error
        }
        
        if let user = firebaseUser {
           return DoodleUser(firebaseUser: user)
        } else {
            throw AuthenticationError.userNotCreated
        }
    }
    
    func login(withEmail email: String, password: String) throws -> DoodleUser {
        var firebaseUser: User?
        var loginError: AuthenticationError?
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error as? NSError {
                switch AuthErrorCode(rawValue: error.code) {
                case .userDisabled:
                    loginError = AuthenticationError.userDisabled
                case .wrongPassword:
                    loginError = AuthenticationError.wrongPassword
                case .invalidEmail:
                    loginError = AuthenticationError.invalidEmail
                default:
                    print("Error: \(error.localizedDescription)")
                }
            } else {
                firebaseUser = Auth.auth().currentUser
            }
        }
        
        if let error = loginError {
            throw error
        }
        
        if let user = firebaseUser {
            return DoodleUser(firebaseUser: user)
        } else {
            throw AuthenticationError.userNotCreated
        }
    }
}
