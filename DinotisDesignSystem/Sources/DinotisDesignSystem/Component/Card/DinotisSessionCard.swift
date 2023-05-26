//
//  SwiftUIView.swift
//  
//
//  Created by Irham Naufal on 21/05/23.
//

import SwiftUI
import DinotisData

public struct DinotisSessionCard: View {
    
    private let sessionData: UserSession
    
    public init(
        sessionData: UserSession
    ) {
        self.sessionData = sessionData
    }
    
    func getStatus() -> String {
        if sessionData.status == .pending {
            return LocalizableText.agendaPending
        } else if sessionData.status == .cancel {
            return LocalizableText.agendaCancel
        } else if sessionData.status == .done {
            return LocalizableText.agendaDone
        } else if sessionData.status == .upcoming {
            return LocalizableText.agendaUpcoming
        } else {
            return ""
        }
    }
    
    func getPrimayColor() -> Color {
        if sessionData.status == .pending {
            return Color.primaryPurple
        } else if sessionData.status == .cancel {
            return Color.primaryRed
        } else if sessionData.status == .done {
            return Color.primaryGreen
        } else if sessionData.status == .upcoming {
            return Color.primaryYellow
        } else {
            return .blue
        }
    }
    
    func getSecondaryColor() -> Color {
        if sessionData.status == .pending {
            return Color.secondaryPurple
        } else if sessionData.status == .cancel {
            return Color.secondaryRed
        } else if sessionData.status == .done {
            return Color.secondaryGreen
        } else if sessionData.status == .upcoming {
            return Color.secondaryYellow
        } else {
            return .blue
        }
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image.icPricetagAgenda
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("DINO019121")
                        .font(.robotoBold(size: 10))
                        .foregroundColor(.primaryBlack)
                    
                    Text(sessionData.date ?? "")
                        .font(.robotoRegular(size: 10))
                        .foregroundColor(.primaryBlack)
                }
                
                Spacer()
                
                Text(getStatus())
                    .font(.robotoBold(size: 10))
                    .foregroundColor(getPrimayColor())
                    .padding(.horizontal, 10)
                    .padding(.vertical, 7)
                    .background(getSecondaryColor())
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(getPrimayColor(), lineWidth: 1)
                    )
            }
            .padding(.bottom, 10)
            
            Rectangle()
                .fill(Color.secondaryPurple)
                .frame(height: 1)
            
            HStack {
                Image.imgGirlAgenda
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(sessionData.title ?? "")
                        .font(.robotoRegular(size: 10))
                        .foregroundColor(.primaryGrey)
                    
                    Text(sessionData.description ?? "")
                        .lineLimit(2, reservesSpace: true)
                        .font(.robotoBlack(size: 12))
                        .foregroundColor(.primaryBlack)
                }
            }
            .padding(.bottom, 14)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(LocalizableText.totalPrice)
                        .font(.robotoRegular(size: 10))
                        .foregroundColor(.primaryBlack)
                    
                    Text(sessionData.price ?? "")
                        .font(.robotoBold(size: 14))
                        .foregroundColor(.primaryPurple)
                }
                
                Spacer()
                
                DinotisPrimaryButton(text: LocalizableText.payNow, type: .mini, textColor: .white, bgColor: .primaryPurple) {
                    
                }
            }
            
            
            
        }
        .padding(20)
        .background(.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 3)
        .padding(.horizontal, 15)
    }
}

struct SessionCardView_Previews: PreviewProvider {
    static var previews: some View {
        DinotisSessionCard(sessionData: UserSession(date: "10 10", status: .pending, title: "aidjaid", description: "aojndia", price: "Rp. 1000", image: .imgGirlAgenda))
    }
}
