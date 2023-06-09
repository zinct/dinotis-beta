//
//  EditProfileViewModel.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 08/06/23.
//

import SwiftUI
import DinotisData
import DinotisDesignSystem

final class ProfileViewModel: ObservableObject {
    @Published var isDeleteAccountModalOpen = false
    @Published var isAccountDeleted: DataState<SuccessResponse> = .idle
    
    private let deleteAccount: DeleteAccountUseCase
    
    public init(
        deleteAccount: DeleteAccountUseCase = DeleteAccountUseCaseV1()
    ) {
        self.deleteAccount = deleteAccount
    }
    
    func handleDeleteAccount() async {
        DispatchQueue.main.async { [weak self] in
            self?.isAccountDeleted = .loading
        }
        
        let result = await deleteAccount.execute()
        
        switch result {
        case .success(let success):
            DispatchQueue.main.async { [weak self] in
                self?.isAccountDeleted = .success(value: success)
            }
        case .failure(let failure):
            DispatchQueue.main.async { [weak self] in
                self?.isAccountDeleted = .error(failure)
            }
        }
    }
}
