//
//  AuthenticationError.swift
//  DoodleLearn
//
//  Created by Thomas Mayr on 13.06.25.
//

import Foundation

enum AuthenticationError: Error {
    case emailAlreadyInUse
    case invalidEmail
    case userNotCreated
    case wrongPassword
    case userDisabled
}
