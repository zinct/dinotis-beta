//
//  JokesViewModel.swift
//  DinotisSampleProject
//
//  Created by Irham Naufal on 28/05/23.
//

import Foundation
import DinotisData

final class JokesViewModel: ObservableObject {
    private let getRandomJokeUseCase: GetRandomJokeUseCase
    
    @Published var jokeText = ""
    @Published var isError = false
    @Published var isLoading = false
    @Published var errorText = ""
    
    init(getRandomJokeUseCase: GetRandomJokeUseCase = DefaultGetRandomJokeUseCase()) {
        self.getRandomJokeUseCase = getRandomJokeUseCase
    }
    
    func onStartRequest() {
        DispatchQueue.main.async { [weak self] in
            self?.isError = false
            self?.isLoading = true
        }
    }
    
    func getJoke() async {
        onStartRequest()
        let result = await getRandomJokeUseCase.execute()
        
        switch result {
        case .success(let success):
            DispatchQueue.main.async { [weak self] in
                self?.jokeText = success
                self?.isError = false
                self?.isLoading = false
            }
        case .failure(let failure):
            DispatchQueue.main.async { [weak self] in
                self?.isError = true
                self?.isLoading = false
                self?.errorText = failure.localizedDescription
            }
        }
    }
}
