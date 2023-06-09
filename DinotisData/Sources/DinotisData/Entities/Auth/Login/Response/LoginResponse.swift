//
//  File.swift
//  
//
//  Created by Indra Mahesa on 09/06/23.
//

import Foundation

// MARK: - LoginResponse
public struct LoginResponse: Codable {
    public let token: String
    
    enum CodingKeys: String, CodingKey {
        case token
    }
}
