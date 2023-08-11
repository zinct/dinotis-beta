//
//  CreatorSubscriptionView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 11/08/23.
//

import SwiftUI
import DinotisDesignSystem

struct CreatorSubscriptionView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                DinotisSecondaryTopBar(title: "Bundling Bicara Skincard")
                    .padding(.horizontal, 24)
                
                ScrollView {
                    CreatorDetailSessionCard()
                    CreatorDetailSessionCard()
                    CreatorDetailSessionCard()
                }
                .padding(.horizontal, 20)
                
                VStack(alignment: .leading) {
                    HStack {
                        Image.imgPriceCreator
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 8)
                        
                        VStack(alignment: .leading) {
                            Text("Bundling Bicara Skincare")
                                .font(.robotoBold(size: 12))
                            
                            Text("Total 4 Sesi")
                                .font(.robotoBold(size: 12))
                                .foregroundColor(.secondaryGrey)
                            
                            Text("Rp300.000")
                                .font(.robotoBold(size: 14))
                        }
                        
                        Spacer()
                        
                        DinotisPrimaryButton(text: "Booking", type: .adaptiveScreen, textColor: .white, bgColor: .primaryPurple) {
                            
                        }
                        .padding(.leading, 30)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            }
            
            Spacer()
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct CreatorSubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorSubscriptionView()
    }
}
