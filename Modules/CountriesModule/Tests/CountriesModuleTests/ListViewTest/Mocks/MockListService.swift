//
//  MockListService.swift
//  CountriesTests
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import XCTest
@testable import CountriesModule

final class MockListService: ListServiceContract {
    let shouldThrowError: Bool

    init(shouldThrowError: Bool = false) {
        self.shouldThrowError = shouldThrowError
    }
    
    func fetchCountries() async throws -> [Country] {
        if shouldThrowError {
            throw NSError(domain: "Network Error", code: -1, userInfo: nil)
        }
        return [
            CountriesProvider.getCountryWithName("Egypt"),
            CountriesProvider.getCountryWithName("Canada"),
            CountriesProvider.getCountryWithName("Germany")
        ]
    }
}
