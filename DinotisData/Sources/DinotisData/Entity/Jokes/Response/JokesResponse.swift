//
//  File.swift
//  
//
//  Created by Irham Naufal on 28/05/23.
//

import Foundation

public struct JokesResponse: Codable {
    var categories: [Categories]?
    var createdAt: String?
    var iconURL: String?
    var id: String?
    var updatedAt: String?
    var url: String?
    var value: String?
    
    enum CodingKeys: String, CodingKey {
        case categories, id, url, value
        case createdAt = "created_at"
        case iconURL = "icon_url"
        case updatedAt = "updated"
    }
    
    public init(
        categories: [Categories]? = nil,
        createdAt: String? = nil,
        iconURL: String? = nil,
        id: String? = nil,
        updatedAt: String? = nil,
        url: String? = nil,
        value: String? = nil
    ) {
        self.categories = categories
        self.createdAt = createdAt
        self.iconURL = iconURL
        self.id = id
        self.updatedAt = updatedAt
        self.url = url
        self.value = value
    }
}

public struct Categories: Codable {
    
}
