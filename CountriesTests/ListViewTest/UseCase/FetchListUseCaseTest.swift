//
//  FetchListUseCaseTest.swift
//  CountriesTests
//
//  Created by Mohammed Essam on 20/03/2025.
//

import Foundation
import XCTest
@testable import Countries

class FetchListUseCaseTests: XCTestCase {
    var useCase: FetchListUseCaseImpl!
    var repository: MockListRepository!
    var service: MockListService!

    override func setUp() {
        super.setUp()
        service = MockListService()
        repository = MockListRepository(service: service)
        useCase = FetchListUseCaseImpl(repository: repository)
    }

    override func tearDown() {
        useCase = nil
        repository = nil
        service = nil
        super.tearDown()
    }

    func test_execute_success() async throws {
        let countries = try await useCase.execute()
        XCTAssertEqual(countries.count, 2)
    }

    func test_execute_failure() async {
        service.shouldThrowError = true
        do {
            _ = try await useCase.execute()
            XCTFail("Expected error but got success")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
