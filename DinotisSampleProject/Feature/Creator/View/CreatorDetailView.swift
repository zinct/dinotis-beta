//
//  CreatorDetailView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 09/08/23.
//

import SwiftUI
import DinotisDesignSystem

struct CreatorDetailView: View {
    @ObservedObject var viewModel = CreatorDetailViewModel()
    @Namespace private var animation
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    VStack(alignment: .leading) {
                        DinotisSecondaryTopBar(title: "Adinda Marala" )
                            
                        
                        HStack {
                            Image.imgDummyPeopleHome
                                .resizable()
                                .frame(width: 86, height: 86)
                                .cornerRadius(22)
                                .padding(.trailing, 45)
                                .padding(.bottom, 10)
                            
                            HStack {
                                VStack {
                                    Text("Sesi")
                                        .font(.robotoRegular(size: 12))
                                    
                                    Text("56")
                                        .font(.robotoBold(size: 16))
                                }
                                .padding(.trailing, 43)
                                
                                VStack {
                                    Text("Sesi")
                                        .font(.robotoRegular(size: 12))
                                    
                                    Text("56")
                                        .font(.robotoBold(size: 16))
                                }
                                .padding(.trailing, 43)
                                
                                VStack {
                                    Text("Penilaian")
                                        .font(.robotoRegular(size: 12))
                                    
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.primaryOrange)
                                        Text("4,7")
                                            .font(.robotoBold(size: 16))
                                    }
                                    
                                }
                            }
                        }
                        
                        Text("Adinda Marala")
                            .font(.robotoBold(size: 14))
                            .padding(.bottom, 8)
                        
                        HStack(alignment: .center) {
                            Image(systemName: "briefcase")
                                .resizable()
                                .frame(width: 12, height: 12)
                            
                            Text("Artist, Musisi")
                                .font(.robotoRegular(size: 12))
                        }
                        .padding(.bottom, 8)
                        
                        Text("Halo gaes, salam kenal ya! Jangan lupa sukrep yutub Adinda Marala oke gaes sekian dari saya okee")
                            .font(.robotoRegular(size: 12))
                            .padding(.bottom, 8)
                        
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 24)
                }
                
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            DinotisPrimaryTapBar(label: "Sesi", currentId: $viewModel.selectedIndex, id: "0", namespace: animation)
                                .frame(width: 200)
                            DinotisPrimaryTapBar(label: "Layanan", currentId: $viewModel.selectedIndex, id: "1", namespace: animation)
                                .frame(width: 200)
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                    
                    TabView(selection: $viewModel.selectedIndex) {
                        ScrollView {
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(systemName: "info.circle")
                                        .padding(.trailing, 5)
                                        .foregroundColor(.primaryPink)

                                    Text("Sesi cocok untuk kamu yang ingin berinteraksi dengan kreator bareng-bareng dengan audiens lainnya.")
                                        .font(.robotoRegular(size: 12))

                                }
                                .padding(.bottom, 20)


                                HStack {
                                    HStack {
                                        Image(systemName: "slider.horizontal.3")
                                            .foregroundColor(.black)

                                        Text("Filter Sesi")
                                            .font(.robotoBold(size: 12))
                                    }
                                    .padding(.leading, 10)
                                    .padding(.top, 10)

                                    Spacer()

                                    Picker("Picker Placeholder", selection: $viewModel.sessionSelected) {
                                        Text("Sesi yang tersedia")
                                            .tag("Sesi yang tersedia")

                                        Text("Sesi telah selesai")
                                            .tag("Sesi telah selesai")
                                    }
                                    .frame(width: 140)
                                    .opacity(0.02)
                                    .background {
                                        HStack {
                                            Text(viewModel.sessionSelected)
                                                .font(.robotoRegular(size: 12))
                                                .foregroundColor(.primaryPurple)

                                            Image(systemName: "chevron.down")
                                                .resizable()
                                                .frame(width: 11, height: 6)
                                                .foregroundColor(.primaryPurple)
                                        }
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 6)
                                        .background(Color.secondaryPurple)
                                        .cornerRadius(5)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.purple, lineWidth: 0.5)
                                                .foregroundColor(Color.secondaryPurple)
                                        )
                                    }
                                }
                                .padding(.bottom, 20)

                                if(viewModel.sessionSelected == "Sesi telah selesai") {
                                    Group {
                                        Text("Sesi telah selesai")
                                            .font(.robotoBold(size: 18))

                                        ZStack {
                                            LinearGradient(colors: [.pink, .blue], startPoint: .bottomTrailing, endPoint: .topLeading)
                                            VStack(alignment: .leading) {
                                                Text("🗓️ Selasa, 27 Juli 2020 • 13.00 - 14.00")
                                                    .foregroundColor(.white)
                                                    .font(.robotoRegular(size: 10))
                                                    .padding(.bottom, 9)

                                                Text("Cara memahami emosional yang tidak stabil dalam menghadapi masalah di dunia ")
                                                    .foregroundColor(.white)
                                                    .font(.robotoBold(size: 14))
                                                    .padding(.bottom, 9)
                                                    .lineLimit(2, reservesSpace: true)

                                                Text("⚡️ Sesi Private")
                                                    .foregroundColor(.accentPurple)
                                                    .font(.robotoRegular(size: 10))
                                                    .padding(.horizontal, 10)
                                                    .padding(.vertical, 5)
                                                    .background(.white)
                                                    .cornerRadius(20)
                                                    .padding(.bottom, 10)

                                                HStack {
                                                    Image.imgDummyPeopleHome
                                                        .resizable()
                                                        .frame(width: 30, height: 30)
                                                        .clipShape(Circle())
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: .infinity)
                                                                .stroke(Color.white, lineWidth: 1)
                                                        )

                                                    Text("Indra Mahesa")
                                                        .foregroundColor(.white)
                                                        .font(.robotoBold(size: 12))

                                                    Image.icVerifiedCommon

                                                    Spacer()

                                                    Text("Lihat")
                                                        .foregroundColor(.accentPurple)
                                                        .font(.robotoBold(size: 10))
                                                        .padding(.horizontal, 20)
                                                        .padding(.vertical, 8)
                                                        .background(.white)
                                                        .cornerRadius(20)
                                                }
                                                .padding(.horizontal, 10)
                                                .padding(.vertical, 8)
                                                .background(.white.opacity(0.10))
                                                .cornerRadius(10)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(.white.opacity(0.2), lineWidth: 0.5)
                                                )
                                            }
                                            .padding(20)
                                        }
                                        .frame(height: 205)
                                        .background(Color.gray)
                                        .cornerRadius(8)
                                        .padding(.bottom, 20)
                                        .grayscale(0.9)
                                        .opacity(0.7)

                                        ZStack {
                                            LinearGradient(colors: [.pink, .blue], startPoint: .bottomTrailing, endPoint: .topLeading)
                                            VStack(alignment: .leading) {
                                                Text("🗓️ Selasa, 27 Juli 2020 • 13.00 - 14.00")
                                                    .foregroundColor(.white)
                                                    .font(.robotoRegular(size: 10))
                                                    .padding(.bottom, 9)

                                                Text("Cara memahami emosional yang tidak stabil dalam menghadapi masalah di dunia ")
                                                    .foregroundColor(.white)
                                                    .font(.robotoBold(size: 14))
                                                    .padding(.bottom, 9)
                                                    .lineLimit(2, reservesSpace: true)

                                                Text("⚡️ Sesi Private")
                                                    .foregroundColor(.accentPurple)
                                                    .font(.robotoRegular(size: 10))
                                                    .padding(.horizontal, 10)
                                                    .padding(.vertical, 5)
                                                    .background(.white)
                                                    .cornerRadius(20)
                                                    .padding(.bottom, 10)

                                                HStack {
                                                    Image.imgDummyPeopleHome
                                                        .resizable()
                                                        .frame(width: 30, height: 30)
                                                        .clipShape(Circle())
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: .infinity)
                                                                .stroke(Color.white, lineWidth: 1)
                                                        )

                                                    Text("Indra Mahesa")
                                                        .foregroundColor(.white)
                                                        .font(.robotoBold(size: 12))

                                                    Image.icVerifiedCommon

                                                    Spacer()

                                                    Text("Lihat")
                                                        .foregroundColor(.accentPurple)
                                                        .font(.robotoBold(size: 10))
                                                        .padding(.horizontal, 20)
                                                        .padding(.vertical, 8)
                                                        .background(.white)
                                                        .cornerRadius(20)
                                                }
                                                .padding(.horizontal, 10)
                                                .padding(.vertical, 8)
                                                .background(.white.opacity(0.10))
                                                .cornerRadius(10)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(.white.opacity(0.2), lineWidth: 0.5)
                                                )
                                            }
                                            .padding(20)
                                        }
                                        .frame(height: 205)
                                        .background(Color.gray)
                                        .cornerRadius(8)
                                        .padding(.bottom, 20)
                                        .grayscale(0.9)
                                        .opacity(0.7)
                                    }
                                } else {
                                    Group {
                                        Text("Paket Bundling")
                                            .font(.robotoBold(size: 18))

                                        ServiceBundleCard()
                                        
                                        Text("Sesi Yang tersedia")
                                            .font(.robotoBold(size: 18))
                                        
                                        CreatorDetailSessionCard()
                                    }
                                }

                                HStack {
                                    Text("Ulasan sesi")
                                        .font(.robotoBold(size: 18))
                                        .padding(.leading, 10)
                                        .padding(.top, 10)

                                    Spacer()

                                    Picker("Picker Placeholder", selection: $viewModel.sessionSelected) {
                                        Text("Sesi yang tersedia")
                                            .tag("Sesi yang tersedia")

                                        Text("Sesi telah selesai")
                                            .tag("Sesi telah selesai")
                                    }
                                    .frame(width: 140)
                                    .opacity(0.02)
                                    .background {
                                        HStack {
                                            Text(viewModel.sessionSelected)
                                                .font(.robotoRegular(size: 12))
                                                .foregroundColor(.primaryPurple)

                                            Image(systemName: "chevron.down")
                                                .resizable()
                                                .frame(width: 11, height: 6)
                                                .foregroundColor(.primaryPurple)
                                        }
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 6)
                                        .background(Color.secondaryPurple)
                                        .cornerRadius(5)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.purple, lineWidth: 0.5)
                                                .foregroundColor(Color.secondaryPurple)
                                        )
                                    }
                                }
                                .padding(.bottom, 20)

                                ChatBubble()
                                ChatBubble()
                                ChatBubble()
                                ChatBubble()
                                ChatBubble()

                                Spacer()

                            }
                            .padding(.horizontal, 20)
                        }
                        .tag("0")
                        
                        ScrollView {
                            VStack {
                                HStack {
                                   Image(systemName: "info.circle")
                                       .padding(.trailing, 5)
                                       .foregroundColor(.primaryPink)

                                   Text("Layanan cocok untuk kamu yang ingin berinteraksi dengan kreator pilihanmu secara private.")
                                       .font(.robotoRegular(size: 12))

                               }
                               .padding(.bottom, 20)
                                
                                VStack(alignment: .leading) {
                                    ServiceCard()
                                        .padding(.bottom, 10)
                                    ServiceCard()
                                        .padding(.bottom, 10)
                                    ServiceCard()
                                        .padding(.bottom, 10)
                                    ServiceCard()
                                        .padding(.bottom, 10)
                                    ServiceCard()
                                        .padding(.bottom, 10)
                                    ServiceCard()
                                        .padding(.bottom, 10)
                                }
                                
                                HStack {
                                    Text("Ulasan layanan")
                                        .font(.robotoBold(size: 18))
                                        .padding(.leading, 10)
                                        .padding(.top, 10)

                                    Spacer()

                                    Picker("Picker Placeholder", selection: $viewModel.sessionSelected) {
                                        Text("Sesi yang tersedia")
                                            .tag("Sesi yang tersedia")

                                        Text("Sesi telah selesai")
                                            .tag("Sesi telah selesai")
                                    }
                                    .frame(width: 140)
                                    .opacity(0.02)
                                    .background {
                                        HStack {
                                            Text(viewModel.sessionSelected)
                                                .font(.robotoRegular(size: 12))
                                                .foregroundColor(.primaryPurple)

                                            Image(systemName: "chevron.down")
                                                .resizable()
                                                .frame(width: 11, height: 6)
                                                .foregroundColor(.primaryPurple)
                                        }
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 6)
                                        .background(Color.secondaryPurple)
                                        .cornerRadius(5)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.purple, lineWidth: 0.5)
                                                .foregroundColor(Color.secondaryPurple)
                                        )
                                    }
                                }
                                .padding(.bottom, 20)

                                ChatBubble()
                                ChatBubble()
                                ChatBubble()
                                ChatBubble()
                                ChatBubble()
                            }
                            .padding(.horizontal, 20)
                        }
                        .frame(width: .infinity)
                        .tag("1")
                        
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .edgesIgnoringSafeArea(.bottom)
                    
                    Spacer()
                                    
                }
                .padding(.vertical, 20)
                .background(Color.white)
                .cornerRadius(25)
                .shadow(color: .black.opacity(0.1), radius: 0.2)
                .ignoresSafeArea()
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom)
            
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct CreatorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorDetailView()
    }
}

