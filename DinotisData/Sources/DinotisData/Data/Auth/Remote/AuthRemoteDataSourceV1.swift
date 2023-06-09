//
//  File.swift
//  
//
//  Created by Indra Mahesa on 09/06/23.
//

import Foundation
import Moya

public final class AuthRemoteDataSourceV1: AuthRemoteDataSource {
    private let provider: MoyaProvider<AuthTargetType>
    
    public init(provider: MoyaProvider<AuthTargetType> = .defaultProvider()) {
        self.provider = provider
    }
    
    public func checkCredential(credential: LoginRequest) async throws -> LoginResponse {
        try await provider.requestAsync(.checkCredential(credential), model: LoginResponse.self)
    }
}
