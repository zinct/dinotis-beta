//
//  ComicViewModel.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 02/06/23.
//

import Foundation
import DinotisData

enum ComicStatus: Equatable {
    case idle, loading, success, error(String)
}

class ComicViewModel: ObservableObject {
    private let getListVolumeUseCase: GetListComicUseCase
    
    @Published var status: ComicStatus = .idle
    @Published var data: VolumeResponse?
    
    public init(
        getListVolumeUseCase: GetListComicUseCase = GetListVolumeDefaultUseCase()
    ) {
        self.getListVolumeUseCase = getListVolumeUseCase
    }
    
    func onStartRequest() {
        DispatchQueue.main.async { [weak self] in
            self?.status = .loading
        }
    }
    
    func getData() async {
        onStartRequest()
        let result = await getListVolumeUseCase.execute()
        switch result {
        case .success(let data):
            DispatchQueue.main.async { [weak self] in
                self?.status = .success
                self?.data = data
            }
        case .failure(let failure):
            DispatchQueue.main.async { [weak self] in
                self?.status = .error(failure.localizedDescription)
            }
        }
    }
}
