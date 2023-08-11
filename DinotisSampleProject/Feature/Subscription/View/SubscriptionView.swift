//
//  SubscriptionView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 04/08/23.
//

import SwiftUI
import DinotisDesignSystem

struct SubscriptionView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        
            VStack(alignment: .leading) {
                DinotisSecondaryTopBar(title: "D’Pass DINOTIS")
                    .padding(.horizontal, 24)
                
                ScrollView {
                    VStack {
                        HStack {
                            Text("DINOTIS Premium")
                                .font(.robotoMedium(size: 12))
                            
                            Spacer()
                        }
                        .padding(.bottom, 2)
                        
                        HStack {
                            Text("dapatkan 1 Bulan Premium dengan harga murah untuk memperoleh pengalaman terbaik")
                                .font(.robotoRegular(size: 12))
                            
                            Spacer()
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("Saat ini kamu menggunakan Dinotis Free Tingkatkan Kualitas untuk memperoleh pengalaman lebih baik")
                                .font(.robotoRegular(size: 12))
                                .padding(.trailing, 10)
                            
                            Image(systemName: "info.circle")
                                .foregroundColor(Color.darkPurple)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        .background(Color.secondaryPurple)
                        .cornerRadius(12)
                        .padding(.bottom, 37)
                        
                        HStack {
                            Text("Pilih Premium Anda")
                                .font(.robotoBold(size: 12))
                            
                            Spacer()
                        }
                        .padding(.bottom, 10)
                        
                        SubscriptionCard()
                        
                        SubscriptionCard()
                        
                        SubscriptionCard()
                        
                        
                    }
                    .padding(.horizontal, 24)
                   
                }
                
                
                Spacer()
                
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
    }
}

struct SubscriptionCard: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.pink, .indigo], startPoint: .bottomTrailing, endPoint: .topLeading)
            VStack() {
                HStack {
                    Text("Gold D’Pass")
                        .font(.robotoBold(size: 20))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("Mulai Rp 50,500")
                        .font(.robotoBold(size: 14))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 5)
                
                HStack {
                    Spacer()
                    
                    Text("Untuk 1 Tahun")
                        .font(.robotoRegular(size: 12))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 25)
                
                Text("Mendapatkan Free Akses kebeberapa Ratecard yang dipilih, Mendapatkan Materi yang diberikan mentor")
                    .font(.robotoMedium(size: 12))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 33)
                    .padding(.bottom, 5)
                
                Text("Lihat Bundling")
                    .font(.robotoMedium(size: 12))
                    .foregroundColor(.primaryPurple)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(.white)
                    .cornerRadius(18)
                    .padding(.bottom, 5)
                
                Text("Syarat dan ketentuan berlakur")
                    .font(.robotoRegular(size: 12))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 33)
                
            }
            .padding(20)
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray)
        .cornerRadius(8)
        .padding(.bottom, 20)
    }
}
