//
//  MockListService.swift
//  CountriesTests
//
//  Created by Mohammed Essam on 20/03/2025.
//

import Foundation
import XCTest
@testable import Countries

class MockListService: ListServiceContract {
    var shouldThrowError = false

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
