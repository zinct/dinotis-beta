//
//  HomeView.swift
//  DinotisSampleProject
//
//  Created by Irham Naufal on 14/05/23.
//

import SwiftUI
import DinotisDesignSystem

struct HomeView: View {
    @State private var search: String = ""
    @State private var tabIndex: Int = 1
    
    @StateObject var authViewModel: AuthViewModel = AuthViewModel()
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.red)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            TabView(selection: $tabIndex) {
                AgendaView()
                    .tag(0)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Group {
                            VStack {
                                DinotisPrimaryTopBar()
                                    .padding(.bottom, 24)
                            }
                            .padding(.bottom, 20)
                            .padding(.horizontal, 24)
                            
                            VStack {
                                DinotisPrimaryTextField(
                                    "Cari sesi, kreator, atau management disini...",
                                    text: $search,
                                    prefix: {
                                        Button(action: {

                                        }) {
                                            Image(systemName: "magnifyingglass")
                                                .foregroundColor(Color.secondary)
                                        }
                                    }
                                )

                                HStack {
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("Saldo saya")
                                            .font(.robotoRegular(size: 12))

                                        HStack {
                                            Image.imgWalletHome

                                            Text("Rp 120.000")
                                                .font(.robotoBold(size: 12))
                                                .foregroundColor(.primary)

                                        }
                                        .padding(.top, 10)
                                    }


                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("Koin Saya")
                                            .font(.robotoRegular(size: 12))

                                        HStack {
                                            Image.imgCoinGoldHome

                                            Text("0 Pts")
                                                .font(.robotoBold(size: 12))
                                                .foregroundColor(.primary)

                                        }
                                        .padding(.top, 10)
                                    }
                                    .padding(.leading, 90)

                                    Spacer()

                                }
                                .frame(maxWidth: .infinity, maxHeight: 40)
                                    .padding(24)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .padding(.top, 25)

                                VStack {
                                    HStack {
                                        Text("Saat ini kamu berlangganan Reguler Pass")
                                            .font(.robotoBold(size: 12))
                                            .foregroundColor(.white)
                                            .padding(.bottom, 12)

                                        Spacer()
                                    }
                                    .padding(.top, 20)

                                    NavigationLink {
                                        SubscriptionView()
                                    } label: {
                                        HStack {
                                            Spacer()

                                            Text("Upgrade ke Premium Sekarang")
                                                .font(.robotoBold(size: 12))
                                                .foregroundColor(.darkPurple)
                                                .padding(.horizontal, 12)
                                                .padding(.vertical, 12)
                                                .background(.white)
                                                .cornerRadius(10)
                                        }
                                    }



                                }
                                .background {
                                    Image.imgOverlayHome
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                                        .offset(x: -15, y: 20)

                                }
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 12)
                                .background(Color.primaryPurple)
                                .cornerRadius(20)

                                HStack {
                                    Text("Jadwal Video Call")
                                        .font(.robotoBold(size: 18))
                                        .padding(.top, 20)

                                    Spacer()
                                }

                                HStack {
                                    Image.imgScheduleHome

                                    VStack {
                                        HStack {
                                            Text("Cek Jadwal")
                                                .font(.robotoBold(size: 12))

                                            Spacer()
                                        }
                                        .padding(.leading, 10)


                                        HStack {
                                            Text("Periksa jadwal Anda dengan pembuat konten pilihan Anda di sini!")
                                                .font(.robotoRegular(size: 12))

                                            Spacer()
                                        }
                                        .padding(.leading, 10)
                                    }

                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.primaryPurple)
                                }
                                    .frame(maxWidth: .infinity)
                                    .padding(24)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .padding(.top, 15)

                                VStack {
                                    HStack {
                                        VStack {
                                            HStack {
                                                Text("Sedang berlangsung")
                                                    .font(.robotoBold(size: 18))
                                                .padding(.top, 20)

                                                Spacer()
                                            }

                                            HStack {
                                                Text("Tanpa perlu pikir lama langsung gabung aja!")
                                                    .font(.robotoRegular(size: 12))

                                                Spacer()
                                            }
                                        }


                                        Spacer()

                                        Image(systemName: "chevron.right")
                                            .frame(width: 20)
                                            .foregroundColor(.black)                           .padding(.top, 20)

                                    }

                                }

                            }
                            .padding(.horizontal, 20)
                            
                            VStack {
                                HStack {
                                    Image.imgCalendarHome

                                    Text("Selasa, 27 Juli 2020  13.00 - 14.00")
                                        .font(.robotoRegular(size: 12))

                                    Spacer()

                                    Image(systemName: "dot.radiowaves.left.and.right")
                                        .foregroundColor(.red)

                                    Text("Live")
                                        .font(.robotoRegular(size: 12))
                                }


                                HStack {
                                    Text("Cara memahami emosional yang tidak stabil dalam menghadapi masalah di dunia ini")
                                        .font(.robotoBold(size: 14))


                                    Spacer()
                                }
                                .padding(.top, 13)

                                HStack {
                                    Image.imgScheduleCreatorHome

                                    Spacer()
                                }
                                .padding(.top, 13)

                                HStack {
                                    Image.imgAvatarProfile
                                        .resizable()
                                        .frame(width: 25, height: 25)

                                    Text("Zahra Nur Khaulfah")
                                        .font(.robotoBold(size: 14))

                                    Image.icVerifiedCommon

                                    Spacer()

                                    Text("Lihat")
                                        .font(.robotoBold(size: 14))
                                        .foregroundColor(.primaryPurple)
                                        .padding(.horizontal, 30)
                                        .padding(.vertical, 10)
                                        .background(Color.backgroundPurple)
                                        .cornerRadius(20)
                                }
                                .padding(.top, 13)


                            }
                                .frame(maxWidth: .infinity)
                                .padding(24)
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding(.top, 15)
                                .padding(.horizontal, 20)
                            
                            Image.imgSliderHome
                                .resizable()
                                .padding(.top, 15)
                                
                            HStack(alignment: .center) {
                                Spacer()
                                Circle()
                                    .fill(Color.primaryPurple)
                                    .frame(width: 10, height: 10)
                                
                                Circle()
                                    .fill(Color.secondaryPurple)
                                    .frame(width: 10, height: 10)
                                
                                Circle()
                                    .fill(Color.secondaryPurple)
                                    .frame(width: 10, height: 10)
                                Spacer()
                            }
                            .padding(.bottom, 20)
                            
                            Text("Yang lagi populer")
                                .font(.robotoBold(size: 18))
                                .padding(.leading, 20)

                            ScrollView(.horizontal) {
                                HStack {
                                    Rectangle()
                                        .fill(Color.black.opacity(0))

                                    VStack {
                                        Image.imgDummyPeople2Home
                                            .resizable()
                                            .frame(width: 154, height: 154)

                                        HStack {
                                            Text("Adinda Marala")
                                                .font(.robotoBold(size: 11))

                                            Image.icVerifiedCommon
                                                .resizable()
                                                .frame(width: 12, height: 12)
                                        }

                                    }
                                    .padding(.bottom, 8)
                                    .background(Color.white)
                                    .cornerRadius(5)

                                    VStack {
                                        Image.imgDummyPeople5Home
                                            .resizable()
                                            .frame(width: 154, height: 154)

                                        HStack {
                                            Text("Adinda Marala")
                                                .font(.robotoBold(size: 11))

                                            Image.icVerifiedCommon
                                                .resizable()
                                                .frame(width: 12, height: 12)
                                        }

                                    }
                                    .padding(.bottom, 8)
                                    .background(Color.white)
                                    .cornerRadius(5)

                                    VStack {
                                        Image.imgDummyPeopleHome
                                            .resizable()
                                            .frame(width: 154, height: 154)
                                            .scaledToFit()

                                        HStack {
                                            Text("Adinda Marala")
                                                .font(.robotoBold(size: 11))

                                            Image.icVerifiedCommon
                                                .resizable()
                                                .frame(width: 12, height: 12)
                                        }

                                    }
                                    .padding(.bottom, 8)
                                    .background(Color.white)
                                    .cornerRadius(5)

                                    Rectangle()
                                        .fill(Color.black.opacity(0))
                                }
                            }
                            .scrollIndicators(.hidden)
                            .padding(.bottom, 20)


                            Text("Rekomendasi buat kamu")
                                .font(.robotoBold(size: 18))
                                .padding(.leading, 20)

                            ScrollView(.horizontal) {
                                HStack {
                                    Rectangle()
                                        .fill(Color.black.opacity(0))

                                    VStack {
                                        Image.imgDummyPeopleHome
                                            .resizable()
                                            .frame(width: 154, height: 154)

                                        HStack {
                                            Text("Adinda Marala")
                                                .font(.robotoBold(size: 11))

                                            Image.icVerifiedCommon
                                                .resizable()
                                                .frame(width: 12, height: 12)
                                        }

                                    }
                                    .padding(.bottom, 8)
                                    .background(Color.white)
                                    .cornerRadius(5)

                                    VStack {
                                        Image.imgDummyPeople4Home
                                            .resizable()
                                            .frame(width: 154, height: 154)
                                            .scaledToFit()

                                        HStack {
                                            Text("Adinda Marala")
                                                .font(.robotoBold(size: 11))

                                            Image.icVerifiedCommon
                                                .resizable()
                                                .frame(width: 12, height: 12)
                                        }

                                    }
                                    .padding(.bottom, 8)
                                    .background(Color.white)
                                    .cornerRadius(5)

                                    VStack {
                                        Image.imgDummyPeople5Home
                                            .resizable()
                                            .frame(width: 154, height: 154)
                                            .scaledToFit()

                                        HStack {
                                            Text("Adinda Marala")
                                                .font(.robotoBold(size: 11))

                                            Image.icVerifiedCommon
                                                .resizable()
                                                .frame(width: 12, height: 12)
                                        }

                                    }
                                    .padding(.bottom, 8)
                                    .background(Color.white)
                                    .cornerRadius(5)

                                    Rectangle()
                                        .fill(Color.black.opacity(0))
                                }
                            }
                            .scrollIndicators(.hidden)
                            .padding(.bottom, 20)
                        }
                        
                        Text("Group Call")
                            .font(.robotoBold(size: 18))
                            .padding(.leading, 20)

                        ScrollView(.horizontal) {
                            HStack {
                                Rectangle()
                                    .fill(Color.black.opacity(0))

                                VStack(alignment: .leading) {
                                    HStack {
                                        Image.imgAvatarProfile
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .scaledToFit()
                                            .padding(.trailing, 5)

                                        Text("Dr. Yassin Mohammad")
                                            .font(.robotoMedium(size: 14))

                                        Image.icVerifiedCommon

                                        Spacer()
                                    }
                                    .padding(.bottom, 20)

                                    Text("Panduan nutrisi ibu Hami")
                                        .font(.robotoBold(size: 12))

                                    HStack {
                                        Image.imgCalendarHome
                                            .resizable()
                                            .frame(width: 18, height: 18)

                                        Text("Rabu, 09 Agustus 2023")
                                            .font(.robotoRegular(size: 12))
                                    }

                                    HStack {
                                        Image.imgClockCommon
                                            .resizable()
                                            .frame(width: 18, height: 18)

                                        Text("20:00 - 20:45")
                                            .font(.robotoRegular(size: 12))
                                    }
                                    .padding(.bottom, 10)

                                    DinotisPrimaryButton(text: "Lihat Jadwal", type: .adaptiveScreen, textColor: .white, bgColor: .primaryPurple) {

                                    }
                                }
                                .frame(width: 270)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 15)
                                .background(Color.white)
                                .cornerRadius(8)
                                .padding(.trailing, 10)

                                VStack(alignment: .leading) {
                                    HStack {
                                        Image.imgAvatarProfile
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .scaledToFit()
                                            .padding(.trailing, 5)

                                        Text("Dr. Yassin Mohammad")
                                            .font(.robotoMedium(size: 14))

                                        Image.icVerifiedCommon

                                        Spacer()
                                    }
                                    .padding(.bottom, 20)

                                    Text("Panduan nutrisi ibu Hami")
                                        .font(.robotoBold(size: 12))

                                    HStack {
                                        Image.imgCalendarHome
                                            .resizable()
                                            .frame(width: 18, height: 18)

                                        Text("Rabu, 09 Agustus 2023")
                                            .font(.robotoRegular(size: 12))
                                    }

                                    HStack {
                                        Image.imgClockCommon
                                            .resizable()
                                            .frame(width: 18, height: 18)

                                        Text("20:00 - 20:45")
                                            .font(.robotoRegular(size: 12))
                                    }
                                    .padding(.bottom, 10)

                                    DinotisPrimaryButton(text: "Lihat Jadwal", type: .adaptiveScreen, textColor: .white, bgColor: .primaryPurple) {

                                    }

                                }
                                .frame(width: 270)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 15)
                                .background(Color.white)
                                .cornerRadius(8)

                                Rectangle()
                                    .fill(Color.black.opacity(0))
                            }
                        }
                        .scrollIndicators(.hidden)
                        .padding(.bottom, 20)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                Rectangle()
                                    .fill(Color.black.opacity(0))
                                
                                Text("Semua")
                                    .font(.robotoRegular(size: 12))
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(Color.primaryPurple)
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                                    .padding(.trailing, 10)
                                
                                Text("Konten Kreator")
                                    .font(.robotoRegular(size: 12))
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(Color.shadeGrey)
                                    .cornerRadius(5)
                                    .padding(.trailing, 10)
                                
                                Text("Psikolog")
                                    .font(.robotoRegular(size: 12))
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(Color.shadeGrey)
                                    .cornerRadius(5)
                                    .padding(.trailing, 10)
                                
                                Text("Lainnya")
                                    .font(.robotoRegular(size: 12))
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(Color.shadeGrey)
                                    .cornerRadius(5)
                                    .padding(.trailing, 10)
                            }
                        }
                        .scrollIndicators(.hidden)
                        .padding(.bottom, 20)
                        
                        ForEach(0...5, id: \.self) { i in
                            HStack {
                                Image.imgAvatarAgenda
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.trailing, 10)
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Fennisita Aurellia")
                                            .font(.robotoBold(size: 13))
                                        
                                        Image.icVerifiedCommon
                                    }
                                    
                                    Text("Psikolog")
                                        .font(.robotoRegular(size: 12))
                                    
                                }
                                
                                Spacer()
                                
                            }
                            .frame(width: .infinity)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 20)
                            .background(Color.white)
                            .cornerRadius(8)
                            .padding(.bottom, 5)
                        }
                        .frame(width: .infinity)
                        .padding(.horizontal, 20)
                        
                    }
                    .padding(.bottom, 200)
                    .edgesIgnoringSafeArea(.bottom)
            }
                .tag(1)
                .background(Color.backgroundPurple)
                
                ProfileView(viewModel: ProfileViewModel())
                .tag(2)
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Image.imgContactHome
                        
                        Text("Jadwal")
                            .font(.robotoMedium(size: 12))
                            .foregroundColor(.gray)
                    }
                    .onTapGesture {
                        tabIndex = 0
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image.imgLogoSingle
                        
                        Text("Home")
                            .font(.robotoMedium(size: 12))
                            .foregroundColor(.primaryPurple)
                    }
                    .onTapGesture {
                        tabIndex = 1
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image.imgProfileHome
                        
                        Text("Profile")
                            .font(.robotoMedium(size: 12))
                            .foregroundColor(.gray)
                    }
                    .onTapGesture {
                        tabIndex = 2
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 25)
                .background(.white)
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
