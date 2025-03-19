//
//  AppRouter.swift
//  UIModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import SwiftUI

@MainActor
public class AppRouter: ObservableObject {
    @Published public var stackPaths = NavigationPath()
    
    public static let shared = AppRouter()
    private init() {}
}

public extension AppRouter {
    /// Pushes any object that conforms to `NavigatablePath`
    func push<T: NavigatablePath>(_ path: T) {
        let destination = NavigationDestination(path)
        stackPaths.append(destination)
    }

    /// Pops the last N items from the stack.
    func popLast(_ num: Int = 1) {
        guard num > 0 else { return }
        stackPaths.removeLast(min(num, stackPaths.count))
    }

    /// Clears the stack (back to root).
    func popToRoot() {
        stackPaths = NavigationPath()
    }
}
