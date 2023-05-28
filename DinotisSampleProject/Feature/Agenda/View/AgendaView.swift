//
//  AgendaView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 25/05/23.
//

import SwiftUI
import DinotisDesignSystem

struct AgendaView: View {
    @ObservedObject var viewModel = AgendaViewModel()
    @Namespace private var animation
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack {
                VStack{
                    DinotisPrimaryTopBar()
                        .padding(.bottom, 24)
                    
                    HStack {
                        Text(LocalizableText.agendaToday)
                            .font(.robotoBold(size: 16))
                            .foregroundColor(.primaryBlack)
                        Spacer()
                    }
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 24)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            AgendaRecommendedCard()
                                .padding(.leading, 24)
                            AgendaRecommendedCard()
                            AgendaRecommendedCard()
                                .padding(.trailing, 24)
                        }
                    }
                
                
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            DinotisPrimaryTapBar(label: LocalizableText.all, currentId: $viewModel.selectedIndex, id: "0", namespace: animation)
                            DinotisPrimaryTapBar(label: LocalizableText.agendaPending, currentId: $viewModel.selectedIndex, id: "1", namespace: animation)
                            DinotisPrimaryTapBar(label: LocalizableText.agendaUpcoming, currentId: $viewModel.selectedIndex, id: "2", namespace: animation)
                            DinotisPrimaryTapBar(label: LocalizableText.agendaDone, currentId: $viewModel.selectedIndex, id: "3", namespace: animation)
                            DinotisPrimaryTapBar(label: LocalizableText.agendaCancel, currentId: $viewModel.selectedIndex, id: "4", namespace: animation)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                    
                    TabView(selection: $viewModel.selectedIndex) {
                        VStack {
                            ScrollView {
                                ForEach(viewModel.userSession) { userSession in
                                    DinotisSessionCard(sessionData: userSession)
                                        .padding(.bottom, 20)
                                }
                            }
                            
                        }
                        .tag("0")
                        
                        VStack {
                            ScrollView {
                                ForEach(viewModel.userSession.filter({$0.status == .pending})) { userSession in
                                    DinotisSessionCard(sessionData: userSession)
                                        .padding(.bottom, 20)
                                }
                            }
                        }
                        .tag("1")
                        
                        VStack {
                            ScrollView {
                                ForEach(viewModel.userSession.filter({$0.status == .upcoming})) { userSession in
                                    DinotisSessionCard(sessionData: userSession)
                                        .padding(.bottom, 20)
                                }
                            }
                        }
                        .tag("2")
                        
                        VStack {
                            ScrollView {
                                ForEach(viewModel.userSession.filter({$0.status == .done})) { userSession in
                                    DinotisSessionCard(sessionData: userSession)
                                        .padding(.bottom, 20)
                                }
                            }
                        }
                        .tag("3")
                        
                        VStack {
                            ScrollView {
                                ForEach(viewModel.userSession.filter({$0.status == .cancel})) { userSession in
                                    DinotisSessionCard(sessionData: userSession)
                                        .padding(.bottom, 20)
                                }
                            }
                        }
                        .tag("4")
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .edgesIgnoringSafeArea(.bottom)
                    
                    Spacer()
                                    
                }
                .padding(.vertical, 20)
                .background(Color.white)
                .cornerRadius(25)
                .shadow(color: .black.opacity(0.1), radius: 0.2)
                
                
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct AgendaView_Previews: PreviewProvider {
    static var previews: some View {
        AgendaView()
    }
}

public struct AgendaRecommendedCard: View {
    public var body: some View {
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
                    Image.imgAvatarAgenda
                    
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
        .frame(width: 307, height: 205)
        .background(Color.gray)
        .cornerRadius(8)
        .padding(.bottom, 20)
    }
}
