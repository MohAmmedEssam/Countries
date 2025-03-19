//
//  ActivityIndicator.swift
//  CoreModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import SwiftUI

@MainActor public final class NetworkActivityIndicator: ObservableObject {
    private var counter: Int = 0
    @Published public var isLoading: Bool = false
    
    public static let shared = NetworkActivityIndicator()
    private init() {}
}

public extension NetworkActivityIndicator {
    func startLoading() {
        counter += 1
        updatePublisher()
    }
    
    func stopLoading() {
        counter -= 1
        updatePublisher()
    }
    
    private func updatePublisher() {
        isLoading = (counter != 0)
    }
}
