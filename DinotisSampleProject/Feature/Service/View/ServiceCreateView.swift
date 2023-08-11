//
//  ServiceCreateView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 11/08/23.
//

import SwiftUI
import DinotisDesignSystem

struct ServiceCreateView: View {
    @ObservedObject var viewModel = ServiceCreateViewModel()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            VStack {
                ScrollView {
                    VStack {
                        DinotisSecondaryTopBar(title: "Booking Layanan")
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Image.imgAvatarAgenda
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .padding(.trailing, 10)
                                
                                
                                Text("Adinda Marala")
                                    .font(.robotoBold(size: 14))
                                
                                Image.icVerifiedCommon
                            }
                            .padding(.bottom, 10)
                            
                            Text("Cara memahami emosional yang tidak stabil dalam menghadapi masalah di dunia ini")
                                .font(.robotoBold(size: 14))
                                .padding(.bottom, 5)
                            
                            Text("Kali ini, kita bakal belajar tentang gimana caranya lebih siap dengan dunia kerja. Webinar ini cocok")
                                .font(.robotoRegular(size: 12))
                                .padding(.bottom, 20)
                            
                            HStack {
                                Image.imgCalendarHome
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                
                                Text("Kamis, 22 Juni 2023")
                                    .font(.robotoRegular(size: 12))
                            }
                            
                            HStack {
                                Image.imgClockCommon
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                
                                Text("60 Menit")
                                    .font(.robotoRegular(size: 12))
                            }
                            
                            HStack {
                                Image.icCoinProfile
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                
                                Text("Rp300.000")
                                    .font(.robotoRegular(size: 12))
                            }
                            
                            HStack {
                                Image.imgVideocallCommon
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                
                                Text("Private Video Call")
                                    .font(.robotoRegular(size: 12))
                            }
                            
                            Divider()
                                .padding(.vertical, 15)
                            
                            HStack {
                                Text("Harga")
                                    .font(.robotoRegular(size: 12))
                                
                                Spacer()
                                
                                Text("Rp300.000")
                                    .font(.robotoBold(size: 12))
                            }
                        }
                        .padding(.vertical, 15)
                        .padding(.horizontal, 20)
                        .background(Color.white)
                        .cornerRadius(12)
                        .padding(.bottom, 10)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Image.imgFormEditCommon
                                    .padding(.trailing, 10)
                                
                                Text("Pesan")
                                    .font(.robotoRegular(size: 12))
                            }
                            
                            VStack(alignment: .leading) {
                                HStack(alignment: .top) {
                                    
                                    TextField("Masukkan hari & jam Private Call yang kamu harapkan...", text: $viewModel.message, axis: .vertical)
                                        .lineLimit(5, reservesSpace: true)
                                        .font(.robotoRegular(size: 12))
                                    
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .inset(by: 0.5)
                                        .stroke(Color(hex: "#CACCCF") ?? Color.secondary, lineWidth: 0.5)
                                )
                                .padding(.bottom, 10)
                                
                                DatePicker(
                                        
                                        selection: $viewModel.date,
                                        displayedComponents: [.date]
                                ) {
                                    HStack {
                                        Image.imgCalendarHome
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                            .padding(.trailing, 10)
                                        
                                        Text("Jadwal")
                                            .font(.robotoRegular(size: 12))
                                    }
                                }
                                
                                Spacer()
                            }
                        }
                        .padding(.vertical, 15)
                        .padding(.horizontal, 20)
                        .background(Color.white)
                        .cornerRadius(12)
                    }
                    .padding(.horizontal, 20)
                }
                
                
                
                Spacer()
                
                VStack(alignment: .leading) {
                    HStack {
                        DinotisPrimaryButton(text: "Lanjut", type: .adaptiveScreen, textColor: .white, bgColor: .primaryPurple) {
                            
                        }
                    }
                }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.white)
            }
            .navigationBarBackButtonHidden()
            
        }
    }
}

struct ServiceCreateView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceCreateView()
    }
}
