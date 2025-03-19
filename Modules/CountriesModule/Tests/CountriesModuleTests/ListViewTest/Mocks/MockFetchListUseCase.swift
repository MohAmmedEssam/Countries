//
//  MockFetchListUseCase.swift
//  CountriesTests
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import XCTest
@testable import CountriesModule

final class MockFetchListUseCase: FetchListUseCaseContract {
    private let repository: ListRepositoryContract

    init(repository: ListRepositoryContract) {
        self.repository = repository
    }

    func execute() async throws -> [Country] {
        return try await repository.fetchCountries()
    }
}
