//
//  LoginView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 14/05/23.
//

import SwiftUI
import DinotisDesignSystem

enum AuthViewState {
    case login, register
}


let phoneDesired = "81395749557"
let passwordDesired = "admin"

struct CreatorAuthView: View {
    @State private var phone = ""
    @State private var password = ""
    @State private var state = AuthViewState.login
    
    @State private var isPhoneError = false
    @State private var isPasswordError = false
    @State private var isCountriesShow = false
    @State private var isPasswordShow = false
    @State private var otpView = false
    @State private var isLoginSuccess = false
    
    @State private var selectedCountry = Country.getAll()[0]
    
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
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack {
                DinotisIntroTopBar()
                
                ScrollView {
                    Text(state == .login ? "Masuk Akun" : "Daftar Akun")
                        .font(.robotoBold(size: 28))
                        .foregroundColor(Color(hex: "#25282B"))
                    
                    Text(state == .login ? "Silahkan masukan nomor handphone & kata sandi akun anda yang telah terdaftar untuk masuk ke aplikasi" : "Masukan nomor handphone yang valid untuk mendapatkan kode OTP")
                        .font(.robotoLight(size: 12))
                        .foregroundColor(Color(hex: "#52575C"))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 25)
                    
                    DinotisPrimaryTextField("Masukan nomor handphone", text: $phone, validator: {
                        if isPhoneError {
                            return "*Nomor telepon yang anda masukan belum terdaftar"
                        }
                        
                        return nil
                    }, prefix: {
                        Button(action: {
                            isCountriesShow = true
                        }) {
                            HStack {
                                Text(selectedCountry.field)
                                    .font(.robotoLight(size: 12))
                                    .foregroundColor(Color(hex: "#25282B"))
                                
                                Image.icDropdownAuth
                                    .padding(.trailing, -3)
                                
                                Divider()
                            }
                        }
                    })
                    .padding(.bottom, 5)
                    
                    DinotisPrimaryTextField("Masukan kata sandi", text: $password, secured: !isPasswordShow, validator: {
                        if isPasswordError {
                            return "*Kata sandi yang anda masukan salah"
                        }
                        
                        return nil
                        }, suffix: {
                        Button(action: {
                            isPasswordShow.toggle()
                        }) {
                            Image(systemName: !isPasswordShow ? "eye.fill" : "eye.slash.fill")
                                .foregroundColor(Color.secondary)
                        }
                    })
                    .padding(.bottom, 10)
                    .isHidden(state == .register, remove: state == .register)
                    
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
                    .isHidden(state == .register, remove: state == .register)
                    
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
                        Text(state == .login ? "Belum punya akun?" : "sudah punya akun?")
                            .font(.robotoRegular(size: 12))
                            .foregroundColor(Color(hex: "#52575C"))
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            withAnimation {
                                if state == .login {
                                    state = .register
                                } else {
                                    state = .login
                                }
                            }
                        }) {
                            Text(state == .login ? "Daftar di sini" : "Masuk di sini")
                                .font(.robotoBold(size: 12))
                                .foregroundColor(Color.primaryPurple)
                                .multilineTextAlignment(.center)
                                .underline()
                        }
                    }
                }
                
                Spacer()
                
                switch state {
                case .login:
                    DinotisPrimaryButton(text: "Masuk", type: .adaptiveScreen, textColor: .white, bgColor: .primaryPurple, disabled: phone == "" || password == "") {
                        handleLogin()
                    }
                case .register:
                    NavigationLink(destination: CreatorCreateAccountView(), isActive: $otpView) {EmptyView()}
                    
                    DinotisPrimaryButton(text: "Kirim OTP", type: .adaptiveScreen, textColor: .white, bgColor: .primaryPurple, disabled: phone == "") {
                        otpView = true
                    }
                }
            }
            .padding(.horizontal, 24)
            .sheet(isPresented: $isCountriesShow) {
                DinotisCountryPickerSheet(isSheetOpen: $isCountriesShow, selectedCountry: $selectedCountry)
                    .presentationDetents([.medium, .large])
                    .presentationCornerRadius(28)
            }
            .navigationBarBackButtonHidden()
            
            DinotisAlertModal(title: "Berhasil!", bodyText: "Selamat anda berhasil login", isModalOpen: $isLoginSuccess)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorAuthView()
    }
}
