//
//  NetworkManager.swift
//  CoreModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation

// MARK: - Network Manager
//
public actor NetworkManager {
    lazy private var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .returnCacheDataElseLoad
        config.urlCache = URLCache(memoryCapacity: 50_000_000, diskCapacity: 100_000_000, diskPath: nil)
        return URLSession(configuration: config)
    }()

    public init() {}
}

// MARK: - Request
//
extension NetworkManager: NetworkServiceContract {
    public func request<T: Codable & Sendable>(_ request: URLRequest) async throws -> T {
#if DEBUG
        print("--------------------------------------------------------\n",
              "URL:            \(request.url?.absoluteString ?? "")\n",
              "data:           \((try? JSONSerialization.jsonObject(with: request.httpBody ?? Data(), options: []) as? [String: Any]) ?? [:])\n",
              "--------------------------------------------------------")
#endif
        
        let (data, response) = try await session.data(for: request)
        try response.checkValidation(with: data)
        return try JSONDecoder().decode(T.self, from: data)
    }
}

// MARK: - Validation
//
private extension URLResponse {
    func checkValidation(with data: Data) throws {
#if DEBUG
        print("--------------------------------------------------------\n",
              "URL:            \(url?.absoluteString ?? "")\n",
              "statusCode:     \((self as? HTTPURLResponse)?.statusCode ?? 0)\n",
              "data:           \((try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]) ?? [:])\n",
              "--------------------------------------------------------")
#endif
        
        guard let httpResponse = self as? HTTPURLResponse else {
            throw NetworkError.notData
        }
        
        guard ((200...299).contains(httpResponse.statusCode)) else {
            throw NetworkError.other(
                code: httpResponse.statusCode,
                msg: "Seems like something went wrong"
            )
        }
    }
}
