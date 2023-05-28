//
//  JokesView.swift
//  DinotisSampleProject
//
//  Created by Irham Naufal on 28/05/23.
//

import SwiftUI
import DinotisDesignSystem

struct JokesView: View {
    
    @ObservedObject var viewModel: JokesViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Today's Joke:")
                .font(.robotoBold(size: 24))
            
            Text(viewModel.jokeText)
                .font(.robotoBold(size: 16))
                .multilineTextAlignment(.center)
            
            Text(viewModel.errorText)
                .font(.robotoBold(size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
            
            DinotisPrimaryButton(
                text: "Get a Joke",
                type: .adaptiveScreen,
                textColor: .white,
                bgColor: .primaryPurple) {
                    Task {
                        await viewModel.getJoke()
                    }
                }
        }
        .padding()
        .overlay {
            if viewModel.isLoading {
                ZStack {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                    
                    ProgressView()
                }
            }
        }
    }
}

struct JokesView_Previews: PreviewProvider {
    static var previews: some View {
        JokesView(viewModel: JokesViewModel())
    }
}
