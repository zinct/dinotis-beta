//
//  EditProfileView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 08/06/23.
//

import SwiftUI
import DinotisDesignSystem

struct EditProfileView: View {
    @ObservedObject var viewModel: EditProfileViewModel = EditProfileViewModel()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        
            VStack(alignment: .leading) {
                DinotisSecondaryTopBar(title: "Edit Profile")
                    
                
                ScrollView {
                    Group {
                        ZStack {
                            Image.imgAvatarEditprofile
                                .resizable()
                                .scaledToFit()
                                .frame(width: 72, height: 72)
                            
                            Image(systemName: "pencil")
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                                .background(Color.primaryPurple)
                                .cornerRadius(20)
                                .padding(.top, 40)
                                .padding(.leading, 55)
                        }
                    }
                    .padding(.bottom, 10)
                    
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
                            Text("Email")
                                .font(.robotoRegular(size: 12))
                                .foregroundColor(.primaryBlack)
                            Spacer()
                        }
                        
                        DinotisPrimaryTextField(LocalizableText.phonePlaceholder, text: $viewModel.email)
                            .padding(.bottom, 10)
                    }
                }
                
                Spacer()
                
                DinotisPrimaryButton(text: "Ubah Sekarang", type: .adaptiveScreen, textColor: .white, bgColor: .primaryPurple) {
                    
                }
                
                .navigationBarBackButtonHidden(true)
            }
            .padding(.horizontal, 24)
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
