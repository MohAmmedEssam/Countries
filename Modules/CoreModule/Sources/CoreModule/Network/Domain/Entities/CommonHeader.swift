//
//  CommonHeader.swift
//  CoreModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation

//MARK: - CommonHeader
public struct CommonHeader: Codable {
    var accept: String = "application/json"
    var content: String = "application/json"
    
    enum CodingKeys: String, CodingKey {
        case accept = "Accept"
        case content = "Content-Type"
    }
}
