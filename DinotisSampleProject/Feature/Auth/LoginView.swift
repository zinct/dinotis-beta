//
//  LoginView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 14/05/23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            HStack {
                Image.icBackHeader
                    .frame(width: 37, height: 36)
                    .background(.white)
                    .clipShape(Circle())
                    .shadow(color: .shadowBlack.opacity(0.06), radius: 4)

                Spacer()
                
                Image.imgLogoCommon
                
                Spacer()
                
                Image.icHelpHeader
            }
                .padding(.horizontal, 15)
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
