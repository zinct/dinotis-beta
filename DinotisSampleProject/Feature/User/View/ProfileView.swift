//
//  ProfileView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 08/06/23.
//

import DinotisDesignSystem

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                HStack(spacing: 24) {
                    Image.imgAvatarProfile
                    VStack {
                        Text("Elon Musk")
                            .font(.robotoBold(size: 20))
                        
                        Text("081395749557")
                            .font(.robotoRegular(size: 14))
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 20)
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Coin Kamu")
                            .font(.robotoBold(size: 14))
                        
                        HStack {
                            Image.icCoinProfile
                            
                            Text("120.000")
                                .font(.robotoBold(size: 20))
                                .foregroundColor(.primaryPurple)
                        }
                    }
                    
                    Spacer()
                    
                    Image.icRefreshProfile
                        .frame(width: 32, height: 32)
                        .background(Color.primaryPurple)
                        .cornerRadius(16)
                    
                    DinotisPrimaryButton(text: "Tambah Coin", type: .mini, textColor: .white, bgColor: Color.primaryPurple) {
                        
                    }
                    
                }
                .padding(24)
                .background(Color.white)
                .cornerRadius(24)
                .padding(.bottom, 28)
                
                Text("Pengaturan Akun")
                    .font(.robotoBold(size: 14))
                    .padding(.bottom, 17)
    
                ScrollView {
                    NavigationLink(destination: ContactView()) {
                        VStack(alignment: .leading) {
                            HStack {
                                Image.imgOperatorProfile
                                    .padding(.trailing, 18)
                                
                                Text("Kontak")
                                    .font(.robotoLight(size: 14))
                                    .foregroundColor(.primaryBlack)
                            }
                            
                            Divider()
                        }
                    }
                    .padding(.bottom, 17)
                    
                    NavigationLink(destination: EditProfileView()) {
                        VStack(alignment: .leading) {
                            HStack {
                                Image.imgUserProfile
                                    .padding(.trailing, 18)
                                
                                Text("Edit Profil")
                                    .font(.robotoLight(size: 14))
                                    .foregroundColor(.primaryBlack)
                            }
                            
                            Divider()
                        }
                    }
                    .padding(.bottom, 17)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image.imgLoveProfile
                                .padding(.trailing, 18)
                            
                            Text("Kontak")
                                .font(.robotoLight(size: 14))
                        }
                        
                        Divider()
                    }
                    .padding(.bottom, 17)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image.imgLockProfile
                                .padding(.trailing, 18)
                            
                            Text("Ubah Kata Sandi")
                                .font(.robotoLight(size: 14))
                        }
                        
                        Divider()
                    }
                    .padding(.bottom, 17)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image.imgLogoutProfile
                                .padding(.trailing, 18)
                            
                            Text("Keluar")
                                .font(.robotoLight(size: 14))
                        }
                        
                        Divider()
                    }
                    .padding(.bottom, 17)
                    
                    Button {
                        viewModel.isDeleteAccountModalOpen = true
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Image.imgTrashProfile
                                    .padding(.trailing, 18)
                                
                                Text("Hapus Akun")
                                    .font(.robotoLight(size: 14))
                                    .foregroundColor(.primaryRed)
                            }
                            
                            Divider()
                        }
                        .padding(.bottom, 17)
                    }

                    
                }
                

                    
                
                Spacer()
                
            }
            .padding(.horizontal, 24)
            
            DinotisConfirmationModal(title: "Peringatan!", bodyText: "Apakah anda yakin untuk menghapus akun ini?", isModalOpen: $viewModel.isDeleteAccountModalOpen) {
                Task {
                    await viewModel.handleDeleteAccount()
                    authViewModel.isLoginSuccess = false
                }
            }
                .ignoresSafeArea()
        }
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
    }
}
