//
//  File.swift
//  
//
//  Created by Indra Mahesa on 02/06/23.
//

import Foundation
import Moya

public final class ComicDefaultDataSource: ComicRemoteDataSource {
    private let provider: MoyaProvider<ComicTargetType>
    
    public init(provider: MoyaProvider<ComicTargetType> = .defaultProvider()) {
        self.provider = provider
    }
    
    public func getListVolume() async throws -> VolumeResponse {
        try await self.provider.requestAsync(.getListVolume, model: VolumeResponse.self)
    }
}
