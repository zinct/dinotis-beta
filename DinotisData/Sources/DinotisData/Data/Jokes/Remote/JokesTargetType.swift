//
//  File.swift
//  
//
//  Created by Irham Naufal on 28/05/23.
//

import Foundation
import Moya

public enum JokesTargetType {
    case getRandomJoke
    case getRandomJokeByCategory(String)
}

extension JokesTargetType: ReusableTargetType {
    
    public var authorizationType: AuthorizationType? {
        return .none
    }
    
    public var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        case .getRandomJoke:
            return URLEncoding.default
        case .getRandomJokeByCategory:
            return URLEncoding.queryString
        }
    }
    
    public var parameters: [String : Any] {
        switch self {
        case .getRandomJokeByCategory(let category):
//            return [
//                "category" : category,
//                "id" : category
//            ]
            return ["category" : category]
        default:
            return [:]
        }
    }
    
    public var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
    public var path: String {
        return "jokes/random"
    }
    
    public var method: Moya.Method {
//        switch self {
//        case .getRandomJoke:
//            return .get
//        case .getRandomJokeByCategory:
//            return .get
//        }
        return .get
    }
}
