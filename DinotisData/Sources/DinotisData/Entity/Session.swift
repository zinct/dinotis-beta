//
//  File.swift
//  
//
//  Created by Irham Naufal on 21/05/23.
//

import SwiftUI

public enum UserSessionStatus {
    case pending, upcoming, waiting, done, cancel
}

public struct UserSession: Identifiable {
    public let id = UUID()
    public var date: String?
    public var status: UserSessionStatus?
    public var title: String?
    public var description: String?
    public var price: String?
    public var image: Image?
    
    public init(
        date: String? = nil,
        status: UserSessionStatus? = nil,
        title: String? = nil,
        description: String? = nil,
        price: String? = nil,
        image: Image?
    ) {
        self.date = date
        self.status = status
        self.title = title
        self.description = description
        self.price = price
        self.image = image
    }
}
