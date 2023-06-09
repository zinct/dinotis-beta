//
//  File.swift
//
//
//  Created by Indra Mahesa on 02/06/23.
//

import Foundation
import Moya

public enum AuthTargetType {
    case checkCredential(LoginRequest)
}

extension AuthTargetType: ReusableTargetType {
    public var parameters: [String : Any] {
        switch self {
        case .checkCredential(let body) :
            return [
                "email": body.email,
                "password": body.password,
            ]
        }
    }
    
    public var path: String {
        switch self {
        case .checkCredential:
            return "/login"
        }
    }
    
    public var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
    public var method: Moya.Method {
        switch self {
        case .checkCredential:
            return .post
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        case .checkCredential:
            return JSONEncoding.default
        }
    }
}
