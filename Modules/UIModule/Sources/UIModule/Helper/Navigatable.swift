//
//  Navigatable.swift
//  UIModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import SwiftUI

public protocol NavigatablePath: View, Hashable {}

/// A type-erased wrapper for navigation destinations.
public struct NavigationDestination: Hashable {
    public let id: String
    public let view: AnyView

    public init<T: NavigatablePath>(_ destination: T, id: String = UUID().uuidString) {
        self.id = id
        self.view = AnyView(destination)
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
