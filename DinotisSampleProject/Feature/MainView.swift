//
//  MainView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 15/05/23.
//

import SwiftUI
import DinotisDesignSystem
import DinotisData

struct MainView: View {
    init() {
        FontInjector.registerFonts()
    }
    
    @State private var isLoading = true
    @StateObject var authViewModel: AuthViewModel = AuthViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                SplashView()
                    .isHidden(!isLoading, remove: !isLoading)
                OnboardingView()
                    .isHidden(isLoading, remove: isLoading)

            }
            .environmentObject(authViewModel)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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
