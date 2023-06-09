//
//  SwiftUIView.swift
//
//
//  Created by Indra Mahesa on 19/05/23.
//

import SwiftUI

public struct DinotisConfirmationModal: View {
    
    @Binding private var isModalOpen: Bool
    private var title: String
    private var bodyText: String
    private var onConfirm: () -> Void

    public init(
        title: String,
        bodyText: String,
        isModalOpen: Binding<Bool>,
        onConfirm: @escaping () -> Void
    ) {
        self.title = title
        self.bodyText = bodyText
        self._isModalOpen = isModalOpen
        self.onConfirm = onConfirm
    }
    
    public var body: some View {
        ZStack {
            Rectangle()
                .fill(.black.opacity(0.75))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onTapGesture {
                    withAnimation(.easeOut) {
                        isModalOpen = false
                    }
                }
            
            VStack(alignment: .leading) {
                GeometryReader { geometry in
                    VStack(alignment: .center) {
                        Text(title)
                            .font(.robotoBold(size: 16))
                            .foregroundColor(.primaryPurple)
                            .padding(.bottom, 12)
                        
                        Text(bodyText)
                            .font(.robotoLight(size: 12))
                            .foregroundColor(Color(hex: "#A0A4A8"))
                            .padding(.bottom, 12)
                        
                        
                        DinotisPrimaryButton(text: "Konfirmasi", type: .adaptiveScreen, textColor: .white, bgColor: .primaryRed) {
                            withAnimation(.easeOut) {
                                onConfirm()
                            }
                        }
                        
                        DinotisPrimaryButton(text: "Batal", type: .adaptiveScreen, textColor: .black, bgColor: .white) {
                            withAnimation(.easeOut) {
                                isModalOpen = false
                            }
                        }
                    }
                    .frame(width: geometry.size.width / 1.3)
                    .padding(.vertical, 24)
                    .padding(.horizontal, 20)
                    .background(.white)
                    .cornerRadius(8)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
            }
        }
        .isHidden(!isModalOpen, remove: !isModalOpen)
    }
}

struct DinotisConfirmationModal_Previews: PreviewProvider {
    static var previews: some View {
        DinotisAlertModal(title: "Data diri berhasil disimpan", bodyText: "This is body", isModalOpen: .constant(true))
    }
}
