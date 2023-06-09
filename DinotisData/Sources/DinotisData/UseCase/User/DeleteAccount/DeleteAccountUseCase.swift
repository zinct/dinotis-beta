//
//  File.swift
//
//
//  Created by Indra Mahesa on 09/06/23.
//

import Foundation

public protocol DeleteAccountUseCase {
    func execute() async -> Result<SuccessResponse, Error>
}

public class DeleteAccountUseCaseV1: DeleteAccountUseCase {
    
    private let repository: UserRepository
    
    public init(repository: UserRepository = UserRepositoryV1()) {
        self.repository = repository
    }
    
    public func execute() async -> Result<SuccessResponse, Error> {
        do {
            let response = try await repository.deleteUser(id: 2)
            
            return .success(response)
        } catch(let error) {
            return .failure(error)
        }
    }
}
