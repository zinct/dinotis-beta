//
//  File.swift
//  
//
//  Created by Indra Mahesa on 08/06/23.
//

import Foundation

public protocol UserRemoteDataSource {
    func getListUser() async throws -> ListUserResponse
    func getDetailUser(id: Int) async throws -> DetailUserResponse
    func deleteUser(id: Int) async throws -> SuccessResponse
    func createUser(query: CreateUserRequest) async throws -> CreateUserResponse
}
