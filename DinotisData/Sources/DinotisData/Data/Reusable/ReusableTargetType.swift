//
//  File.swift
//  
//
//  Created by Irham Naufal on 28/05/23.
//

import Foundation
import Moya

public protocol ReusableTargetType: Moya.TargetType {
    var parameters: [String: Any] {
        get
    }
}

public extension ReusableTargetType {
    var baseURL: URL {
        return URL(string: "https://reqres.in/api") ?? (NSURL() as URL)
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        JSONEncoding.default
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
