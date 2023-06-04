//
//  File.swift
//  
//
//  Created by Indra Mahesa on 02/06/23.
//

import Foundation

public class GetListVolumeDefaultUseCase: GetListComicUseCase {
    private let repository: ComicRepository
    
    public init(repository: ComicRepository = ComicDefaultRepository()) {
        self.repository = repository
    }
    
    public func execute() async -> Result<[VolumeData], Error> {
        do {
            let response = try await repository.getListVolume().results ?? []
            print(response)
            return .success(response)
        } catch(let error) {
            return .failure(error)
        }
    }
}
