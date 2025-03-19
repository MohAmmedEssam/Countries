//
//  ListServiceContract.swift
//  CountriesModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation

protocol ListServiceContract: Sendable {
    func fetchCountries() async throws -> [Country]
}
