//
//  CreatorCreateAccountVIew.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 18/05/23.
//

import SwiftUI
import DinotisDesignSystem

struct CreatorCreateAccountView: View {
    @State private var name = ""
    @State private var password = ""
    @State private var passwordAgain = ""
    
    @State private var isCountriesShow = false
    @State private var isSuccessModalShow = false
    @State private var isPasswordShow = false
    @State private var isPasswordAgainShow = false

    @State private var selectedCountry: Country = Country.getAll()[0]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                DinotisIntroTopBar()
                
                ScrollView {
                    Text("Lengkapi Data Diri")
                        .font(.robotoBold(size: 28))
                        .foregroundColor(Color(hex: "#25282B"))
                        .padding(.bottom, 20)
                    
                    Group {
                        HStack {
                            Text("Nama")
                                .font(.robotoRegular(size: 12))
                                .foregroundColor(Color(hex: "#25282B"))
                            Spacer()
                        }
                        
                        DinotisPrimaryTextField("Masukan nama", text: $name)
                            .padding(.bottom, 10)
                    }
                    
                    Group {
                        HStack {
                            Text("Kata Sandi")
                                .font(.robotoRegular(size: 12))
                                .foregroundColor(Color(hex: "#25282B"))
                            Spacer()
                        }
                        
                        DinotisPrimaryTextField("Masukan kata sandi", text: $password, secured: !isPasswordShow, suffix: {
                            Button(action: {
                                isPasswordShow.toggle()
                            }) {
                                Image(systemName: !isPasswordShow ? "eye.fill" : "eye.slash.fill")
                                    .foregroundColor(Color.secondary)
                            }
                        })
                        .padding(.bottom, 10)
                    }
                    
                    Group {
                        HStack {
                            Text("Ulangi Kata Sandi")
                                .font(.robotoRegular(size: 12))
                                .foregroundColor(Color(hex: "#25282B"))
                            Spacer()
                        }
                        
                        DinotisPrimaryTextField("Ulangi kata sandi", text: $passwordAgain, secured: !isPasswordAgainShow, suffix: {
                            Button(action: {
                                isPasswordAgainShow.toggle()
                            }) {
                                Image(systemName: !isPasswordAgainShow ? "eye.fill" : "eye.slash.fill")
                                    .foregroundColor(Color.secondary)
                            }
                        })
                        .padding(.bottom, 10)
                    }
                }
                
                Spacer()
                
                DinotisPrimaryButton(text: "Simpan", type: .adaptiveScreen, textColor: .white, bgColor: .primaryPurple) {
                    withAnimation {
                        isSuccessModalShow = true
                    }
                }
                .disabled(name == "" || password == "" || passwordAgain == "")
            }
            .padding(.horizontal, 24)
            .sheet(isPresented: $isCountriesShow) {
                DinotisCountryPickerSheet(isSheetOpen: $isCountriesShow, selectedCountry: $selectedCountry)
                    .presentationDetents([.medium, .large])
                    .presentationCornerRadius(28)
            }
            .navigationBarBackButtonHidden()
            
            DinotisAlertModal(title: "Data Diri Berhasil Disimpan", bodyText: "Terima kasih telah melengkapi data diri kamu", isModalOpen: $isSuccessModalShow)
        }
    }
}

struct CreatorCreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorCreateAccountView()
    }
}
