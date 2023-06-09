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

enum DataState<T> {
    case idle, loading, success(value: T), error(Error)
    
    var value: T? {
        if case let .success(value) = self {
            return value
        }
        return nil
    }
    
    var error: Error? {
        if case let .error(error) = self {
            return error
        }
        return nil
    }
}

struct CustomError: Error {
    let message: String
}

extension DataState: Equatable where T: Equatable {
    static func == (lhs: DataState<T>, rhs: DataState<T>) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle),
            (.loading, .loading):
            return true
        case (.success(let lhsValue), .success(let rhsValue)):
            return lhsValue == rhsValue
        default:
            return false
        }
    }
}

class ComicViewModel: ObservableObject {
    private let getListVolumeUseCase: GetListComicUseCase
    
    @Published var status: ComicStatus = .idle
    @Published var data: [VolumeData]?
    
    @Published var dummyData: DataState<[VolumeData]> = .idle
    
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
                self?.dummyData = .success(value: data)
            }
        case .failure(let failure):
            DispatchQueue.main.async { [weak self] in
                self?.status = .error(failure.localizedDescription)
                self?.dummyData = .error(failure)
            }
        }
    }
}
