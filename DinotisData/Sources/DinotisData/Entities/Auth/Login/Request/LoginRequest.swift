//
//  File.swift
//  
//
//  Created by Indra Mahesa on 09/06/23.
//

import Foundation

// MARK: - LoginRequest
public struct LoginRequest {
    public let email, password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
