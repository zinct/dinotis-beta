//
//  File.swift
//  
//
//  Created by Indra Mahesa on 02/06/23.
//

import Foundation
import Moya

public enum ComicTargetType {
    case getListVolume
}

extension ComicTargetType: ReusableTargetType {
    var parameterEncoding: Moya.ParameterEncoding {
        URLEncoding.default
    }
    
    public var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
    public var parameters: [String : Any] {
        return ["format" : "json", "api_key" : "2d7ab313077936c86f1890649ee5e04d18926429"]
    }
    
    public var path: String {
        switch self {
        case .getListVolume:
            return "/volumes"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }    
}
