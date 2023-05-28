//
//  File.swift
//  
//
//  Created by Irham Naufal on 28/05/23.
//

import Foundation
import Moya

protocol ReusableTargetType: TargetType {
    var parameters: [String: Any] {
        get
    }
}

extension ReusableTargetType {
    var baseURL: URL {
        return URL(string: "https://dev.api.dinotis.com/api/v1") ?? (NSURL() as URL)
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
