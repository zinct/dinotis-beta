//
//  MainView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 15/05/23.
//

import SwiftUI
import DinotisDesignSystem

struct MainView: View {
    init() {
        FontInjector.registerFonts()
    }
    
    @State private var isLoading = true

    var body: some View {
        NavigationView {
            ZStack {
                SplashView()
                    .isHidden(!isLoading, remove: !isLoading)
                OnboardingView()
                    .isHidden(isLoading, remove: isLoading)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(.default) {
                        isLoading = false
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