struct ServiceCard: View {
    var body: some View {
        NavigationLink(destination: ServiceCreateView()) {
            HStack {
                Image.imgVideocallCommon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 33, height: 33)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(14)
                    .shadow(color: Color.black.opacity(0.08), radius: 3)
                    .padding(.trailing, 12)
                
                VStack(alignment: .leading) {
                    Text("Ngobrol bareng aku yuk!")
                        .font(.robotoBold(size: 12))
                        .foregroundColor(Color.black)
                    
                    Text("Private Video Call - Durasi 60 Menit")
                        .font(.robotoRegular(size: 10))
                        .foregroundColor(Color.black)
                    
                    HStack {
                        Image.icPricetagAgenda
                        
                        Text("Rp150.000")
                            .font(.robotoBold(size: 12))
                            .foregroundColor(.primaryPurple)
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(Color.white)
            .cornerRadius(14)
            .shadow(color: Color.black.opacity(0.08), radius: 3)
        }
    }
}

struct ChatBubble: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image.imgDummyPeople5Home
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading) {
                    Text("Corney Talbot")
                        .font(.robotoMedium(size: 12))
                    
                    Text("7 Hari yang lalu")
                        .font(.robotoLight(size: 12))
                }
                
                Spacer()
                
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(.primaryOrange)
                    
