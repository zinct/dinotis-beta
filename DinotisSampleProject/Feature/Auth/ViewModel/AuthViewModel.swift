//
//  AuthViewModel.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 21/05/23.
//

import SwiftUI
import DinotisDesignSystem
import DinotisData

final class AuthViewModel: ObservableObject {
//    private let checkCredential: CheckCredentialUseCase
    
    @Published var login: DataState<LoginResponse> = .idle
    
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
    
//    init(checkCredential: CheckCredentialUseCase = CheckCredentialUseCaseV1()) {
//        self.checkCredential = checkCredential
//    }
    
//    func handleLogin() async {
//        DispatchQueue.main.async { [weak self] in
//            self?.login = .loading
//        }
//
//        let result = await checkCredential.execute(credential: LoginRequest(email: phone, password: password))
//
//        switch result {
//        case .success(let success):
//            DispatchQueue.main.async { [weak self] in
//                self?.login = .success(value: success)
//                self?.isLoginSuccess = true
//            }
//        case .failure(let failure):
//            DispatchQueue.main.async { [weak self] in
//                self?.login = .error(failure)
//            }
//        }
//    }
}
