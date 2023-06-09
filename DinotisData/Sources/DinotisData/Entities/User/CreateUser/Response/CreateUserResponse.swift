//
//  File.swift
//  
//
//  Created by Indra Mahesa on 08/06/23.
//

import Foundation

// MARK: - CreateUserResponse
public struct CreateUserResponse: Codable {
    public let name, job, id, createdAt: String
}
