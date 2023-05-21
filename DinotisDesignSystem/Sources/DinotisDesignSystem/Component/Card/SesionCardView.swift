//
//  SwiftUIView.swift
//  
//
//  Created by Irham Naufal on 21/05/23.
//

import SwiftUI
import DinotisData

public struct SessionCardView: View {
    
    private let sessionData: UserSession
    
    public init(sessionData: UserSession) {
        self.sessionData = sessionData
    }
    
    public var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SessionCardView_Previews: PreviewProvider {
    static var previews: some View {
        SessionCardView(sessionData: UserSession(image: Image.imgAudiensRole))
    }
}
