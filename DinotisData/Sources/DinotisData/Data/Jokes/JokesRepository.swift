//
//  File.swift
//  
//
//  Created by Irham Naufal on 28/05/23.
//

import Foundation

public protocol JokesRepository {
    func getRandomJoke() async throws -> JokesResponse
    func getRandomJokeByCategory(category: String) async throws -> JokesResponse
}

public class DefaultJokesRepository: JokesRepository {
    
    private let remoteDataSource: JokesRemoteDataSource
    
    public init(remoteDataSource: JokesRemoteDataSource = DefaultJokesRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    public func getRandomJoke() async throws -> JokesResponse {
        try await remoteDataSource.getRandomJoke()
    }
    
    public func getRandomJokeByCategory(category: String) async throws -> JokesResponse {
        try await remoteDataSource.getRandomJokeByCategory(category: category)
    }
}
