//
//  File.swift
//  
//
//  Created by Indra Mahesa on 08/06/23.
//

import Foundation

public final class UserRepositoryV1: UserRepository {
    private let remote: UserRemoteDataSource
    
    public init(remote: UserRemoteDataSource = UserRemoteDataSourceV1()) {
        self.remote = remote
    }
    
    public func getListUser() async throws -> ListUserResponse {
        try await remote.getListUser()
    }
    
    public func getDetailUser(id: Int) async throws -> DetailUserResponse {
        try await remote.getDetailUser(id: id)
    }
    
    public func deleteUser(id: Int) async throws -> SuccessResponse {
        try await remote.deleteUser(id: id)
    }
    
    public func createUser(with query: CreateUserRequest) async throws -> CreateUserResponse {
        try await remote.createUser(query: query)
    }
}
