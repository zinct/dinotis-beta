//
//  File.swift
//
//
//  Created by Indra Mahesa on 09/06/23.
//

import Foundation

public protocol CheckCredentialUseCase {
    func execute(credential: LoginRequest) async -> Result<LoginResponse, Error>
}

public class CheckCredentialUseCaseV1: CheckCredentialUseCase {
    private let repository: AuthRepository
    
    public init(repository: AuthRepository = AuthRepositoryV1()) {
        self.repository = repository
    }

    
    public func execute(credential: LoginRequest) async -> Result<LoginResponse, Error> {
        do {
            let response = try await repository.checkCredential(credential: credential)
            
            return .success(response)
        } catch(let error) {
            return .failure(error)
        }
    }
}
