//
//  File.swift
//  
//
//  Created by Indra Mahesa on 09/06/23.
//

import Foundation

public protocol AuthRepository {
    func checkCredential(credential: LoginRequest) async throws -> LoginResponse
}
