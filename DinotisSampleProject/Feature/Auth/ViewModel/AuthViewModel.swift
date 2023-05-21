//
//  AuthViewModel.swift
//  DinotisSampleProject
//
//  Created by Irham Naufal on 21/05/23.
//

import SwiftUI
import DinotisDesignSystem

final class AuthViewModel: ObservableObject {
    
    @Published var selectedCountry = Country.getAll()[0]
    
    @Published var phone = ""
    @Published var password = ""
    @Published var state: AuthViewState = .login
    @Published var isPhoneError = false
    @Published var isPasswordError = false
    @Published var isCountriesShow = false
    @Published var isPasswordShow = false
    @Published var otpView = false
    @Published var isLoginSuccess = false
    
    @Published var phoneDesired = "81395749557"
    @Published var passwordDesired = "admin"
    
    
    func handleLogin() {
        if phone != phoneDesired {
            isPhoneError = true
        } else {
            isPhoneError = false
        }
        
        if password != passwordDesired {
            isPasswordError = true
        } else {
            isPasswordError = false
        }
        
        if phone == phoneDesired && password == passwordDesired {
            withAnimation {
                isLoginSuccess = true
            }
        }
    }
}
