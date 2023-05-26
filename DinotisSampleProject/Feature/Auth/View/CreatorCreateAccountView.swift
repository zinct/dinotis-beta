//
//  CreatorCreateAccountVIew.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 18/05/23.
//

import SwiftUI
import DinotisDesignSystem

struct CreatorCreateAccountView: View {
    @ObservedObject var viewModel: CreatorCreateAccountViewModel = CreatorCreateAccountViewModel()
    
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
                        .foregroundColor(.primaryBlack)
                        .padding(.bottom, 20)
                    
                    Group {
                        HStack {
                            Text("Nama")
                                .font(.robotoRegular(size: 12))
                                .foregroundColor(.primaryBlack)
                            Spacer()
                        }
                        
                        DinotisPrimaryTextField("Masukan nama", text: $viewModel.name)
                            .padding(.bottom, 10)
                    }
                    
                    Group {
                        HStack {
                            Text("Kata Sandi")
                                .font(.robotoRegular(size: 12))
                                .foregroundColor(.primaryBlack)
                            Spacer()
                        }
                        
                        DinotisPrimaryTextField(LocalizableText.passwordPlaceholder, text: $viewModel.password, secured: !viewModel.isPasswordShow, suffix: {
                            Button(action: {
                                viewModel.isPasswordShow.toggle()
                            }) {
                                Image(systemName: !viewModel.isPasswordShow ? "eye.fill" : "eye.slash.fill")
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
                        
                        DinotisPrimaryTextField("Ulangi kata sandi", text: $viewModel.passwordAgain, secured: !viewModel.isPasswordAgainShow, suffix: {
                            Button(action: {
                                viewModel.isPasswordAgainShow.toggle()
                            }) {
                                Image(systemName: !viewModel.isPasswordAgainShow ? "eye.fill" : "eye.slash.fill")
                                    .foregroundColor(Color.secondary)
                            }
                        })
                        .padding(.bottom, 10)
                    }
                }
                
                Spacer()
                
                DinotisPrimaryButton(text: "Simpan", type: .adaptiveScreen, textColor: .white, bgColor: .primaryPurple) {
                    withAnimation {
                        viewModel.isSuccessModalShow = true
                    }
                }
                .disabled(viewModel.name == "" || viewModel.password == "" || viewModel.passwordAgain == "")
            }
            .padding(.horizontal, 24)
            .sheet(isPresented: $viewModel.isCountriesShow) {
                DinotisCountryPickerSheet(isSheetOpen: $viewModel.isCountriesShow, selectedCountry: $viewModel.selectedCountry)
                    .presentationDetents([.medium, .large])
                    .presentationCornerRadius(28)
            }
            .navigationBarBackButtonHidden()
            
            DinotisAlertModal(title: "Data Diri Berhasil Disimpan", bodyText: "Terima kasih telah melengkapi data diri kamu", isModalOpen: $viewModel.isSuccessModalShow)
        }
    }
}

struct CreatorCreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorCreateAccountView()
    }
}
