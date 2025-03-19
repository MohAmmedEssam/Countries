//
//  MockListRepository.swift
//  CountriesTests
//
//  Created by Mohammed Essam on 20/03/2025.
//

import Foundation
import XCTest
@testable import Countries

class MockListRepository: ListRepositoryContract {
    private let service: ListServiceContract

    init(service: ListServiceContract) {
        self.service = service
    }

    func fetchCountries() async throws -> [Country] {
        return try await service.fetchCountries()
    }
}
