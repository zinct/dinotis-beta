//
//  AgendaViewModel.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 25/05/23.
//

import SwiftUI
import DinotisData
import DinotisDesignSystem

final class AgendaViewModel: ObservableObject {
    @Published var selectedIndex = "0"
    @Published var userSession = UserSession.getData()
}
