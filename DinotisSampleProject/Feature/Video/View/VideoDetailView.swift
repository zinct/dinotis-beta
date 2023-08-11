//
//  VideoDetailView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 06/08/23.
//

import SwiftUI
import DinotisDesignSystem

struct VideoDetailView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        
            VStack(alignment: .leading) {
                DinotisSecondaryTopBar(title: "Detail Video Call")
                    .padding(.horizontal, 24)
                
                ScrollView {
                    VStack {
                        VStack(alignment: .center) {
                            Text("Status Jadwal Sesi Kamu")
                                .font(.robotoBold(size: 12))
                                .padding(.trailing, 1)
                                .padding(.bottom, 15)
                            
                            ScrollView(.horizontal) {
                                HStack(alignment: .top, spacing: 20) {
                                    SessionStatus(label: "Pembayaran selesai", date: "26/03/2022 21:01", isActive: true)
                                    
                                    SessionStatus(label: "Menunggu Konfirmasi Kreator", date: "26/03/2022 21:01", isActive: true)
                                    
                                    SessionStatus(label: "Menentukan Waktu Sesi", date: "26/03/2022 21:01", isActive: true)
                                    
                                    SessionStatus(label: "Sesi dimulai", date: "26/03/2022 21:01", isActive: true)
                                    
                                    SessionStatus(label: "Sesi telah selesai", date: "26/03/2022 21:01", isActive: true)
                                }
                                .background {
                                    DottedLine()
                                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                       .frame(height: 1)
                                       .offset(y: -28)
                                       .padding(.horizontal, 30)
                                       .foregroundColor(.primaryPurple)
                                }
                            }
                            
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.bottom, 15)
                        
                        HStack {
                            Text("Aturan Video Call")
                                .font(.robotoRegular(size: 14))
                                .foregroundColor(.primaryPurple)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.primaryPurple)
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 14)
                        .background(Color.secondaryPurple)
                        .cornerRadius(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.primaryPurple)
                        }
                        .padding(.bottom, 15)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Image.imgAvatarProfile
                                    .resizable()
                                    .frame(width: 38, height: 38)
                                    .padding(.trailing, 10)
                                
                                Text("Conor McGregor")
                                    .font(.robotoBold(size: 14))
                                
                                Image.icVerifiedCommon
                                
                                Spacer()
                            }
                            .padding(.bottom, 15)
                            
                            Text("Ngobrol bareng aku yuk!")
                                .font(.robotoBold(size: 16))
                                .padding(.bottom, 1)
                            
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et, tellus porta commodo at sed.")
                                .font(.robotoRegular(size: 12))
                            
                            HStack {
                                Image.imgCalendarHome
                                
                                Text("Selasa, 27 Juli 2020")
                                    .font(.robotoRegular(size: 12))
                            }
                            .padding(.bottom, 13)
                            
                            HStack {
                                Image.imgClockCommon
                                
                                Text("13.00 - 14.00 WIB")
                                    .font(.robotoRegular(size: 12))
                            }
                            .padding(.bottom, 13)
                            
                            HStack {
                                Image.imgParticipantCommon
                                    
                                Text("1 / 1 Peserta")
                                    .font(.robotoRegular(size: 12))
                                
                                Text("⚡️ Sesi Privat")
                                    .font(.robotoRegular(size: 12))
                            }
                            .padding(.bottom, 13)
                            
                            Divider()
                            
                            Text("Peserta Sesi Privat Call")
                                .font(.robotoRegular(size: 12))
                                .padding(.top, 10)
                            
                            HStack {
                                Image.imgGirlAgenda
                                    .resizable()
                                    .frame(width: 38, height: 38)
                                    .padding(.trailing, 10)
                                
                                Text("Adinda Marala")
                                    .font(.robotoBold(size: 14))
                                
                                Spacer()
                                
                                Text("Saya")
                                    .font(.robotoRegular(size: 12))
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 8)
                                    .background(Color.secondaryPurple)
                                    .cornerRadius(.infinity)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: .infinity)
                                                        .stroke(Color.primaryPurple)
                                    }
                            }
                            .padding(.bottom, 15)
                            
                            Group {
                                DinotisPrimaryButton(text: "Download Materi", type: .adaptiveScreen, textColor: .white, bgColor: .primaryPurple) {
                                    
                                }
                                .frame(height: 35)
                                .cornerRadius(.infinity)
                                
                                DinotisPrimaryButton(text: "Sesi Selesai", type: .adaptiveScreen, textColor: .white, bgColor: .primaryPurple) {
                                    
                                }
                                .frame(height: 35)
                                .cornerRadius(.infinity)
                            }
                            .padding(.bottom, 10)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                        .background(Color.white)
                        .cornerRadius(12)
                        .padding(.bottom, 15)
                        
                        HStack {
                            Image.imgWhatsappCommon
                            
                            Text("Butuh bantuan?")
                                .font(.robotoRegular(size: 14))
                            
                            Text("Hubungi kami")
                                .font(.robotoBold(size: 14))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .frame(width: 24, height: 24)
                                .padding(3)
                                .background(Color.primaryPurple)
                                .foregroundColor(.white)
                                .cornerRadius(.infinity)
                            
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 14)
                        .background(Color.white)
                        .cornerRadius(12)
                        .padding(.bottom, 15)
                        
                        
                        
                    }
                    .padding(.horizontal, 24)
                   
                }
                
                VStack {
                    VStack {
                        DinotisPrimaryButton(text: "Beri Ulasan", type: .adaptiveScreen, textColor: .white, bgColor: Color.primaryPurple) {
                            
                        }
                        .padding(.vertical, 15)
                        .padding(.horizontal, 20)
                    }
                    .background(.white)
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct DottedLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailView()
    }
}

struct SessionStatus: View {
    public let label: String
    public let date: String
    public let isActive: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "checkmark")
                .frame(width: 35, height: 35)
                .foregroundColor(.white)
                .background(isActive ? Color.primaryPurple : Color.secondaryPurple)
                .cornerRadius(.infinity)
            
            Text(label)
                .foregroundColor(Color.primaryPurple)
                .font(.robotoMedium(size: 10))
                .padding(.bottom, 2)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .frame(height: 30)
            
            Text(date)
                .foregroundColor(Color.black)
                .font(.robotoMedium(size: 10))
                .multilineTextAlignment(.center)
                .isHidden(!isActive, remove: !isActive)
        }
        .frame(maxWidth: 90)
    }
}
