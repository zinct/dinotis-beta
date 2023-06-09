//
//  EditProfileViewModel.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 08/06/23.
//

import SwiftUI
import DinotisData
import DinotisDesignSystem

class ContactViewModel: ObservableObject {
    private let getListUserUseCase: GetListUserUseCase
    
    @Published var data: DataState<ListUserResponse> = .idle
    
    public init(
        getListUserUseCase: GetListUserUseCase = GetListUserUseCaseV1()
    ) {
        self.getListUserUseCase = getListUserUseCase
    }
    
    func onStartRequest() {
        DispatchQueue.main.async { [weak self] in
            self?.data = .loading
        }
    }
    
    func getData() async {
        onStartRequest()
        let result = await getListUserUseCase.execute()
        switch result {
        case .success(let data):
            print(data)
            DispatchQueue.main.async { [weak self] in
                self?.data = .success(value: data)
            }
        case .failure(let failure):
            DispatchQueue.main.async { [weak self] in
                self?.data = .error(failure)
            }
        }
    }
}
