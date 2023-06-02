//
//  ComicRepository.swift
//  
//
//  Created by Indra Mahesa on 02/06/23.
//

import Foundation

public protocol ComicRepository {
    func getListVolume() async throws -> VolumeResponse
}
