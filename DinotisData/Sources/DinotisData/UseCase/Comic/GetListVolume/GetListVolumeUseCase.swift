//
//  File.swift
//  
//
//  Created by Indra Mahesa on 02/06/23.
//

import Foundation

public protocol GetListComicUseCase {
    func execute() async -> Result<[VolumeData], Error>
}
