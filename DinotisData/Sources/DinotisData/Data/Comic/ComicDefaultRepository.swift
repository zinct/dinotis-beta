//
//  File.swift
//  
//
//  Created by Indra Mahesa on 02/06/23.
//

import Foundation

public final class ComicDefaultRepository: ComicRepository {
    private let remote: ComicRemoteDataSource
    
    public init(remote: ComicRemoteDataSource = ComicDefaultDataSource()) {
        self.remote = remote
    }

    public func getListVolume() async throws -> VolumeResponse {
        try await remote.getListVolume()
    }
}
