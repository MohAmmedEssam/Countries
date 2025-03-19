//
//  ListServiceTests.swift
//  CountriesTests
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import XCTest
@testable import CountriesModule

class ListServiceTests: XCTestCase {
    var service: MockListService!

    override func setUp() {
        super.setUp()
        service = MockListService()
    }

    override func tearDown() {
        service = nil
        super.tearDown()
    }

    func test_fetchCountries_success() async throws {
        let countries = try await service.fetchCountries()
        XCTAssertEqual(countries.count, 3)
    }

    func test_fetchCountries_failure() async {
        service = MockListService(shouldThrowError: true)
        do {
            _ = try await service.fetchCountries()
            XCTFail("Expected error but got success")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
