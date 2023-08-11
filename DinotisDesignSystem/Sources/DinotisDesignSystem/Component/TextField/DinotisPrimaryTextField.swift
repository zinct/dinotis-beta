//
//  SwiftUIView.swift
//  
//
//  Created by Indra Mahesa on 16/05/23.
//

import SwiftUI

public struct DinotisPrimaryTextField<Prefix: View, Suffix: View>: View {
    @Binding public var text: String
    private let title: String
    private let prefix: Prefix
    private let suffix: Suffix
    private let secured: Bool
    private let validator: () -> String?
    
    public init(
        _ title: String,
        text: Binding<String>,
        secured: Bool = false,
        validator: @escaping () -> String? = {nil},
        @ViewBuilder prefix: () -> Prefix = {EmptyView()},
        @ViewBuilder suffix: () -> Suffix = {EmptyView()}
    ) {
        self.title = title
        self._text = text
        self.secured = secured
        self.validator = validator
        self.prefix = prefix()
        self.suffix = suffix()
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                prefix
                
                if !secured {
                    TextField(title, text: $text)
                        .font(.robotoLight(size: 12))
                        .accentColor(.primaryPurple)
                } else {
                    SecureField(title, text: $text)
                        .font(.robotoLight(size: 12))
                        .accentColor(.primaryPurple)
                }
                
                
                suffix
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 16)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .inset(by: 0.5)
                    .stroke(Color(hex: "#CACCCF") ?? Color.secondary, lineWidth: 0.5)
            )
            .padding(.bottom, 5)
            
        }
        
        HStack {
            Text(validator() ?? "")
                .font(.robotoBold(size: 10))
                .foregroundColor(Color(hex: "##EA2036"))
                
            Spacer()
        }
        .padding(.top, -8)
        .isHidden(validator() == nil, remove: validator() == nil)
        
    }
}

struct DinotisPrimaryTextField_Previews: PreviewProvider {
    struct TestView: View {
        @State private var phone = ""
        
        var body: some View {
            VStack {
                DinotisPrimaryTextField("Haloo", text: $phone)
                
                DinotisPrimaryTextField(
                    "Text Field 2",
                    text: $phone,
                    secured: false) {
                        "Error"
                    } prefix: {
                        Image.imgCreatorsRole
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32)
                    } suffix: {
                        Text("Yoiiii")
                    }

            }
        }
    }
    
    static var previews: some View {
        TestView()
    }
}
