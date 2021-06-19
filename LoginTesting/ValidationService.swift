//
//  ValidationService.swift
//  LoginTesting
//
//  Created by Gurjinder Singh on 18/06/21.
//

import Foundation

struct ValidationService {
    func validateEmail(userEmail: String?) throws -> String {
        guard let userEmail = userEmail else {
            throw LoginValidationError.blank
        }
        if userEmail.count < 8 {
            throw LoginValidationError.emailTooShort
        }
        if userEmail.count > 20 {
            throw LoginValidationError.emailTooLong
        }
        return userEmail
    }
    
    func validatePassword(_ userPassword: String?)  throws -> String {
        guard let password = userPassword else {
            throw LoginValidationError.blank
        }
        if password.count < 8 {
            throw LoginValidationError.passwordTooShort
        }
        return password
    }
}

enum LoginValidationError: Error {
    case invalidCred
    case emailTooShort
    case emailTooLong
    case passwordTooShort
    case blank
    
    var desc: String {
        switch self {
        case .invalidCred:
            return "Enter Valid Credentials"
        case .emailTooShort:
            return "Email Should be of min of 8 char"
        case .passwordTooShort:
            return "Password Should be of min 8 char"
        case .blank:
            return "Can't left any field blank"
        case .emailTooLong:
            return "Email should not exceed 40 char"
        }
    }
}
