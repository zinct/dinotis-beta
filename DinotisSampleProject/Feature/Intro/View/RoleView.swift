//
//  RoleView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 14/05/23.
//

import SwiftUI

struct RoleView: View {
    var body: some View {
        VStack {
                
            Image.imgTextRole
                .resizable()
                .scaledToFit()
                .padding(.bottom, 20)
            
            VStack(alignment: .leading) {
                Text("Berbagai sesi menarik untukmu")
                    .font(.robotoBold(size: 34))
                    .padding(.bottom, 25)
                
                Text("Silahkan pilih tipe akun yang sesuai untukmu!")
                    .font(.robotoBold(size: 16))
                    .foregroundColor(Color(hex: "#52575C"))
                    .padding(.bottom, 17)
                
                Button(action: {
                    
                }) {
                    HStack(alignment: .center) {
                        Image.imgAudiensRole
                            .resizable()
                            .scaledToFit()
                            .frame(width: 103)
                            .padding(.bottom, 10)
                        
                        VStack(alignment: .leading) {
                            Text("Audiens")
                                .font(.robotoBold(size: 20))
                                .foregroundColor(.white)
                            
                            Text("Mulai ngobrol dengan kreator")
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
                            Text("Kreators")
                                .font(.robotoBold(size: 20))
                                .foregroundColor(.white)
                            
                            Text("Mulai ngobrol dengan Audiens")
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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct RoleView_Previews: PreviewProvider {
    static var previews: some View {
        RoleView()
    }
}
