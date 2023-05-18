//
//  Country.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 18/05/23.
//

import Foundation

public struct Country: Identifiable {
    public let id = UUID()
    public let name: String
    public let code: String
    public let field: String
}

public extension Country {
    static func getAll(name: String? = nil) -> [Country] {
        return [
            Country(name: "🇺🇸 America", code: "+1", field: "🇺🇸 +1"),
            Country(name: "🇮🇩 Indonesia", code: "+62", field: "🇮🇩 +62"),
            Country(name: "🇬🇧 United Kingdom", code: "+44", field: "🇬🇧 +44"),
            Country(name: "🇯🇵 Jepang", code: "+12", field: "🇯🇵 +12")
        ]
    }
}
