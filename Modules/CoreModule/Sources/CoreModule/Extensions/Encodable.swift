//
//  Encodable.swift
//  CoreModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation

// MARK: - asDictionary convert any Codable model to dictionary
//
public extension Encodable {
    var asDictionary: [String: Any] {
        let serialized = (try? JSONSerialization.jsonObject(with: encoded, options: .allowFragments))
        return ((serialized as? [String: Any]) ?? [:]).compactMapValues { $0 }
    }
    
    private var encoded: Data {
        return (try? JSONEncoder().encode(self)) ?? Data()
    }
}