                    Text("4,7")
                        .foregroundColor(.primaryPurple)
                        .font(.robotoMedium(size: 14))
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 10)
                .background(Color.secondaryPurple)
                .cornerRadius(.infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: .infinity)
                        .stroke(Color.purple, lineWidth: 0.5)
                        .foregroundColor(Color.secondaryPurple)
                )
            }
            .padding(.bottom, 10)
            
            Text("Keren banget kakak yang satu ini, udah cantik terus ramah sekali. Makin cinta deh <3")
                .font(.robotoLight(size: 12))
                .padding(.bottom, 10)
            
            Divider()
        }
        .padding(.bottom, 20)
        .padding(.horizontal, 8)
    }
}

struct ServiceBundleCard: View {
    var body: some View {
        NavigationLink(destination: CreatorSubscriptionView()) {
            ZStack {
                LinearGradient(colors: [.pink, .blue], startPoint: .bottomTrailing, endPoint: .topLeading)
                VStack(alignment: .leading) {
                    Text("🗓️ 2 Sesi")
                        .foregroundColor(.white)
                        .font(.robotoRegular(size: 10))
                        .padding(.bottom, 9)
                    
                    Text("Bundling Bicara Skincare")
                        .foregroundColor(.white)
                        .font(.robotoBold(size: 14))
                        .padding(.bottom, 9)
                        .lineLimit(2, reservesSpace: true)
                    
                    Image.imgBundlingScheduleCreator
                        .padding(.bottom, 8)
                    
                    HStack {
                        Image.imgDummyPeopleHome
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .overlay(
                                RoundedRectangle(cornerRadius: .infinity)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                        
                        Text("Indra Mahesa")
                            .foregroundColor(.white)
                            .font(.robotoBold(size: 12))
                        
                        Image.icVerifiedCommon
                        
                        Spacer()
                        
                        Text("Lihat Bundling")
                            .foregroundColor(.primaryPink)
                            .font(.robotoBold(size: 10))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(.white)
                            .cornerRadius(20)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .background(.white.opacity(0.10))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white.opacity(0.2), lineWidth: 0.5)
                    )
                }
                .padding(20)
            }
            .frame(height: 205)
            .background(Color.gray)
            .cornerRadius(8)
            .padding(.bottom, 20)
            .overlay {
                Text("Sesi bundling")
                    .font(.robotoBold(size: 12))
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 9)
                    .background(Color.primaryOrange)
                    .cornerRadius(20, corners: [.bottomLeft])
                    .cornerRadius(8, corners: [.topRight])
                    .offset(x: 142, y: -97)
            }
        }
        
    }
}

