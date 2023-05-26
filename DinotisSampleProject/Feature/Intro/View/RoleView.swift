//
//  RoleView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 14/05/23.
//

import SwiftUI
import DinotisDesignSystem

struct RoleView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack {
                Image.imgTextRole
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading) {
                    Text(LocalizableText.roleTitle)
                        .font(.robotoBold(size: 34))
                        .padding(.bottom, 25)
                    
                    Text(LocalizableText.roleSelect)
                        .font(.robotoBold(size: 16))
                        .foregroundColor(.primaryGrey)
                        .padding(.bottom, 17)
                    
                    NavigationLink(destination: CreatorAuthView()) {
                        HStack(alignment: .center) {
                            Image.imgAudiensRole
                                .resizable()
                                .scaledToFit()
                                .frame(width: 103)
                                .padding(.bottom, 10)
                            
                            VStack(alignment: .leading) {
                                Text(LocalizableText.audiens)
                                    .font(.robotoBold(size: 20))
                                    .foregroundColor(.white)
                                
                                Text(LocalizableText.audiensDescription)
                                    .font(.robotoRegular(size: 12))
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            Image.icArrowrightRole
                                .padding(.trailing, 10)
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: 75)
                        .background(Color.primaryPurple)
                        .cornerRadius(8)
                    }
                    
                    Button(action: {
                        
                    }) {
                        HStack(alignment: .center) {
                            Image.imgCreatorsRole
                                .resizable()
                                .scaledToFit()
                                .frame(width: 103)
                                .padding(.leading, 7)
                            
                            VStack(alignment: .leading) {
                                Text(LocalizableText.creators)
                                    .font(.robotoBold(size: 20))
                                    .foregroundColor(.white)
                                
                                Text(LocalizableText.creatorsDescription)
                                    .font(.robotoRegular(size: 12))
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            Image.icArrowrightRole
                                .padding(.trailing, 10)
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: 75)
                        .background(Color.primaryPink)
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 25)
                .navigationBarBackButtonHidden()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct RoleView_Previews: PreviewProvider {
    static var previews: some View {
        RoleView()
    }
}
