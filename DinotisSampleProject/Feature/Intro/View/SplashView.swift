//
//  SplashView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 14/05/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Image.imgBackgroundSplash
                .resizable()
                .scaledToFill()
            
            Image.imgForegroundSplash
                .resizable()
                .scaledToFit()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient.splashBackground)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
