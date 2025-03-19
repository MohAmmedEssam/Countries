//
//  NetworkRequestBuilder.swift
//  CoreModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation

public class NetworkRequestBuilder {
    private var request: URLRequest
    
    public init(baseURL: String) {
        request = URLRequest(url: URL(string: baseURL)!)
        _ = setMethod(.get)
        _ = setHeaders(CommonHeader().asDictionary as? [String: String] ?? [:])
    }
}

public extension NetworkRequestBuilder {
    @discardableResult
    func setPath(_ path: String) -> Self {
        guard let baseURL = request.url else { return self }
        let path = path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? path
        request.url = baseURL.appendingPathComponent(path)
        return self
    }
    
    @discardableResult
    func setMethod(_ method: String) -> Self {
        request.httpMethod = method
        return self
    }
    @discardableResult
    func setMethod(_ method: RequestMethod) -> Self {
        request.httpMethod = method.rawValue
        return self
    }
    
    @discardableResult
    func setHeaders(_ headers: [String: String]) -> Self {
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        return self
    }
    
    @discardableResult
    func setBody(_ body: Data?) -> Self {
        request.httpBody = body
        return self
    }
    @discardableResult
    func setBody(_ body: [String: Any]) -> Self {
        request.httpBody =  try? JSONSerialization.data(withJSONObject: body, options: [.prettyPrinted])
        return self
    }
    
    @discardableResult
    func setQuery(_ parameters: [String: String]) -> Self {
        guard let url = request.url else { return self }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        request.url = components?.url
        return self
    }
    
    func build() -> URLRequest {
        return request
    }
}
