//
//  NetworkServiceContract.swift
//  CoreModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation

// MARK: - NetworkServiceContract
public protocol NetworkServiceContract: Sendable {
    func request<T: Codable>(_ request: URLRequest) async throws -> T
}
