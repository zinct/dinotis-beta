//
//  File.swift
//  
//
//  Created by Irham Naufal on 28/05/23.
//

import Foundation
import Moya

public protocol JokesRemoteDataSource {
    func getRandomJoke() async throws -> JokesResponse
    func getRandomJokeByCategory(category: String) async throws -> JokesResponse
}

public class DefaultJokesRemoteDataSource: JokesRemoteDataSource {
    private let provider: MoyaProvider<JokesTargetType>
    
    public init(provider: MoyaProvider<JokesTargetType> = .defaultProvider()) {
        self.provider = provider
    }
    
    public func getRandomJoke() async throws -> JokesResponse {
        try await provider.requestAsync(.getRandomJoke, model: JokesResponse.self)
    }
    
    public func getRandomJokeByCategory(category: String) async throws -> JokesResponse {
        try await provider.requestAsync(.getRandomJokeByCategory(category), model: JokesResponse.self)
    }
}
