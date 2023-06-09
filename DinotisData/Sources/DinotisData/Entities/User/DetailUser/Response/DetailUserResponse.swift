//
//  File.swift
//  
//
//  Created by Indra Mahesa on 08/06/23.
//

import Foundation

// MARK: - ListUserResponse
public struct DetailUserResponse: Codable {
    public let data: DetailUserResponseDataField
    public let support: DetailUserResponseSupportField
}

// MARK: - DataClass
public struct DetailUserResponseDataField: Codable {
    public let id: Int
    public let email, firstName, lastName: String
    public let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
public struct DetailUserResponseSupportField: Codable {
    public let url: String
    public let text: String
}

