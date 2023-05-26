//
//  OnboardingView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 14/05/23.
//

import SwiftUI
import DinotisDesignSystem

enum TabViewType {
    case next, back
}

struct OnboardingView: View {
    @State private var selectedIndex = "0"
    @Namespace private var animation
    
    func handleTabView(type: TabViewType) {
        if type == .next {
            withAnimation {
                if (Int(selectedIndex) ?? 0) >= 1 {
                    return
                }
                selectedIndex = String((Int(selectedIndex) ?? 0) + 1)
            }
        } else {
            withAnimation {
                if (Int(selectedIndex) ?? 0) <= 0 {
                    return
                }
                selectedIndex = String((Int(selectedIndex) ?? 0) - 1)
            }
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: RoleView()) {
                        Text(LocalizableText.skip)
                            .font(.robotoBold(size: 14))
                            .foregroundColor(.primaryGrey)
                            .padding(.trailing, 24)
                    }
                }
                
                Spacer()
                
                TabView(selection: $selectedIndex) {
                    Onboarding1View()
                        .tag("0")
                    Onboarding2View()
                        .tag("1")
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .padding(.horizontal, 20)
                
                HStack {
                    IndexTabViewComponent(currentId: $selectedIndex, id: "0", namespace: animation)
                    IndexTabViewComponent(currentId: $selectedIndex, id: "1", namespace: animation)
                }
                .padding(.top, -130)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        handleTabView(type: .back)
                    }) {
                        Text(LocalizableText.next)
                            .font(.robotoBold(size: 14))
                            .foregroundColor(.primaryGrey)
                    }
                    .isHidden(selectedIndex == "0")
                    
                    Spacer()
                    
                    NavigationLink(destination: RoleView()) {
                        Text(LocalizableText.next)
                            .font(.robotoBold(size: 14))
                            .foregroundColor(.primaryPurple)
                    }
                    .isHidden((Int(selectedIndex) ?? 0) < 1, remove: (Int(selectedIndex) ?? 0) < 1)
                    
                    Button(action: {
                        handleTabView(type: .next)
                    }) {
                        Text(LocalizableText.next)
                            .font(.robotoBold(size: 14))
                            .foregroundColor(.primaryPurple)
                    }
                    .isHidden((Int(selectedIndex) ?? 0) >= 1, remove: (Int(selectedIndex) ?? 0) >= 1)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct Onboarding1View: View {
    var body: some View {
        VStack(alignment: .center) {
            Image.imgBoard1Onboarding
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 41)
                .padding(.bottom, -23)
            
            VStack {
                Text(LocalizableText.onboard1Title)
                    .font(.robotoBold(size: 20))
                    .padding(.bottom, 7)
                    .foregroundColor(.primaryBlack)
                
                Text(LocalizableText.onboard1Body)
                    .font(.robotoRegular(size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondaryBlack)
            }
            .padding(.horizontal, 46)
        }
    }
}

struct Onboarding2View: View {
    var body: some View {
        VStack(alignment: .center) {
            Image.imgBoard2Onboarding
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 41)
                .padding(.bottom, -23)
            
            VStack {
                Text(LocalizableText.onboard2Title)
                    .font(.robotoBold(size: 20))
                    .padding(.bottom, 7)
                    .foregroundColor(.primaryBlack)
                
                Text(LocalizableText.onboard2Body)
                    .font(.robotoRegular(size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primaryBlack)
            }
            .padding(.horizontal, 46)
        }
    }
}

struct IndexTabViewComponent: View {
    @Binding var currentId: String
    let id: String
    let namespace: Namespace.ID
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.secondaryPurple)
                .frame(width: 21, height: 5)
                
            if currentId == id {
                Rectangle()
                    .fill(Color.primaryPurple)
                    .frame(width: 21, height: 5)
            }
        }
    }
}
