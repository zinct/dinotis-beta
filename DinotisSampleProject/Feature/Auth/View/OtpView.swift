//
//  LoginView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 14/05/23.
//

import SwiftUI
import DinotisDesignSystem

struct OtpView: View {
    
    @ObservedObject var viewModel: OtpViewModel = OtpViewModel()
    @FocusState var isOtpShowed
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack {
                DinotisIntroTopBar()
                
                ScrollView {
                    Text(LocalizableText.registerTitle)
                        .font(.robotoBold(size: 28))
                        .foregroundColor(.primaryBlack)
                        .padding(.bottom, 20)
                    
                    Text(LocalizableText.otpTitle)
                        .font(.robotoLight(size: 12))
                        .foregroundColor(.secondaryBlack)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 0.1)
                    
                    Text("+62 853 2703 4142")
                        .font(.robotoBold(size: 20))
                        .foregroundColor(.primaryBlack)
                        .padding(.bottom, 10)
                    
                    HStack {
                        ForEach(0..<6, id: \.self) {index in
                            ZStack {
                                if viewModel.otp.count > index {
                                    let startIndex = viewModel.otp.startIndex
                                    let charIndex = viewModel.otp.index(startIndex, offsetBy: index)
                                    let chartToString = String(viewModel.otp[charIndex])
                                    Text(chartToString)
                                } else {
                                    Text(" ")
                                }
                            }
                            .frame(width: 39, height: 41)
                            .background {
                                RoundedRectangle(cornerRadius: 6, style: .continuous)
                                    .stroke(Color.secondaryGrey, lineWidth: 0.5)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .background {
                        TextField("", text: $viewModel.otp.limit(6))
                            .frame(width: 1, height: 1)
                            .opacity(0.001)
                            .blendMode(.screen)
                            .focused($isOtpShowed)
                            .keyboardType(.numberPad)
                            .textContentType(.oneTimeCode)
                    }
                    .padding(.horizontal, 24)
                    .onTapGesture {
                        isOtpShowed.toggle()
                    }
                    .padding(.bottom, 16)
                    
                    Group {
                        Text(LocalizableText.otpNotSended) +

                        Text(" \(LocalizableText.sendAgain)")
                            .foregroundColor(.primaryPurple)
                    }
                    .font(.robotoRegular(size: 10))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primaryGrey)
                    .padding(.bottom, 10)
                    
                }
                
                Spacer()
            }
            .padding(.horizontal, 24)
            .navigationBarBackButtonHidden()
        }
    }
}

extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            self.wrappedValue = String(self.wrappedValue.prefix(length))
        }
        return self
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OtpView()
    }
}
