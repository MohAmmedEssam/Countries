//
//  MockListRepository.swift
//  CountriesTests
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import XCTest
@testable import CountriesModule

final class MockListRepository: ListRepositoryContract {
    private let service: ListServiceContract

    init(service: ListServiceContract) {
        self.service = service
    }

    func fetchCountries() async throws -> [Country] {
        return try await service.fetchCountries()
    }
}
