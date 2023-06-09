//
//  File.swift
//  
//
//  Created by Indra Mahesa on 09/06/23.
//

import Foundation

public protocol GetListUserUseCase {
    func execute() async -> Result<ListUserResponse, Error>
}

public class GetListUserUseCaseV1: GetListUserUseCase {
    
    private let repository: UserRepository
    
    public init(repository: UserRepository = UserRepositoryV1()) {
        self.repository = repository
    }
    
    public func execute() async -> Result<ListUserResponse, Error> {
        do {
            let response = try await repository.getListUser()
            
            return .success(response)
        } catch(let error) {
            return .failure(error)
        }
    }
}
