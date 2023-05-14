//
//  HomeView.swift
//  DinotisSampleProject
//
//  Created by Irham Naufal on 14/05/23.
//

import SwiftUI
import DinotisDesignSystem

struct HomeView: View {
    var body: some View {
        VStack {
            DinotisPrimaryButton(
                text: LocalizableText.testTitle,
                type: .adaptiveScreen,
                textColor: .white,
                bgColor: .purple) {}
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
