//
//  FetchListUseCase.swift
//  CountriesModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation

final class FetchListUseCaseImpl: FetchListUseCaseContract {
    private let repository: ListRepositoryContract
    
    init(repository: ListRepositoryContract = ListRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute() async throws -> [Country] {
        return try await repository.fetchCountries()
    }
}
