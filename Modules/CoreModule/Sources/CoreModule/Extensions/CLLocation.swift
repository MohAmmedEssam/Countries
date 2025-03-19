//
//  CLLocation.swift
//  CoreModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import CoreLocation

public extension CLLocation {
    func fetchCountryName() async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(self) { placemarks, error in
                if let country = placemarks?.first?.country {
                    continuation.resume(returning: country)
                } else {
                    continuation.resume(throwing: error ??  NSError(domain: "GeocodingError", code: -1))
                }
            }
        }
    }
}
