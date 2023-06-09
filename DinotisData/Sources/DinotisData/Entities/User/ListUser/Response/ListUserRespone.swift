//
//  File.swift
//  
//
//  Created by Indra Mahesa on 08/06/23.
//

import Foundation

// MARK: - ListUserResponse
public struct ListUserResponse: Codable, Equatable {
    public static func == (lhs: ListUserResponse, rhs: ListUserResponse) -> Bool {
        return lhs.data == rhs.data
    }
    
    public let page, perPage, total, totalPages: Int
    public let data: [ListUserResponseDataField]
    public let support: ListUserResponseSupportField

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

// MARK: - Datum
public struct ListUserResponseDataField: Codable, Hashable {
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
public struct ListUserResponseSupportField: Codable {
    public let url: String
    public let text: String
}

