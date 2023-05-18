//
//  DinotisPrimaryButton.swift
//  DinotisIntroTopBar
//
//  Created by Indra Mahesa on 18/05/23.
//

import SwiftUI

public let whatsappNumber = "https://wa.me/6281395749557"

public struct DinotisIntroTopBar: View {
    @Environment(\.presentationMode) public var presentationMode
    
    public func handleHelpIndicator() {
        if let url = URL(string: whatsappNumber),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    public init() {}
    
    public var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image.icBackHeader
                    .frame(width: 37, height: 36)
                    .background(.white)
                    .clipShape(Circle())
                    .shadow(color: .shadowBlack.opacity(0.06), radius: 4)
            }
            
            Spacer()
            
            Image.imgLogoCommon
            
            Spacer()
            
            Button(action: handleHelpIndicator) {
                Image.icHelpHeader
            }
        }
        .padding(.bottom, 24)
    }
}

struct DinotisIntroTopBar_Previews: PreviewProvider {
    static var previews: some View {
        DinotisIntroTopBar()
    }
}
