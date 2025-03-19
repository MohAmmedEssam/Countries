//
//  LocationManagerContract.swift
//  CoreModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import CoreLocation

public protocol LocationManagerContract: Sendable {
    func fetchCurrentLocation() async throws -> CLLocation
}
