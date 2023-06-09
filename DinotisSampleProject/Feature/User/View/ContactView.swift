//
//  ContactView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 08/06/23.
//

import SwiftUI
import DinotisDesignSystem

struct ContactView: View {
    @ObservedObject var viewModel: ContactViewModel = ContactViewModel()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            if viewModel.data == .loading {
                HStack {
                    Spacer()
                    ProgressView()
                        .scaleEffect(2)
                    Spacer()
                }
                .padding(.vertical, 100)
            } else {
                VStack(alignment: .leading) {
                    DinotisSecondaryTopBar(title: "Kontak")
                    
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ]) {
                            ForEach(viewModel.data.value?.data ?? [], id: \.self) { row in
                                ZStack(alignment: .bottom) {
                                    DinotisImageLoader(imageURL: row.avatar)
                                    
                                    HStack {
                                        Text("\(row.firstName) \(row.lastName)")
                                            .font(.robotoBold(size: 15))
                                            .foregroundColor(.white)
                                        
                                        Image.icVerifiedCommon
                                        
                                        Spacer()
                                    }
                                    .padding(.horizontal, 8)
                                    .padding(.bottom, 10)
                                    .lineLimit(1)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    
                        .navigationBarBackButtonHidden(true)
                }
                .padding(.horizontal, 24)
                
            }
        }
        .onAppear {
            Task {
                await viewModel.getData()
            }            
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
