//
//  LoginView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 14/05/23.
//

import SwiftUI
import DinotisDesignSystem

struct CreatorAuthView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack {
                DinotisIntroTopBar()
                
                ScrollView {
                    Text(viewModel.state == .login ? LocalizableText.loginTitle : LocalizableText.registerTitle)
                        .font(.robotoBold(size: 28))
                        .foregroundColor(.primaryBlack)
                    
                    Text(viewModel.state == .login ? LocalizableText.loginBody : LocalizableText.registerBody)
                        .font(.robotoLight(size: 12))
                        .foregroundColor(.secondaryBlack)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 25)
                    
                    DinotisPrimaryTextField(
                        LocalizableText.phonePlaceholder,
                        text: $viewModel.phone,
                        validator: {
                            switch viewModel.login {
                            case .error(_):
                                return "*Email Atau Password salah!"
                            default:
                                return nil
                            }
                        })
                    .padding(.bottom, 5)
                    
                    DinotisPrimaryTextField(
                        LocalizableText.passwordPlaceholder,
                        text: $viewModel.password,
                        secured: !viewModel.isPasswordShow,
                        validator: {
                            if viewModel.isPasswordError {
                                return "*Kata sandi yang anda masukan salah"
                            }
                            
                            return nil
                        }, suffix: {
                            Button(action: {
                                viewModel.isPasswordShow.toggle()
                            }) {
                                Image(systemName: !viewModel.isPasswordShow ? "eye.fill" : "eye.slash.fill")
                                    .foregroundColor(Color.secondary)
                            }
                    })
                    .padding(.bottom, 10)
                    .isHidden(viewModel.state == .register, remove: viewModel.state == .register)
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Text(LocalizableText.forgotPassword)
                                .font(.robotoBold(size: 12))
                                .foregroundColor(Color.primaryPurple)
                                .underline()
                        }
                    }
                    .padding(.bottom, 13)
                    .isHidden(viewModel.state == .register, remove: viewModel.state == .register)
                    
                    Group {
                        Text("Ketika masuk, Anda menyetujui ") +

                        Text("Persyaratan Layanan ")
                            .foregroundColor(.primaryPurple) +
                        
                        Text("Dinotis & mengakui bahwa Pemberitahuan Privasi kami berlaku.")
                    }
                    .font(.robotoRegular(size: 10))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primaryGrey)
                    .padding(.bottom, 10)
                    
                    HStack {
                        Text(viewModel.state == .login ? LocalizableText.dontHaveAccount : LocalizableText.alreadyGaveAccount)
                            .font(.robotoRegular(size: 12))
                            .foregroundColor(.primaryGrey)
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            withAnimation {
                                if viewModel.state == .login {
                                    viewModel.state = .register
                                } else {
                                    viewModel.state = .login
                                }
                            }
                        }) {
                            Text(viewModel.state == .login ? LocalizableText.registerHere : LocalizableText.loginHere)
                                .font(.robotoBold(size: 12))
                                .foregroundColor(Color.primaryPurple)
                                .multilineTextAlignment(.center)
                                .underline()
                        }
                    }
                }
                
                Spacer()
                
                switch viewModel.state {
                case .login:
                    DinotisPrimaryButton(text: "Masuk", type: .adaptiveScreen, textColor: .white, bgColor: .primaryPurple, disabled: viewModel.phone == "" || viewModel.password == "") {
                        Task {
                            await viewModel.handleLogin()
                        }
                    }
                case .register:
                    NavigationLink(destination: OtpView(), isActive: $viewModel.otpView) {EmptyView()}
                    
                    DinotisPrimaryButton(text: LocalizableText.sendOtp, type: .adaptiveScreen, textColor: .white, bgColor: .primaryPurple, disabled: viewModel.phone == "") {
                        viewModel.otpView = true
                    }
                }
            }
            .padding(.horizontal, 24)
            .sheet(isPresented: $viewModel.isCountriesShow) {
                DinotisCountryPickerSheet(isSheetOpen: $viewModel.isCountriesShow, selectedCountry: $viewModel.selectedCountry)
                    .presentationDetents([.medium, .large])
                    .presentationCornerRadius(28)
            }
            .navigationBarBackButtonHidden()
            
            DinotisAlertModal(title: "Berhasil!", bodyText: "Selamat anda berhasil login", isModalOpen: $viewModel.isLoginSuccess)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorAuthView()
    }
}
