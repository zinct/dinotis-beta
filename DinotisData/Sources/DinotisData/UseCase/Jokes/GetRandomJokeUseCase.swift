//
//  File.swift
//  
//
//  Created by Irham Naufal on 28/05/23.
//

import Foundation

public struct GetJokeUseCaseResponse {
    var joke: String?
    var id: String?
    
    public init(joke: String? = nil, id: String? = nil) {
        self.joke = joke
        self.id = id
    }
}

public protocol GetRandomJokeUseCase {
//    func execute() async -> Result<GetJokeUseCaseResponse, Error>
    func execute() async -> Result<String, Error>
}

public class DefaultGetRandomJokeUseCase: GetRandomJokeUseCase {
    
    private let repository: JokesRepository
    
    public init(repository: JokesRepository = DefaultJokesRepository()) {
        self.repository = repository
    }
    
    public func execute() async -> Result<String, Error> {
        do {
            let response = try await repository.getRandomJoke()
//            let result = GetJokeUseCaseResponse(joke: response.value, id: response.id)
            
            return .success(response.value.orEmpty())
        } catch(let error) {
            return .failure(error)
        }
    }
}
