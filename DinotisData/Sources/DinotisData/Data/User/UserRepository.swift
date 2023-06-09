//
//  File.swift
//  
//
//  Created by Indra Mahesa on 08/06/23.
//

import Foundation

public protocol UserRepository {
    func getListUser() async throws -> ListUserResponse
    func getDetailUser(id: Int) async throws -> DetailUserResponse
    func deleteUser(id: Int) async throws -> SuccessResponse
    func createUser(with query: CreateUserRequest) async throws -> CreateUserResponse
}
