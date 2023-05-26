//
//  SwiftUIView.swift
//  
//
//  Created by Indra Mahesa on 25/05/23.
//

import SwiftUI

public struct DinotisPrimaryTapBar: View {
    let label: String
    @Binding var currentId: String
    let id: String
    let namespace: Namespace.ID
    
    public init(
        label: String,
        currentId: Binding<String>,
        id: String,
        namespace: Namespace.ID
    ) {
        self.label = label
        self._currentId = currentId
        self.id = id
        self.namespace = namespace
    }
    
    public var body: some View {
        Button (action: {
            withAnimation(.easeInOut) {
                currentId = id
            }
        }) {
            VStack {
                Text(label)
                    .foregroundColor(currentId == id ? .primaryBlack : .primaryGrey)
                    .font(.robotoMedium(size: 14))
                    .padding(.horizontal, 15)
                    
                ZStack {
                    Rectangle()
                        .fill(Color.secondaryPurple)
                        .frame(height: 1)
                    
                    if currentId == id {
                        Rectangle()
                            .fill(Color.primaryPurple)
                            .frame(height: 1)
                            .matchedGeometryEffect(id: "navigation", in: namespace)
                    }
                }
                
            }
        }
            .frame(maxWidth: .infinity)
    }
}

struct DinotisPrimaryTapBar_Previews: PreviewProvider {
    struct TestView: View {
        @State private var currentIndex = "0"
        @Namespace private var animation
        
        var body: some View {
            HStack {
                DinotisPrimaryTapBar(label: "Semasdaasdasdsdua", currentId: $currentIndex, id: "0", namespace: animation)
                DinotisPrimaryTapBar(label: "Coasdasasdasddin", currentId: $currentIndex, id: "1", namespace: animation)
                DinotisPrimaryTapBar(label: "Coasdasdasdasdin", currentId: $currentIndex, id: "2", namespace: animation)
                DinotisPrimaryTapBar(label: "Coasdasasdasddin", currentId: $currentIndex, id: "3", namespace: animation)
            }
        }
    }
    
    static var previews: some View {
        TestView()
    }
}
