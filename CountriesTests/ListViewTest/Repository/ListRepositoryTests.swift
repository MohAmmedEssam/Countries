//
//  ListRepositoryTests.swift
//  CountriesTests
//
//  Created by Mohammed Essam on 20/03/2025.
//

import Foundation
import XCTest
@testable import Countries

class ListRepositoryTests: XCTestCase {
    var repository: ListRepositoryImpl!
    var service: MockListService!

    override func setUp() {
        super.setUp()
        service = MockListService()
        repository = ListRepositoryImpl(service: service)
    }

    override func tearDown() {
        repository = nil
        service = nil
        super.tearDown()
    }

    func test_fetchCountries_success() async throws {
        let countries = try await repository.fetchCountries()
        XCTAssertEqual(countries.count, 2)
    }

    func test_fetchCountries_failure() async {
        service.shouldThrowError = true
        do {
            _ = try await repository.fetchCountries()
            XCTFail("Expected error but got success")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
