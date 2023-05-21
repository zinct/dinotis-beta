//
//  File.swift
//  
//
//  Created by Irham Naufal on 21/05/23.
//

import SwiftUI

public struct UserSession {
    var id: String?
    var date: String?
    var status: String?
    var title: String?
    var description: String?
    var price: String?
    var image: Image?
    
    public init(
        id: String? = nil,
        date: String? = nil,
        status: String? = nil,
        title: String? = nil,
        description: String? = nil,
        price: String? = nil,
        image: Image?
    ) {
        self.id = id
        self.date = date
        self.status = status
        self.title = title
        self.description = description
        self.price = price
        self.image = image
    }
}
