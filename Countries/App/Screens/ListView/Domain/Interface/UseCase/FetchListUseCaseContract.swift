//
//  FetchListUseCaseContract.swift
//  CountriesModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation

protocol FetchListUseCaseContract {
    func execute() async throws -> [Country]
}
