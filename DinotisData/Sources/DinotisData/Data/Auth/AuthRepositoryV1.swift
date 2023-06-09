//
//  File.swift
//  
//
//  Created by Indra Mahesa on 09/06/23.
//

import Foundation

public final class AuthRepositoryV1: AuthRepository {
    private let remote: AuthRemoteDataSource
    
    public init(remote: AuthRemoteDataSource = AuthRemoteDataSourceV1()) {
        self.remote = remote
    }
    
    public func checkCredential(credential: LoginRequest) async throws -> LoginResponse {
        try await remote.checkCredential(credential: credential)
    }
}
