//
//  EditProfileViewModel.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 08/06/23.
//

import SwiftUI
import DinotisDesignSystem

final class EditProfileViewModel: ObservableObject {
    @Published var email = ""
    @Published var name = ""
}
