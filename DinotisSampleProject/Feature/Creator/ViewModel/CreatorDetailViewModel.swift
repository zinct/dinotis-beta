//
//  CreatorDetailViewModel.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 09/08/23.
//

import SwiftUI
import DinotisData
import DinotisDesignSystem

final class CreatorDetailViewModel: ObservableObject {
    @Published var selectedIndex = "0"
    @Published var sessionSelected = "Sesi yang tersedia"
}
