//
//  File.swift
//
//
//  Created by Indra Mahesa on 02/06/23.
//

import Foundation
import Moya

public enum UserTargetType {
    case getListUser
    case getUser
    case createUser
    case updateUser
    case deleteUser(Int)
}

extension UserTargetType: ReusableTargetType {
    public var parameters: [String : Any] {
        return [:]
    }
    
    public var path: String {
        switch self {
        case .getListUser:
            return "/users"
        case .deleteUser(let id):
            return "/users/\(id)"
        case .getUser, .createUser, .updateUser:
            return "/users"
        }
    }
    
    public var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
    public var method: Moya.Method {
        switch self {
        case .getListUser, .getUser, .createUser, .updateUser:
            return .get
        case .deleteUser:
            return .delete
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        case .getListUser, .getUser, .createUser, .updateUser:
            return URLEncoding.default
        case .deleteUser:
            return JSONEncoding.default
        }
    }
}
