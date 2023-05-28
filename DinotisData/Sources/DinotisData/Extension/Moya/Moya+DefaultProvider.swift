//
//  File.swift
//  
//
//  Created by Irham Naufal on 28/05/23.
//

import Foundation
import Moya

public extension MoyaProvider {
    static func defaultProvider() -> MoyaProvider {
        return MoyaProvider(plugins: [NetworkLoggerPlugin()])
    }
}
