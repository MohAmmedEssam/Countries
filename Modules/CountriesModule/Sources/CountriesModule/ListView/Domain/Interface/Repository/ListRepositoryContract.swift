//
//  ListRepositoryContract.swift
//  CountriesModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation

protocol ListRepositoryContract: Sendable {
    func fetchCountries() async throws -> [Country]
}
