//
//  MockListViewModel.swift
//  CountriesTests
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import XCTest
@testable import CountriesModule

final class MockListViewModel: ListViewModelContract {
    
    @Published var countries: [Country] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private let useCase: FetchListUseCaseContract

    init(useCase: FetchListUseCaseContract) {
        self.useCase = useCase
    }

    func loadCountries() async {
        isLoading = true
        do {
            let data = try await useCase.execute()
            countries = data
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    func removeCountry(_ country: Country) {
        countries.removeAll { $0 == country }
    }
    
    func addCountry(_ country: Country) {
        countries.insert(country, at: 0)
    }
    
    func fetchCountryName() async -> String? {
        return nil
    }
}
