//
//  DinotisPrimaryTopBar
//  
//
//  Created by Indra Mahesa on 25/05/23.
//

import SwiftUI

public struct DinotisPrimaryTopBar: View {
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
            Image.imgLogoTopBar
            
            Spacer()
            
            Image.icNotificationTopbar
                .padding(.trailing, 25)
            
            Button(action: handleHelpIndicator) {
                Image.icHelpHeader
            }
        }
    }
}

struct DinotisPrimaryTopBar_Previews: PreviewProvider {
    static var previews: some View {
        DinotisPrimaryTopBar()
    }
}
