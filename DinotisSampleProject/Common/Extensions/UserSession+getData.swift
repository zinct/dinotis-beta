//
//  UserSession+getData.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 26/05/23.
//

import SwiftUI
import DinotisData

public extension UserSession {
    static func getData() -> [UserSession] {
        return [
            UserSession(date: "16 Sept 2022", status: .upcoming, title: "Ratna Sari Dewi", description: "Cara memahami emosional yang tidak stabil dalam menghadapi masalah di dunia ini", price: "Rp. 250500", image: Image.imgAvatarAgenda),
            UserSession( date: "16 Sept 2022", status: .cancel, title: "Joe NG", description: "Cara memahami emosional yang tidak stabil dalam menghadapi masalah", price: "Rp. 250500", image: Image.imgAvatarAgenda),
            UserSession(date: "16 Sept 2022", status: .pending, title: "Sarah Widjaya", description: "Cara memahami emosional yang tidak stabil dalam menghadapi masalah di dunia in...", price: "Rp. 250500", image: Image.imgAvatarAgenda),
            UserSession(date: "16 Sept 2022", status: .done, title: "Sarah Widjaya", description: "Cara memahami emosional yang tidak stabil dalam menghadapi masalah di dunia in...", price: "Rp. 250500", image: Image.imgAvatarAgenda),
        ]
    }
}
