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
//                ProfileView(viewModel: ProfileViewModel())
                if authViewModel.isLoginSuccess {
                    ProfileView(viewModel: ProfileViewModel())
                } else {
                    CreatorAuthView()
                }
//                EditProfileView() 
//                ProfileView()
//                SplashView()
//                    .isHidden(!isLoading, remove: !isLoading)
//                OnboardingView()
//                    .isHidden(isLoading, remove: isLoading)
//                AgendaView()
//                JokesView(viewModel: JokesViewModel())
//                ComicView(viewModel: ComicViewModel())
            }
            .environmentObject(authViewModel)
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
