//
//  MockListViewModel.swift
//  CountriesTests
//
//  Created by Mohammed Essam on 20/03/2025.
//

import Foundation
import XCTest
@testable import Countries

class MockListViewModel: ListViewModelContract {
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
}
