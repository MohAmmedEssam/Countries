//
//  NetworkError.swift
//  CoreModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation

// MARK: - NetworkError
//
public enum NetworkError: Error {
    case notData
    case other(code: Int? = nil, msg:String)
    
    var localizedDescription: String {
        switch self {
        case .other(_, let msg):
            return msg
        case .notData:
            return "No Data Found"
        }
    }
}
