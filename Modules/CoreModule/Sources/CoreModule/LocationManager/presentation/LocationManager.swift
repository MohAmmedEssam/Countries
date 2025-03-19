//
//  LocationManager.swift
//  CoreModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import CoreLocation

public actor LocationManager: LocationManagerContract {
    private let manager = LocationManagerClass()
    
    public init () {}
    
    public func fetchCurrentLocation() async throws -> CLLocation {
        return try await withCheckedThrowingContinuation { continuation in
            manager.fetchCurrentLocation { location, error in
                if let location = location {
                    continuation.resume(returning: location)
                } else {
                    continuation.resume(throwing: error!)
                }
            }
        }
    }
}

fileprivate class LocationManagerClass: NSObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    private var completion: ((CLLocation?, Error?) -> Void)?

    override init() {
        super.init()
        manager.delegate = self
    }
    
    func fetchCurrentLocation(_ completion: @escaping (CLLocation?, Error?) -> Void) {
        self.completion = completion
        manager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            manager.startUpdatingLocation()
        default:
            completion?(nil,  NSError(domain: "UnAuthorized", code: -1))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        manager.stopUpdatingLocation()
        completion?(location, nil)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        completion?(nil, error)
    }
}
