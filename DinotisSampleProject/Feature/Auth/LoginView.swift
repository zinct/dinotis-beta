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

let whatsappNumber = "https://wa.me/6281395749557"
let phoneDesired = "81395749557"
let passwordDesired = "admin"

struct LoginView: View {
    
    @State private var phone = ""
    @State private var password = ""
    @State private var state = AuthViewState.login
    
    @State private var isPhoneError = false
    @State private var isPasswordError = false
    @State private var isCountriesShow = false
    @State private var isPasswordShow = false
    
    func handleHelpIndicator() {
        if let url = URL(string: whatsappNumber),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
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
        
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                HStack {
                    Image.icBackHeader
                        .frame(width: 37, height: 36)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(color: .shadowBlack.opacity(0.06), radius: 4)
                    
                    Spacer()
                    
                    Image.imgLogoCommon
                    
                    Spacer()
                    
                    Button(action: handleHelpIndicator) {
                        Image.icHelpHeader
                    }
                }
                .padding(.bottom, 24)
                
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
                                Text("🇮🇩 +62")
                                    .font(.robotoLight(size: 12))
                                    .foregroundColor(Color(hex: "#25282B"))
                                
                                Image.icDropdownAuth
                                    .padding(.trailing, -3)
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
                    NavigationLink(destination: RoleView()) {
                        DinotisPrimaryButton(text: "Kirim OTP", type: .adaptiveScreen, textColor: .white, bgColor: .primaryPurple, disabled: phone == "" || password == "") {
                        }
                    }
                }
            }
            .padding(.horizontal, 24)
            .sheet(isPresented: $isCountriesShow) {
                VStack {
                    HStack {
                        Text("Pilih Negara")
                            .font(.robotoBold(size: 14))
                            .foregroundColor(Color(hex: "#413F48"))
                        
                        Spacer()
                        
                        Image(systemName: "xmark")
                            .foregroundColor(Color(hex: "#413F48"))
                    }
                    
                    DinotisPrimaryTextField("Cari negara", text: .constant(""), prefix: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(hex: "#3A3A3A"))
                    })
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Text("Reset Default")
                                .font(.robotoBold(size: 12))
                                .foregroundColor(Color.primaryPurple)
                                .underline()
                        }
                    }
                    .padding(.bottom, 13)
                    
                    ScrollView {
                        HStack {
                            Text("🇺🇸 Amerika")
                                .font(.robotoLight(size: 14))
                                .foregroundColor(Color(hex: "#52575C"))
                            Spacer()
                            Text("+1")
                                .font(.robotoBold(size: 14))
                                .foregroundColor(Color(hex: "#52575C"))
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 25)
                
                .presentationDetents([.medium, .large])
                .presentationCornerRadius(28)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
