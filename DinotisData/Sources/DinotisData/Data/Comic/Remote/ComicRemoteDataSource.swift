//
//  File.swift
//  
//
//  Created by Indra Mahesa on 02/06/23.
//

import Foundation

public protocol ComicRemoteDataSource {
    func getListVolume() async throws -> VolumeResponse
}