struct CreatorDetailSessionCard: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.pink, .blue], startPoint: .bottomTrailing, endPoint: .topLeading)
            VStack(alignment: .leading) {
                Text("🗓️ Selasa, 27 Juli 2020 • 13.00 - 14.00")
                    .foregroundColor(.white)
                    .font(.robotoRegular(size: 10))
                    .padding(.bottom, 9)
                
                Text("Cara memahami emosional yang tidak stabil dalam menghadapi masalah di dunia ")
                    .foregroundColor(.white)
                    .font(.robotoBold(size: 14))
                    .padding(.bottom, 9)
                    .lineLimit(2, reservesSpace: true)
                
                Image.imgBundlingScheduleCreator
                    .padding(.bottom, 8)
                
                HStack {
                    Image.imgDummyPeopleHome
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: .infinity)
                                .stroke(Color.white, lineWidth: 1)
                        )
                    
                    Text("Indra Mahesa")
                        .foregroundColor(.white)
                        .font(.robotoBold(size: 12))
                    
                    Image.icVerifiedCommon
                    
                    Spacer()
                    
                    Text("Lihat")
                        .foregroundColor(.accentPurple)
                        .font(.robotoBold(size: 10))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(.white)
                        .cornerRadius(20)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(.white.opacity(0.10))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.white.opacity(0.2), lineWidth: 0.5)
                )
            }
            .padding(20)
        }
        .frame(height: 205)
        .background(Color.gray)
        .cornerRadius(8)
        .padding(.bottom, 20)
    }
}
