//
//  DataState.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 01/08/23.
//

import Foundation

enum DataState<T> {
    case idle, loading, success(value: T), error(Error)
    
    var value: T? {
        if case let .success(value) = self {
            return value
        }
        return nil
    }
    
    var error: Error? {
        if case let .error(error) = self {
            return error
        }
        return nil
    }
}

struct CustomError: Error {
    let message: String
}

extension DataState: Equatable where T: Equatable {
    static func == (lhs: DataState<T>, rhs: DataState<T>) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle),
            (.loading, .loading):
            return true
        case (.success(let lhsValue), .success(let rhsValue)):
            return lhsValue == rhsValue
        default:
            return false
        }
    }
}
