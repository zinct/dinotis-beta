//
//  AuthViewModel.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 21/05/23.
//

import SwiftUI
import DinotisDesignSystem

final class CreatorCreateAccountViewModel: ObservableObject {
    @Published var name = ""
    @Published var password = ""
    @Published var passwordAgain = ""
    
    @Published var isCountriesShow = false
    @Published var isSuccessModalShow = false
    @Published var isPasswordShow = false
    @Published var isPasswordAgainShow = false

    @Published var selectedCountry: Country = Country.getAll()[0]
}
