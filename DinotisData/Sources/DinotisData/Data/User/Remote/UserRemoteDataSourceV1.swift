//
//  File.swift
//  
//
//  Created by Indra Mahesa on 08/06/23.
//

import Foundation
import Moya

public final class UserRemoteDataSourceV1: UserRemoteDataSource {
    private let provider: MoyaProvider<UserTargetType>
    
    public init(provider: MoyaProvider<UserTargetType> = .defaultProvider()) {
        self.provider = provider
    }
    
    public func getListUser() async throws -> ListUserResponse {
        try await self.provider.requestAsync(.getListUser, model: ListUserResponse.self)
    }
    
    public func getDetailUser(id: Int) async throws -> DetailUserResponse {
        try await self.provider.requestAsync(.getUser, model: DetailUserResponse.self)
    }
    
    public func deleteUser(id: Int) async throws -> SuccessResponse {
        try await self.provider.requestAsync(.deleteUser(id), model: SuccessResponse.self)
    }
    
    public func createUser(query: CreateUserRequest) async throws -> CreateUserResponse {
        try await self.provider.requestAsync(.createUser, model: CreateUserResponse.self)
    }
}
