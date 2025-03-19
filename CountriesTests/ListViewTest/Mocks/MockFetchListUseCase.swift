//
//  MockFetchListUseCase.swift
//  CountriesTests
//
//  Created by Mohammed Essam on 20/03/2025.
//

import Foundation
import XCTest
@testable import Countries

class MockFetchListUseCase: FetchListUseCaseContract {
    private let repository: ListRepositoryContract

    init(repository: ListRepositoryContract) {
        self.repository = repository
    }

    func execute() async throws -> [Country] {
        return try await repository.fetchCountries()
    }
}
