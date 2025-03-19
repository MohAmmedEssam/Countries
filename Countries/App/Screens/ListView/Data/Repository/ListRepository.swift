//
//  File.swift
//  CountriesModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation

class ListRepositoryImpl: ListRepositoryContract {
    private let service: ListServiceContract
    
    init(service: ListServiceContract = ListServiceImpl()) {
        self.service = service
    }
    
    func fetchCountries() async throws -> [Country] {
        return try await service.fetchCountries()
    }
}
