//
//  ListViewModel.swift
//  CountriesModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation

class ListViewModel: ListViewModelContract {
    private let fetchCountriesUseCase: FetchListUseCaseContract

    @Published var countries: [Country] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    init(fetchCountriesUseCase: FetchListUseCaseContract = FetchListUseCaseImpl()) {
        self.fetchCountriesUseCase = fetchCountriesUseCase
    }
    
    func loadCountries() async {
        await manageLoading(true)

        do {
            let data = try await fetchCountriesUseCase.execute()
            await updateData(data)

        } catch {
            await manageError(error.localizedDescription)
        }
        
        await manageLoading(false)
    }
    
    private func manageLoading(_ state: Bool) async {
        await MainActor.run {
            isLoading = state
        }
    }
    
    private func manageError(_ error: String) async {
        await MainActor.run {
            errorMessage = error
        }
    }
    
    private func updateData(_ data: [Country]) async {
        await MainActor.run {
            countries = data
        }
    }
}
