//
//  LoginView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 14/05/23.
//

import SwiftUI
import DinotisDesignSystem

struct CreatorAuthView: View {
    
    @ObservedObject var viewModel: AuthViewModel = AuthViewModel()
    
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
                        .foregroundColor(Color(hex: "#25282B"))
                    
                    Text(viewModel.state == .login ? "Silahkan masukan nomor handphone & kata sandi akun anda yang telah terdaftar untuk masuk ke aplikasi" : "Masukan nomor handphone yang valid untuk mendapatkan kode OTP")
                        .font(.robotoLight(size: 12))
                        .foregroundColor(Color(hex: "#52575C"))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 25)
                    
                    DinotisPrimaryTextField(
                        "Masukan nomor handphone",
                        text: $viewModel.phone,
                        validator: {
                            if viewModel.isPhoneError {
                                return "*Nomor telepon yang anda masukan belum terdaftar"
                            }
                        
                        return nil
                        }, prefix: {
                            Button(action: {
                                viewModel.isCountriesShow = true
                            }) {
                                HStack {
                                    Text(viewModel.selectedCountry.field)
                                        .font(.robotoLight(size: 12))
                                        .foregroundColor(Color(hex: "#25282B"))
                                    
                                    Image.icDropdownAuth
                                        .padding(.trailing, -3)
                                    
                                    Divider()
                                }
                            }
                        })
                    .padding(.bottom, 5)
                    
                    DinotisPrimaryTextField(
                        "Masukan kata sandi",
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
                            Text("Lupa Kata Sandi")
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
                    .foregroundColor(Color(hex: "#A0A4A8"))
                    .padding(.bottom, 10)
                    
                    HStack {
                        Text(viewModel.state == .login ? "Belum punya akun?" : "sudah punya akun?")
                            .font(.robotoRegular(size: 12))
                            .foregroundColor(Color(hex: "#52575C"))
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
                            Text(viewModel.state == .login ? "Daftar di sini" : "Masuk di sini")
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
                        viewModel.handleLogin()
                    }
                case .register:
                    NavigationLink(destination: CreatorCreateAccountView(), isActive: $viewModel.otpView) {EmptyView()}
                    
                    DinotisPrimaryButton(text: "Kirim OTP", type: .adaptiveScreen, textColor: .white, bgColor: .primaryPurple, disabled: viewModel.phone == "") {
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
